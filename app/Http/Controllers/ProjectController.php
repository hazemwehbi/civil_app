<?php

namespace App\Http\Controllers;
use App\RequestType;
use App\Category;
use App\Components\User\Models\User;
use App\Customer;
use App\Http\Util\CommonUtil;
use App\Notifications\ProjectCreatedNotification;
use App\Project;
use App\ProjectMember;
use App\ProjectMilestone;
use App\ProjectTask;
use App\ProjectTaskMember;
use App\Transaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Notification;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;
use App\ProjectRequest;
use App\VisitRequest;
use App\Agency;
use App\Location;
class ProjectController extends Controller
{
    /**
     * All Utils instance.
     */
    protected $commonUtil;

    /**
     * Constructor.
     *
     * @param CommonUtil
     */
    public function __construct(CommonUtil $commonUtil)
    {
        $this->CommonUtil = $commonUtil;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = $request->user();

        $projects = Project::with('customer', 'categories', 'members', 'members.media','location','agency');

        if (!$user->hasRole('superadmin')) {
            //If employee then get projects assigned or lead.
            // if ($user->is_employee) {
            //     $project_ids = $this->CommonUtil->getAssignedProjectForEmployee($user->id);
            //     $projects->orWhere('projects.lead_id', $user->id)
            //         ->orWhereIn('projects.id', $project_ids);
            // }

            //If customer, then get project for that customer.
            //if ($user->is_client) {
                $projects->Where('customer_id', $user->id);
           // }
        }

        $projects = $projects->withCount(['tasks',
                        'tasks as completed_task' => function ($query) {
                            $query->where('is_completed', 1);
                        },
                        'tasks as overdue_task' => function ($query) use ($user) {
                            $query->where('is_completed', 0)
                            ->where('due_date', '<', \Carbon::now())
                            ->whereHas('taskMembers', function ($q) use ($user) {
                                $q->where('user_id', $user->id);
                            });
                        }]);

        if (!empty($request->input('status'))) {
            $projects->where('status', $request->input('status'));
        }
        if (!empty($request->input('category_id'))) {
            $category_id = $request->input('category_id');
            $projects->whereHas('categories', function ($q) use ($category_id) {
                $q->where('category_id', $category_id);
            });
        }
        if (!empty($request->input('customer_id'))) {
            $projects->where('customer_id', $request->input('customer_id'));
        }
        if (!empty($request->input('user_id'))) {
            $user_id = $request->input('user_id');
            $projects->whereHas('members', function ($q) use ($user_id) {
                $q->where('user_id', $user_id);
            });
        }
        $result = $projects->latest()
                    ->simplePaginate(10);

        //Append is_favorited to each project and avatar
        foreach ($result as $key => $val) {
            $result[$key] = $val->append('is_favorited');
        }
        
        $status = Project::getStatusForProject();

        $data = ['status' => $status, 'projects' => $result];

        return $data;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!request()->user()->can('project.create')) {
            abort(403, 'Unauthorized action.');
        }

        $customers =User::getUsersForDropDown() ;//Customer::getCustomersForDropDown();
        $users = User::getUsersForDropDown();
        $billingTypes = Project::getBillingTypes();
        $status = Project::getStatusForProject();
        $categories = Category::forDropdown('projects');

        $buildingTypes = Project::getBuildingTypes();
        $buildUsing = Project::getBuildingUsing();

        $project = [
                'customers' => $customers,
                'users' => $users,
                'billingTypes' => $billingTypes,
                'status' => $status,
                'categories' => $categories,
                'buildingTypes'=>$buildingTypes,
                'buildUsing'=>$buildUsing,
                'roles_number'=>$this->CommonUtil->getRolesNumber(),
            ];

        return $project;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!request()->user()->can('project.create')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            //TODO: optimise the process.
            DB::beginTransaction();

            $project_data = $request->only(
                'name',
                'customer_id',
                'billing_type',
                'total_rate',
                'price_per_hours',
                'estimated_hours',
                'estimated_cost',
                'status',
                'lead_id',
                'description',
                'start_date',
                'end_date'
            );

            $project_data['created_by'] = $request->user()->id;
            $project_data['created_by'] = $request->user()->id;
            $project = Project::create($project_data);

