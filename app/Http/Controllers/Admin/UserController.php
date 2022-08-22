<?php
namespace App\Http\Controllers\Admin;

use App\Components\Core\Utilities\Helpers;
use App\Components\User\Models\User;
use App\Components\User\Repositories\UserRepository;
use App\Notifications\EmployeeAdded;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;
use App\Notifications\AskPermissionNotification;
use Notification;
use Illuminate\Support\Facades\Redirect;
use App\Http\Responses\Response;
use App\OfficeDetaile;
use Illuminate\Support\Facades\File;

class UserController extends AdminController
{
    /**
     * @var UserRepository
     */
    private $userRepository;

    /**
     * UserController constructor.
     * @param UserRepository $userRepository
     */
    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {     
        if (!request()->user()->can('employee.view')) {
            abort(403, 'Unauthorized action.');
        }


        $rowsPerPage = ($request->get('rowsPerPage') > 0) ? $request->get('rowsPerPage') : 0;
        $sort_by = $request->get('sort_by');
        $descending = $request->get('descending');

        if ($descending == 'false') {
            $orderby = 'asc';
        } elseif ($descending == 'true') {
            $orderby = 'desc';
        } elseif ($descending == '') {
            $orderby = 'desc';
            $sort_by = 'id';
        }

        // $roles = Role::where('type', 'employee')
        //             ->select('name', 'created_at', 'id');
        $user=Auth::user();
       
             $users = User::with('roles');
      


        

        if (!empty($request->get('name'))) {
            $term = $request->get('name');
            $users->where('name', 'like', "%$term%");
        }
        if (!empty($request->get('email'))) {
            $term = $request->get('email');
            $users->where('email', 'like', "%$term%");
        }

        $users = $users->orderBy($sort_by, $orderby)
                    ->paginate($rowsPerPage);

  
        return $this->respond($users);


    //     $params=request()->all();
    //     $params['parent_id']=Auth::id();
       
    //    $data = $this->userRepository->listUsers($params);
   
    //    return $this->respond($data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!request()->user()->can('employee.create')) {
            abort(403, 'Unauthorized action.');
        }

        $gender_types = User::getGenders();

        $roles = User::getRolesForCreateEmployee();
        
