<?php

namespace App\Http\Controllers;
use App\Http\Util\CommonUtil;
use Illuminate\Http\Request;
use App\RequestType;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\ProjectMember;
use App\Components\User\Models\User;
use App\Notifications\ProjectCreatedNotification;
use Notification;
use App\VisitRequest;
use App\DefaultEnginnersRequest;
use App\Http\Responses\Response;
class RequestTypeController extends Controller
{
    protected $commonUtil;

    public function __construct(CommonUtil $commonUtil)
    {
        $this->CommonUtil = $commonUtil;
    }


    public function index(Request $request)
    {

        $types=RequestType::select('id', 'name')
                        ->get()
                        ->toArray();
                return $types;
    }

    
    public function store(Request $request)
    {
        try {
            if($request->customer_id==null){
                $user_id=Auth::id();
        }else{
                $user_id=$request->customer_id;
            }
            $customer_id=$user_id;//User::find($user_id)->customer_id;
            
            // if($request->priority==null){
            //     $priority='medium';
               
            // }else{
            //     $priority=$request->priority;
            // }
    
            $user = $request->user();
    
            // if(!$user->hasRole('superadmin')){
                // $status=config('enums.visit_request_status.new');
            // }
            // else{
            //     $status=config('enums.visit_request_status.accepted');
            // }
    
    //        $projects = Project::with('customer', 'categories', 'members', 'members.media');
             // echo \json_encode($request->enginnering_type);
              //die();
              DB::beginTransaction();
            DB::table('visit_requests')->insert([
                //'title'=>$request->title,
                'customer_id'=>$customer_id,
                'project_id'=>$request->project_id,
                'request_type'=>'visit_request',//$request->request_type,
                'description'=> 'test',//$request->description,
                'status'=> $request->sent==0 ? 'new' : 'sent',
                'dead_line_date'=>$request->dead_line_date,
               // 'priority'=>$priority,
                'sent'=>$request->sent,
                'office_id'=>$request->office_id,
                'note'=>$request->note,
                'enginnering_type'=>json_encode($request->enginnering_type),
                'created_at'=>Carbon::now()
            ]);
            DB::commit();
            $this->_saveProjectCreatedNotifications([$request->office_id], $request->project_id);
            return $this->respondSuccess(__('messages.saved_successfully'));
            }

         catch (Exception $e) {
            $output = $this->respondWentWrong($e);
        }

    }


    

    public function show($id)
    {
        if (!request()->user()->can('tickets.edit')) {
            abort(403, 'Unauthorized action.');
        }
        $request = VisitRequest::findOrFail($id);
        $enginnering_types=$this->CommonUtil->getEnginneringTypes();
        $request_types=$this->CommonUtil->getRequestsTypes();
        $data = [
                    'request' => $request,
                    'enginnering_types' => $enginnering_types,
                    'request_types' => $request_types,
                ];

        return $this->respond($data);
    }


       /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
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
        $lang = $request->header('lang');
        if (!isset($lang)) {
            $lang = "en";
        }   
          if ($lang == "ar") {
            if (!isset($request->enginners) ||!isset($request->default_enginners)  ) {
                return Response::respondError('حقل وقت المهندس مطلوب ');
            }
    

            }
            if ($lang == "en") {
                if (!isset($request->enginners) || !isset($request->default_enginners) ) {
                    return Response::respondError('The field "Enginner" is required ');
                }
             
            }
            try{
                DB::beginTransaction();
            $visit_request=VisitRequest::find($request->id);
        $visit_request->status="accepted";
        if(isset($request->dead_line_date)){
            $visit_request->dead_line_date=$request->dead_line_date;
        }
       $visit_request->save();
        if(isset($request->default_enginners)){
            foreach ($request->default_enginners as $item ) {
                if(!empty($item['enginner_id'])){
                    DB::table('project_members')->insert([
                        'user_id'=>$item['enginner_id'],
                        'project_id'=>$visit_request->project_id,
                        'is_default'=> isset($item['is_default']) ? $item['is_default'] : 0,
                    ]);
                }
                
            }
        }
        if(isset($request->enginners)){
                foreach ($request->enginners as $item ) {
                    if(!ProjectMember::where('project_id',$visit_request->project_id)->where('user_id', $item)->first()){
                            DB::table('project_members')->insert([
                                'user_id'=>$item,
                                'project_id'=>$visit_request->project_id,
                                'id_default'=>  0,
                            ]);
                   }
               
            }
           
        }

        
    
    DB::commit();
        return Response::respondSuccess(__('messages.updated_successfully'));
       // return $this->respondSuccess();
        }

        catch (Exception $e) {
            $output = $this->respondWentWrong($e);
           return Response::respondError($e);
         }
         ;
       
    }



    public function getPriority(Request $request)
    {
        $priority = [
            [
                'key' => 'low',
                'value' => __('messages.low')
            ],
            [
                'key' => 'medium',
                'value' => __('messages.medium')
            ],
            [
                'key' => 'high',
                'value' => __('messages.high')
            ],
            [
                'key' => 'urgent',
                'value' => __('messages.urgent')
            ]
        ];
        return  $priority;
    }

    public function getRequestsTypes($append_all = false)
    {
        $requestTypes = [
            [
                'key' => 'visit_request',
                'value' => __('data.visit_request')
            ],
            [
                'key' => 'design_request',
                'value' => __('data.design_request')
            ],
            [
                'key' => 'support_service_request',
                'value' => __('data.support_service_request')
            ],
            [
                'key' => 'contractor_request',
                'value' => __('data.contractor_request')
            ],
            [
                'key' => 'supervision_request',
                'value' => __('data.supervision_request')
            ],
        ];
        return  $requestTypes;

    }



    public function getEnginneringTypes($append_all = false)
    {
        $enginneringTypes = [
            [
                'key' => 'civil_enginnering',
                'value' => __('data.civil_enginnering')
            ],
            [
                'key' => 'it_enginnering',
                'value' => __('data.it_enginnering')
            ],
            [
                'key' => 'architectural_enginnering',
                'value' => __('data.architectural_enginnering')
            ],
           
        ];
        return  $enginneringTypes;

    }
  

    public function getRequesStatus()
    {
        return $this->CommonUtil->getVisitRequestStatus();
      
    }
    protected function _saveProjectCreatedNotifications($members, $project_id)
    {
        foreach ($members as $member){
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new ProjectCreatedNotification($project_id));
        }
    }
}