            //Add members
            $project_members = $request->input('user_id');
            array_push($project_members, $project_data['lead_id']);
            $project->members()->sync($project_members);

            //Add category
            $category = $request->input('category_id');
            $project->categories()->sync($category);

            // $roles = $this->CommonUtil->createRoleAndPermissionsForProject($project->id);

            //Assign project member role
            // $users = User::find($project_members);
            // foreach ($users as $user) {
            //     $user->assignRole($roles['member']);
            // }
            //Assign lead role
          //  $project_lead = User::find($project_data['lead_id']);
         //   $project_lead->assignRole($roles['lead']);

            //Assign roles to customer contacts
            if (!empty($project_data['customer_id'])) {
                $contacts = User::find($project_data['customer_id'])
                                ->contacts;
             ///   foreach ($contacts as $contact) {
              ///      $contact->assignRole($roles['customer']);
              //  }
            }

            DB::commit();

            $this->_saveProjectCreatedNotifications($project_members, $project->id);

            $output = $this->respondSuccess(__('messages.saved_successfully'));
        } catch (\Exception $e) {
            DB::rollBack();
            $output = $this->respondWentWrong($e);
        }

        return $output;
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (!request()->user()->can('project.'.$id.'.overview')) {
            abort(403, 'Unauthorized action.');
        }

        $project = Project::with('customer', 'lead', 'lead.media', 'tasks', 'categories', 'members', 'members.media')
                            ->withCount(['tasks',
                                'tasks as completed_task' => function ($query) {
                                    $query->where('is_completed', 1);
                                }, ])
                            ->find($id);

        $task_count = ProjectTask::where('project_id', $id)
                        ->where('is_completed', 0)
                        ->count();

        $milestone_count = ProjectMilestone::where('project_id', $id)
                                            ->count();

        $invoice_count = Transaction::OfTransaction('invoice')
                                ->where('project_id', $id)
                                ->where('status', 'final')
                                ->count();
        //chart data
        $project_task = ProjectTask::where('project_id', $id)
                    ->where('created_at', '>=', Carbon::now()->startOfMonth())
                    ->where('created_at', '<=', Carbon::now()->endOfMonth())
                    ->select(DB::raw('DATE(created_at) as date'), DB::raw('count(id) as task'))
                    ->groupBy('date')
                    ->get();

        $x_axis = [];
        $y_axis = [];
        foreach ($project_task as $task) {
            $x_axis[] = $task->date;
            $y_axis[] = $task->task;
        }

        $project_overview = [
                             'project' => $project,
                             'task' => $task_count,
                             'x_axis' => $x_axis,
                             'y_axis' => $y_axis,
                             'milestone' => $milestone_count,
                             'invoice' => $invoice_count,
                            ];

        return $project_overview;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */



    
    public function edit($id)
    {
        if (!request()->user()->can('project.'.$id.'.edit')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            $project = Project::with('categories')->findOrFail($id);

            $project_category_id = [];
            foreach ($project->categories as $category) {
                $project_category_id[] = $category->id;
            }

            $project_members = $this->getMembers($id);
            $customers = Customer::getCustomersForDropDown();
            $users = User::getUsersForDropDown();
            $billingTypes = Project::getBillingTypes();
            $status = Project::getStatusForProject();
            $categories = Category::forDropdown('projects');

            $output = [
                    'customers' => $customers,
                    'project' => $project,
                    'users' => $users,
                    'billingTypes' => $billingTypes,
                    'status' => $status,
                    'categories' => $categories,
                    'project_members' => $project_members,
                    'project_category_id' => $project_category_id,
                ];
        } catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }

        return $output;
    }



    public function  getProjectInfo($id){
        $project = Project::with('customer', 'categories', 'members', 'members.media','location','agency')->find($id);
        return $project;
    }
    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int                      $id
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if (!request()->user()->can('project.'.$id.'.edit')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            //TODO: optimise the process.
            DB::beginTransaction();

            $input = $request->only(
                'name',
                'customer_id',
                'billing_type',
                'total_rate',
                'price_per_hours',
                'estimated_hours',
                'estimated_cost',
                'status',
                'lead_id',
                'description',
                'start_date',
                'end_date'
            );

            $project = Project::with('members')->findOrFail($id);

            $project_lead = $project->lead_id;
            $customer = $project->customer_id;
            $members = $project->members;
            $project->update($input);

            //Update project members
            $project_members = $request->input('user_id');
            array_push($project_members, $input['lead_id']);
            $updated_members = $project->members()->sync($project_members);

            //remove task if member is removed.
            if (!empty($updated_members['detached'])) {
                ProjectTaskMember::join('project_tasks as pt', 'project_task_members.project_task_id', '=', 'pt.id')
                ->where('pt.project_id', $id)
                ->whereIn('user_id', $updated_members['detached'])
                ->delete();
            }

            //Update category
            $category = $request->input('category_id');
            $project->categories()->sync($category);

            //remove role of existing member
            $member_role = $this->CommonUtil->memberProjectRole($id);
            foreach ($members as $member) {
                $member->removeRole($member_role);
            }

            //Assign member role to newly added member
            $users = User::find($project_members);
            foreach ($users as $user) {
                $user->assignRole($member_role);
            }

            //Assign/remove lead role
            if ($project_lead != $input['lead_id']) {
                $lead_role = $this->CommonUtil->leadProjectRole($id);
                //remove role of existing lead
                $to_be_removed_project_lead = User::find($project_lead);
                $to_be_removed_project_lead->removeRole($lead_role);

                //assign role to lead
                $to_be_added_project_lead = User::find($input['lead_id']);
                $to_be_added_project_lead->assignRole($lead_role);

                array_push($updated_members['attached'], $input['lead_id']);
            }

            $customer_role = $this->CommonUtil->customerProjectRole($id);

            //remove roles of contacts
            if (!empty($customer)) {
                $to_be_removed_contacts = Customer::find($customer)
                            ->contacts;
                foreach ($to_be_removed_contacts as $contact) {
                    $contact->removeRole($customer_role);
                }
            }

            //Assign roles to customer contacts
            if (!empty($input['customer_id'])) {
                $to_be_added_contacts = Customer::find($input['customer_id'])
                    ->contacts;
                foreach ($to_be_added_contacts as $contact) {
                    $contact->assignRole($customer_role);
                }
            }

            DB::commit();
            //notify only newly assigned members
            if (!empty($updated_members['attached'])) {
                $this->_saveProjectCreatedNotifications($updated_members['attached'], $id);
            }

            $output = $this->respondSuccess(__('messages.updated_successfully'));
        } catch (Exception $e) {
            DB::rollBack();
            $output = $this->respondWentWrong($e);
        }

        return $output;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!request()->user()->can('project.delete')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            $request =  VisitRequest::where('project_id', $id)->first();
            if($request != null){
              return   $this->respondWithError('there is visit request related to project');
            }
            Project::destroy($id);
            ProjectMember::where('project_id', $id)
                        ->delete();
            VisitRequest::where('project_id', $id)
            ->delete();
            // Location::where('project_id', $id)
            //             ->delete();

            $output = $this->respondSuccess(__('messages.deleted_successfully'));
        } catch (\Exception $e) {
            $output = $this->respondWentWrong($e);
        }

        return $output;
    }

    /**
     * Mark the specified project As Favorite.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function markAsFavorite(Request $request)
    {
        try {
            $id = $request->get('id');
            $project = Project::findOrFail($id);

            $favorite = $request->get('favorite');
            if ('false' == $favorite) {
                $project->favorite();
                $favorite = true;
                $msg = __('messages.favorited');
            } elseif ('true' == $favorite) {
                $project->unfavorite();
                $favorite = false;
                $msg = __('messages.unfavorited');
            }

            $output = $this->respondSuccess($msg, ['favorite' => $favorite]);
        } catch (\Exception $e) {
            $output = $this->respondWentWrong($e);
        }

        return $output;
    }

    // Client add project request to superadmin 
    public function projectRequest(Request $request)
    {
        $projectRequest=ProjectRequest::create([
            'name'=> $request->name,
            'customer_id'=> User::find(\Auth::id())->customer_id,
            'description'=> $request->description,
           // 'user_id'=> $request->user_id,
            'start_date'=> $request->start_date,
            'end_date'=> $request->end_date,
            'license_number'=>$request->license_number,
            'authorization_request_number'=>$request->authorization_request_number,
            'type_of_request'=>$request->type_of_request,
            'plot_number'=>$request->plot_number,
            'cadastral_decision_number'=>$request->cadastral_decision_number,
            'status'=>'pending',
            'sent'=>$request->sent
        ]);
        return $this->respondSuccess('Request Sent');
    }

    /**
     * update the status of project.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function updateStatus(Request $request)
    {
        $id = $request->get('id');

        if (!request()->user()->can('project.'.$id.'.status')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            DB::beginTransaction();

            $project = Project::findOrFail($id);

            $status = $request->get('status');
            //Log activity
            activity()
                ->performedOn($project)
                ->withProperties(['from' => $project->status, 'to' => $status])
                ->log('status');

            $project->status = $status;
            $project->disableLogging();
            $project->update();

            DB::commit();

            $output = $this->respondSuccess(__('messages.updated_successfully'));
        } catch (\Exception $e) {
            DB::rollBack();
            $output = $this->respondWentWrong($e);
        }

        return $output;
    }

    /**
     * Get Project Members.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function getMembers($id)
    {
        $project_members = ProjectMember::where('project_id', $id)
                            ->pluck('user_id');

        if ('task' == request()->get('type')) {
            $project_members = User::whereIn('id', $project_members)
                                ->select('id', 'name')
                                ->get()
                                ->toArray();
        }

        return $project_members;
    }

    /**
     * save databse notification.
     *
     * @return \Illuminate\Http\Response
     */
    protected function _saveProjectCreatedNotifications($members, $project_id)
    {
        $notifiable_users = User::find($members);
        Notification::send($notifiable_users, new ProjectCreatedNotification($project_id));
    }

    /**
     * Get Project List.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return $projects
     */
    public function getProjectsList(Request $request)
    {
        if(isset($request->customer_id)){
            $projects = Project::select('id', 'name')
            ->where('customer_id',$request->customer_id)
            ->get()
            ->toArray();
        }else{
            $projects = Project::select('id', 'name')
                        ->get()
                        ->toArray();
        }
        return $projects;
    }

    /**
     * Get Customer for the
     * Project.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return $customer_id
     */
    public function getCustomerId($id)
    {
        $project = Project::find($id);

        return $project;
    }

    /**
     * get project statistics
     *
     * @return $project_statistics
     */
    public function getStatistics()
    {
        if (!request()->user()->can('project.create')) {
            abort(403, 'Unauthorized action.');
        }
        
        $project_statistics = Project::select(
            DB::raw("COALESCE(SUM(IF(status = 'not_started', 1, 0)), 0) as not_started"),
            DB::raw("COALESCE(SUM(IF(status = 'in_progress', 1, 0)), 0) as in_progress"),
            DB::raw("COALESCE(SUM(IF(status = 'on_hold', 1, 0)), 0) as on_hold"),
            DB::raw("COALESCE(SUM(IF(status = 'cancelled', 1, 0)), 0) as cancelled"),
            DB::raw("COALESCE(SUM(IF(status = 'completed', 1, 0)), 0) as completed"),
            DB::raw('count(*) as total')
            )
            ->first();

        return $this->respond($project_statistics);
    }

    public function getProjectRequest(Request $request)
    {


        // $rowsPerPage = ($request->get('rowsPerPage') > 0) ? $request->get('rowsPerPage') : 0;
        // $sort_by = $request->get('sort_by');
        // $descending = $request->get('descending');

        // if ($descending == 'false') {
        //     $orderby = 'asc';
        // } elseif ($descending == 'true') {
        //     $orderby = 'desc';
        // } elseif ($descending == '') {
        //     $orderby = 'desc';
        //     $sort_by = 'id';
        // }

        // // $roles = Role::where('type', 'employee')
        // //             ->select('name', 'created_at', 'id');
       // with another group
       $user=User::find(request()->user()->id);
       if($user->hasRole('superadmin')){
        $requests =  VisitRequest::with('customer', 'project')->where('request_type','visit_request')->get()
        ->toArray();
       }
       else{
        $requests =  VisitRequest::with('customer', 'project')->where([['request_type','visit_request'],['customer_id',$user->id]])->orWhere([['request_type','visit_request'],['office_id',$user->id]])->get()
        ->toArray();
       }

                    
        // // if (!empty($request->get('name'))) {
        // //     $term = $request->get('name');
        // //     $roles->where('name', 'like', "%$term%");
        // // }

        // $roles = $roles->orderBy($sort_by, $orderby)
        //             ->paginate($rowsPerPage);
    
        return $this->respond($requests);


        // $user=User::find(request()->user()->id);
        // if($user->hasRole('superadmin')){
        //     $requests=User::with(['visitRequests'=>function ($query) { 
        //         $query->where('sent', 1); }
        //         ]);
        //         // This code for get projects request
        //         //->with(['projectrequest'=>function ($query) { 
        //        //     $query->where('sent',1); 
        //       //  }]);
        //     $data=$requests->latest()->simplePaginate(10);
        //     return $this->respond($data);
        // }else{
        //   //  $user=User::find(request()->user()->id);
        //     $customerquery=User::query();
        //    // $c=User::find($user->customer_id);
        //     $customerquery->where('id',request()->user()->id);
        //     $customerquery->whereHas('visitRequests')->with('visitRequests');
        //   //  $customerquery->whereHas('projectrequest')->with('projectrequest');
        //     $data=$customerquery->latest()->simplePaginate(10);
        //     return $this->respond($data);
        // }        
    }

    public function deleteRequest($id)
    {
        try{
            if(VisitRequest::find($id)){
                VisitRequest::destroy($id);
            }else{
                ProjectRequest::destroy($id);
            }
            $output = $this->respondSuccess(__('messages.deleted_successfully'));
        }catch(\Exception $e){
            $output = $this->respondWentWrong($e);
        }
        return $output;
    }
    public function acceptProject(Request $request)
    {
        if($request->status=="new"){
            $project=VisitRequest::find($request->id);
        }else{
            $project=ProjectRequest::find($request->id);
        }
        $project->status="accepted";
        $project->save();
    }

    public function getCustomerProject(Request $request)
    {
        $user=User::find(request()->user()->id);

        if (!$user->hasRole('superadmin')) { 
        $projects=Project::select('id', 'name')
                        ->where('customer_id',Auth::id())
                        ->get()
                        ->toArray();
  //      $projectRequest=ProjectRequest::select('id', 'name')
    //                                   ->where('customer_id',$user->customer_id)
      //                                 ->get()
        //                               ->toArray();
        }else{
            $projects=Project::select('id', 'name')
                        ->get()
                        ->toArray();
   //         $projectRequest=ProjectRequest::select('id', 'name')
     //                   ->get()
       //                 ->toArray();
        }
    //    return array_merge($projects,$projectRequest);        
        return $projects;
    }

    public function addVisitRequest(Request $request)
    {
     
        if($request->customer_id==null){
            $user_id=Auth::id();
        }else{
            $user_id=$request->customer_id;
        }
        $customer_id=$user_id;//User::find($user_id)->customer_id;
        
        if($request->priority==null){
            $priority='medium';
           
        }else{
            $priority=$request->priority;
        }

        $user = $request->user();

        // if(!$user->hasRole('superadmin')){
             $status=config('enums.visit_request_status.new');
        // }
        // else{
        //     $status=config('enums.visit_request_status.accepted');
        // }

        $projects = Project::with('customer', 'categories', 'members', 'members.media');


        DB::table('visit_requests')->insert([
            'title'=>$request->title,
            'customer_id'=>$customer_id,
            'project_id'=>$request->project_id,
            'request_type'=>$request->request_type,
            'description'=>$request->description,
            'status'=>$status,
            'priority'=>$priority,
            'sent'=>$request->sent,
            'office_id'=>$request->office_id,
            'created_at'=>Carbon::now()
        ]);

        // if (!$user->hasRole('superadmin')) {

        // }else{
        //     DB::table('visit_requests')->insert([
        //         'title'=>$request->title,
        //         'customer_id'=>$customer_id,
        //         'project_id'=>$request->project_id,
        //         'request_type'=>$request->request_type,
        //         'description'=>$request->description,
        //         'status'=>'accepted',
        //         'priority'=>$priority,
        //         'sent'=>$request->sent
                
        //     ]);
        // }
        return $this->respondSuccess(__('messages.saved_successfully'));
    }

    public function getVisitRequestType($id)
    {
        $type=RequestType::find($id);
        return response()->json(['data'=>$type->name]);
    }

    public function getAllCustomer()
    {
        // $customers=User::whereNotNull('customer_id')
        //         ->select('id', 'name')
        //         ->get()
        //         ->toArray();
    $customers=User::select('id', 'name','email','mobile','id_card_number') ->get()->toArray();
                
              
               
        return $customers;
    }

    public function confirmSendRequest(Request $request)
    {
        if(isset($request->title)){
            $visitRequest=VisitRequest::find($request->id);
            $visitRequest->sent=1;
            $visitRequest->save();
        }else{
            $projectRequest=ProjectRequest::find($request->id);
            $projectRequest->sent=1;
            $projectRequest->save();
        }
    }

    public function editVisitRequest(Request $request)
    {
        try{
            $visitRequest=VisitRequest::find($request->id);
            $visitRequest->title=$request->title;
            $visitRequest->customer_id=$request->customer_id;
            $visitRequest->project_id=$request->project_id;
            $visitRequest->request_type=$request->request_type;
            $visitRequest->description=$request->description;
            if(isset($request->priority)){
                $visitRequest->priority=$request->priority;
            }
            if(isset($request->status)){
                $visitRequest->status=$request->status;
            }
            $visitRequest->save();
            $output = $this->respondSuccess(__('messages.updated_successfully'));
        }catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }

        return $output;
        
    }

    public function editProjectRequest(Request $request)
    {
        try{
            $projectRequest=ProjectRequest::find($request->id);
            $projectRequest->name=$request->name;
            $projectRequest->description=$request->description;
            $projectRequest->start_date=$request->start_date;
            $projectRequest->end_date=$request->end_date;

            $projectRequest->license_number=$request->license_number;
            $projectRequest->authorization_request_number=$request->authorization_request_number;
            
            $projectRequest->plot_number=$request->plot_number;
            $projectRequest->cadastral_decision_number=$request->cadastral_decision_number;

            $projectRequest->save();
            $output = $this->respondSuccess(__('messages.updated_successfully'));
        }catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }

        return $output;
    }
    
    // public function getProjectInfo(Request $request)
    // {
    //     $project=Project::find($request->project_id);
        
    //     return $project;
    // }


    public function getProjectData(Request $request)
    {
        $project=Project::find($request->project_id);
        $data=[
            'using_types'=>$this->CommonUtil->getUsingBuilding(),
             'roles_number'=>$this->CommonUtil->getRolesNumber(),
             'building_types'=>$this->CommonUtil->getBuildingTypes(),
        ];
        return $data;
    }

    public function addAgency(Request $request){
        try {
            $agency=Agency::create([
                'trade_name'=>$request->trade_name,
                'record_number'=>$request->record_number,
                'delegate_record'=>$request->delegate_record,
                'agency_number'=>$request->agency_number,
                'agent_name'=>$request->agent_name,
                'agent_card_number'=>$request->agent_card_number,
                'email'=>$request->email,
                'mobile'=>$request->mobile,
                 'user_id'=>Auth::id()
            ]);
                return $agency;
            }
            catch (Exception $e) {
                $output = $this->respondWentWrong($e);
                return $output;
              
            }

       // return $this->respond($data);
    }