        return $this->respond(['gender_types' => $gender_types, 'roles' => $roles]);
    }





 
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    private function getBase64Content($data)
{
    list($type, $data) = explode(';', $data);
    list(, $data) = explode(',', $data);
    $data = base64_decode($data);

    return $data;
}
    public function store(Request $request)
    {
        if (!request()->user()->can('employee.create')) {
            abort(403, 'Unauthorized action.');
        }

        $validate = validator($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'id_card_number' => 'required|unique:users',
            'password' => 'required',
        ],
        [
            'required'  => 'The :attribute field is required.',
            'unique'    =>':attribute is already used',
            'email'    => ':attribute  not email'
        ]
    );

      
        if ($validate->fails()) {
            return $this->respondWithError($validate->errors()->first());
        }

        try {
            DB::beginTransaction();

            $input = $request->only('name', 'email', 'mobile', 'alternate_num', 'home_address', 'current_address', 'skype', 'linkedin', 'facebook', 'twitter', 'birth_date', 'guardian_name', 'gender', 'note', 'password', 'active', 'account_holder_name', 'account_no', 'bank_name', 'bank_identifier_code', 'branch_location', 'tax_payer_id','id_card_number','title');
            $input['parent_id']=Auth::id(); 

            $input['isActive']=1; 
            
            if(isset($request->enginnering_type))
               $input['enginnering_type']=json_encode($request->enginnering_type);
            /** @var User $user */
            
            $user = $this->userRepository->create($input);
            if($request->hasFile('file'))
            $user->addMedia($request->file)->toMediaCollection('logo');
            if($request->signature){
                $user->addMediaFromBase64($request->signature)->usingFileName('signature'.time().'.png')->toMediaCollection('signature');
            }
            
            //assign role to employee
            $role_ids = $request->input('role');
            $role_ids = explode(',' ,$role_ids);
            if (!empty($role_ids)) {
                foreach($role_ids as $role_id){
                    $role = Role::findOrFail($role_id);
                    if(!Auth::user()->hasRole('superadmin') && $role->is_primary  && !$user->hasRole($role->name)){
                        
                                return $this->respondWithError(__('data.not_permiision_to_assign_primary_role'));
                    }
                    else{
                      $user->assignRole($role);
                    }
                }
            }
            if(count($role_ids)==1){
                $role = Role::findOrFail($role_ids[0]);
                $user->user_type_log = $role->type;
                $user->save();
            //    dd($role->type,$user->user_type_log);
            }
            if(count($role_ids)==1 && $role_ids[0]==7){
                $user->user_type_log = 'ENGINEERING_OFFICE_MANAGER';
                $user->save();
            }
            
            // $role_id = $request->input('role');
            // if (!empty($role_id)) {
            //     $role = Role::findOrFail($role_id);
            //     // if($role->is_primary){
            //     //     if(Auth::user()->hasRole('superadmin'))
            //     //     {
            //     //         $user->assignRole($role->name);
            //     //     }
            //     //     else{
            //     //        return  $this->respondWentWrong(__('messages.can_not_static_role'));
            //     //     }
            //     // }
            //     // else{
            //     //     $user->assignRole($role->name);
            //     // }
            //     $user->assignRole($role->name);
            // }

            //send email to employee is send_email is enabled
            if (!empty($request->input('send_email'))) {
                $this->_sendEmailToEmployee($input, $user);
            }
            DB::commit();

            $output = $this->respondSuccess(__('messages.saved_successfully'));
        } catch (Exception $e) {
            DB::rollBack();
            $output = $this->respondWentWrong($e);
        }

        return ['msg'=>$output,'id'=> $user->id];
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (!request()->user()->can('employee.view')) {
            abort(403, 'Unauthorized action.');
        }

        $user = User::find($id);

        return $this->respond($user);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!request()->user()->can('employee.edit')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            $user = User::find($id);
            $user->signature = $user->getFirstMedia('signature')?$user->getFirstMedia('signature')->original_url:'';
            $user->logo = $user->getFirstMedia('logo')?$user->getFirstMedia('logo')->original_url:'';
            $role_id = $user->roles->first()->id;
            $gender_types = User::getGenders();
            
            $roles = User::getRolesForEmployee();

            $data = ['user' => $user,
                    'gender_types' => $gender_types,
                    'roles' => $roles,
                    'role_ids' => $user->roles->pluck('id'),
                    // 'is_edit_role'=>User::canEditRole(),
                ];

            return $this->respond($data);
        } catch (Exception $e) {
            return $this->respondWentWrong($e);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
      //  if (!request()->user()->can('employee.edit')) {
        //    abort(403, 'Unauthorized action.');
        //}
        //$user=User::findOrFail($id);
        $validate = validator($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$id,
        ],
        [
            'required'  => 'The :attribute field is required.',
           // 'unique'    =>':attribute is already used',
            'email'    => ':attribute  not email'
        ]
       
    );

      
        if ($validate->fails()) {
            return $this->respondWithError($validate->errors()->first());
        }

        try {
            DB::beginTransaction();

            $payload = $request->
            only(
                'signature',
                'name',
                'mobile',
                'alternate_num',
                'home_address',
                'current_address',
                'skype',
                'linkedin',
                'facebook',
                'twitter',
                'birth_date',
                'guardian_name',
                'gender',
                'note',
                'email',
                'password',
                'active',
                'account_holder_name',
                'account_no',
                'bank_name',
                'bank_identifier_code',
                'branch_location',
                'tax_payer_id',
                'id_card_number',
                 'title'
            );
            // if password field is present but has empty value or null value
            // we will remove it to avoid updating password with unexpected value
            if (!Helpers::hasValue($payload['password'])) {
                unset($payload['password']);
            }
            
            if(isset($request->enginnering_type))
               $payload['enginnering_type']=json_encode($request->enginnering_type);
            $updated =$this->userRepository->update($id,$payload);

            if (!$updated) {
                return $this->respondWithError(__('messages.failed_to_update'));
            }
            
          
            /** @var User $user */
            $user = $this->userRepository->find($id);
           // dd($request->all());
            if($request->file){
                $user->clearMediaCollection('logo');
            $user->addMediaFromBase64($request->file)->toMediaCollection('logo');
            }
            if($payload['signature']){    
                $user->clearMediaCollection('signature');
                $user->addMediaFromBase64($payload['signature'])->usingFileName('signature'.time().'.png')->toMediaCollection('signature');
            }
            //assign role to employee
            $role_ids = $request->input('role');
           // $role_ids = explode(',' ,$role_ids);
            if (!empty($role_ids)) {
                foreach($role_ids as $role_id){
                    $role = Role::findOrFail($role_id);
                    if(!Auth::user()->hasRole('superadmin') && $role->is_primary  && !$user->hasRole($role->name)){
                                return $this->respondWithError(__('data.not_permiision_to_assign_primary_role'));
                    }
                    else{
                        if(!$user->hasRole($role->name))
                           $user->roles()->attach($role);
                    }
                }
            }

            if (!empty($request->input('send_email')) && !empty($payload['password'])) {
                $this->_sendEmailToEmployee($payload, $user);
            }
           
           
            DB::commit();

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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!request()->user()->can('employee.delete')) {
            abort(403, 'Unauthorized action.');
        }

        // do not delete self
        if ($id == auth()->user()->id) {
            return $this->respondWithError(__('messages.action_forbidden'));
        }

        try {
            $this->userRepository->delete($id);
            $output = $this->respondSuccess(__('messages.deleted_successfully'));
        } catch (\Exception $e) {
            $output = $this->respondWentWrong($e);
        }

        return $output;
    }

    /**
     * Get employee
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getEmployee($id)
    {
        $user = User::findOrFail($id);

        return $this->respond($user);
    }

    /**
     * send email to employee
     * when added in application
     *
     * @return \Illuminate\Http\Response
     */
    protected function _sendEmailToEmployee($data, $user)
    {
        $user->notify(new EmployeeAdded($data));
    }

    public function getAllEmployee()
    {
        $users = User::getUsersForDropDown();
        return $users;
    }

    public function getStatistics()
    {
        if (!request()->user()->can('employee.view')) {
            abort(403, 'Unauthorized action.');
        }
        
        $users = User::
                    count();

        $in_active = User::
                        whereNull('active')
                        ->count();

        $active = User::
                        whereNotNull('active')
                        ->count();

        $statistics = ['users' => $users, 'in_active' => $in_active, 'active' => $active];
        
        return $this->respond($statistics);
    }


    public function getUserData(Request $request){
        $users = User::getUserByRoleType($request->get('name'));
        $data = [
            'users' =>$users,
            'type' =>Role::where('id', $request->get('name'))->first()->name, //config('constants.user_types')[$request->get('name')]
        ];
        return $this->respond($data);
    }
    public function checkUserType(Request $request){
        $x= $this->userRepository->getTypeOfUser($request->get('email'), $request->get('user_type'));
        return $this->respond($x);
        
    }

    public function getType(Request $request){
        $x= $this->userRepository->getType($request->get('email'), $request->get('password'));
        return $this->respond($x);
    }

    public function getAllOfficeUsers()
    {
       // $users = User::getOfficeUsers();
       $users = User::getAllOfficeUsers();
        return $users;
    }

    public function getAllOffices()
    {
       // $users = User::getOfficeUsers();
       $users = User::getAllOffices();
        return $users;
    }
    
    
    public function getAllContractors()
    {
       // $users = User::getOfficeUsers();
       $users = User::getAllContractors();
        return $users;
    }
    public function getUsersOffice($id)
    {
       // $users = User::getOfficeUsers();
       $users = User::getUsersOffice($id);
        return $users;
    }

 
}