// ":2,"project_id":0,"created_at":"2021-12-15 22:26:18","updated_at":"2021-12-15 22:26:18"},{"id":7,"trade_name":"a","record_number":0,"delegate_record":"wqe","agency_number":0,"agent_name":"wqe","agent_card_number":0,"email":"test@example.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:20:36","updated_at":"2021-12-15 22:20:36"},{"id":2,"trade_name":"er","record_number":4334,"delegate_record":null,"agency_number":0,"agent_name":"wer","agent_card_number":0,"email":"435@gmail.com","mobile":"43534","user_id":2,"project_id":0,"created_at":"2021-12-15 22:03:15","updated_at":"2021-12-15 22:03:15"},{"id":13,"trade_name":"erter","record_number":0,"delegate_record":"tre","agency_number":0,"agent_name":"rt","agent_card_number":0,"email":"test@example.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:30:17","updated_at":"2021-12-15 22:30:17"},{"id":16,"trade_name":"ewtw","record_number":0,"delegate_record":"twet","agency_number":0,"agent_name":"ewt","agent_card_number":0,"email":"test@example.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:32:34","updated_at":"2021-12-15 22:32:34"},{"id":8,"trade_name":"fdg","record_number":34534,"delegate_record":"ewr","agency_number":0,"agent_name":"ewr","agent_card_number":0,"email":"test@example.com","mobile":"45","user_id":2,"project_id":0,"created_at":"2021-12-15 22:21:26","updated_at":"2021-12-15 22:21:26"},{"id":11,"trade_name":"mehyaaa","record_number":0,"delegate_record":"rt","agency_number":null,"agent_name":"ret","agent_card_number":0,"email":"test@gmail.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:25:06","updated_at":"2021-12-15 22:25:06"},{"id":10,"trade_name":"ret","record_number":0,"delegate_record":"ret","agency_number":0,"agent_name":"ert","agent_card_number":0,"email":"test@example.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:23:43","updated_at":"2021-12-15 22:23:43"},{"id":14,"trade_name":"ret","record_number":0,"delegate_record":"ret","agency_number":0,"agent_name":"ret","agent_card_number":0,"email":"test@example.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:30:45","updated_at":"2021-12-15 22:30:45"},{"id":15,"trade_name":"rewr","record_number":0,"delegate_record":"rewr","agency_number":0,"agent_name":"ewrwe","agent_card_number":0,"email":"test@example.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:31:22","updated_at":"2021-12-15 22:31:22"},{"id":3,"trade_name":"sad","record_number":0,"delegate_record":null,"agency_number":4234,"agent_name":"ewr","agent_card_number":32423,"email":"test@example.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:06:33","updated_at":"2021-12-15 22:06:33"},{"id":9,"trade_name":"sdf","record_number":0,"delegate_record":"er","agency_number":0,"agent_name":"rewrwe","agent_card_number":0,"email":"test@example.com","mobile":"0938435134","user_id":2,"project_id":0,"created_at":"2021-12-15 22:22:06","updated_at":"2021-12-15 22:22:06"},{

    public function getAgencies($user_id=0){
        $agencies=[];
        if($user_id!=0){
            $agencies = Agency::where('user_id',$user_id)
           ->select('id','trade_name','record_number','delegate_record','agency_number','agent_name','agent_card_number','email','mobile')->
            orderBy('trade_name')
            ->get()
            ->toArray();
        }
         else{
        
            $agencies = Agency::
            orderBy('trade_name')
            ->get()
            ->toArray();
         }

       return $agencies;
       // return $this->respond($data);
    }


   public function  addNewProject(Request $request){
    if (!request()->user()->can('project.create')) {
        abort(403, 'Unauthorized action.');
    }
    $project = $request['project'];
    $location = $request['location'];
    $customers = $request['customers'];
    $agency_id= $request['agency_id'];
    try {
        //TODO: optimise the process.
        DB::beginTransaction();

       
        //$location['created_by'] = $request->user()->id;
       $location_data= Location::create($location);


        $project_data = $project;
        //$project_data['status']='not_started';
        $project_data['customer_id']=$customers[0]['id'];
        $project_data['location_id'] = $location_data->id;
        $project_data['agency_id'] = $agency_id;
        
    //$customer->id ?? Auth::id();
        $project_data['created_by'] = $request->user()->id;
        $project = Project::create($project_data);

        //Add members
        $project_members = $request['users_id'];
        array_push($project_members);
        $project->members()->sync($project_members);

        //Add category
       // $category = $project['category_id'];
       // $project->categories()->sync($category);

        $roles = $this->CommonUtil->createRoleAndPermissionsForProject($project->id);

        //Assign project member role
        $users = User::find($project_members);
        foreach ($users as $user) {
            $user->assignRole($roles['member']);
        }
        //Assign lead role
        //  $project_lead = User::find($project_data['lead_id']);
        //   $project_lead->assignRole($roles['lead']);

        //Assign roles to customer contacts
        if (!empty($project_data['customer_id'])) {
            $contacts = User::find($project_data['customer_id'])
                            ->contacts;
        ///   foreach ($contacts as $contact) {
        ///      $contact->assignRole($roles['customer']);
        //  }
        }

            DB::commit();

            $this->_saveProjectCreatedNotifications($project_members, $project->id);

            $output = $this->respondSuccess(__('messages.saved_successfully'));





        $output = $this->respondSuccess(__('messages.saved_successfully'));
        DB::commit();
    } catch (\Exception $e) {
        DB::rollBack();
        $output = $this->respondWentWrong($e);
      
    }
    return $output;
   }


   public function  editNewProject(Request $request){
    if (!request()->user()->can('project.edit')) {
        abort(403, 'Unauthorized action.');
    }



    $project_data = $request['project'];
    $location_data = $request['location'];
    $customers_data = $request['customers'];
    $agency_id= $request['agency_id'];
    try {
        //TODO: optimise the process.
        DB::beginTransaction();


        $location=Location::find($location_data['id']);
       
        $location->update($location_data);
     
        $project=Project::findOrFail($project_data['id']);

        $project->status =$project_data['status'];
        $project-> customer_id =$customers_data[0]['id'];
        $project-> agency_id =$agency_id;
        $project->name=$project_data['name'];

        $project->buiding_type=$project_data['buiding_type'];
        $project->role_number=$project_data['role_number'];
        $project->unit_number=$project_data['unit_number'];
        $project->build_rate=$project_data['build_rate'];
        $project->using=$project_data['using'];
        $project->name=$project_data['name'];
        $project->billing_type=$project_data['billing_type'];
        $project->total_rate=$project_data['total_rate'];
        $project->authorization_request_number=$project_data['authorization_request_number'];
        $project->license_number=$project_data['license_number'];
        //  type_of_request:'',
        $project->plot_number=$project_data['plot_number'];
        $project->cadastral_decision_number= $project_data['cadastral_decision_number'] ;
        $project->start_date=$project_data['start_date'] ;
        $project->end_date=$project_data['end_date'] ;
        // customer_id:null,
      //  $project->users_id= $project_data['users_id'] ;
        $project->description= $project_data['description'] ;
       // $project->lead_id=$project_data['lead_id'] ;
        $project->status=$project_data['status'] ;
       // self.id=data.id;
        $project->update();

        ProjectMember::where('project_id',$project_data['id'])->delete();
        $project_members = $request['users_id'];
        array_push($project_members);
        $project->members()->sync($project_members);
        //Add members
        // $project_members = $request['users_id'];
        // array_push($project_members, $project_data['lead_id']);
        // $project->members()->sync($project_members);

        //Add category
       // $category = $project['category_id'];
       // $project->categories()->sync($category);

     //   $roles = $this->CommonUtil->createRoleAndPermissionsForProject($project->id);

        //Assign project member role
        // $users = User::find($project_members);
        // foreach ($users as $user) {
        //     $user->assignRole($roles['member']);
        // }
        //Assign lead role
        //  $project_lead = User::find($project_data['lead_id']);
        //   $project_lead->assignRole($roles['lead']);

        //Assign roles to customer contacts
        // if (!empty($project_data['customer_id'])) {
        //     $contacts = User::find($project_data['customer_id'])
        //                     ->contacts;
        // ///   foreach ($contacts as $contact) {
        ///      $contact->assignRole($roles['customer']);
        //  }
       // }

            DB::commit();

         //   $this->_saveProjectCreatedNotifications($project_members, $project->id);


        $output = $this->respondSuccess(__('messages.saved_successfully'));
        DB::commit();
    } catch (\Exception $e) {
        DB::rollBack();
        $output = $this->respondWentWrong($e);
      
    }
    return $output;
   }
   public function getLocationStatus(Request $request)
   {
       $location_status = [
           [
               'key' => 'not_started',
               'value' => __('messages.not_started')
           ],
           [
               'key' => 'in_progress',
               'value' => __('messages.in_progress')
           ],
           [
               'key' => 'on_hold',
               'value' => __('messages.on_hold')
           ],
           [
               'key' => 'cancelled',
               'value' => __('messages.cancelled')
           ],
           [
               'key' => 'completed',
               'value' => __('messages.completed')
           ],
       ];
       return  $location_status;

   }


   public function  getProject ($id){
    $project=Project::find($id);
    return $project;
   }

}