<?php

namespace App\Http\Controllers;
namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\RequestRole;
use Notification;
use App\Http\Responses\Response;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;
use App\Notifications\AskPermissionNotification;
use App\Components\User\Models\User;
use Carbon\Carbon;
use App\Project;
use App\StageProject;
use App\SupportRequestUsers;
use File;
use Lang;
use Illuminate\Support\Facades\Storage;

class CommonController extends Controller
{
    //

    public function askPermissionForUser(Request $request)
    {
        try {
            DB::beginTransaction();

            $path_document='';
            if ($request->hasFile('file')) {
                 $file=$request->file;
                 $extension = $file->getClientOriginalExtension();
                 $sha1 = sha1($file->getClientOriginalName());
                 $filename = date('Y-m-d-h-i-s') . "_" . $sha1 . "." . $extension;
                 $path = public_path().'/documents';
                   // path does not exist
                 if (!file_exists($path)) {
                    File::makeDirectory($path, 0777, true, true);
                }
                $file->move($path, $filename);
                $database_path='documents/'. $filename;
                $path_document=$database_path;
                DB::table('documents')->insert([
                    'path' => $database_path,
                    'user_id'=>Auth::id(),
                    'type'=>'request_role',
                    'created_at'=>Carbon::now()
                ]);
            }

            $role_id = $request->input('permission');
            $note=$request->input('note');
            $role = Role::find($role_id);
            DB::table('request_roles')->insert([
                'role_id' => $role_id,
                'user_id'=>Auth::id(),
                'path_document'=>$path_document,
                'note'=>$note,
                'created_at'=>Carbon::now()
                //'created_at'=>Carbon::now()
            ]);

            DB::commit();
          
            $data = [
            'user_id' => Auth::id(),
            'permission_name' => $role->name,
             ];
           $this->_saveAskedPermissionNotifications(1,$data);
           return Response::respondSuccess();

        } catch (Exception $e) {
            DB::rollBack();
            return Response::respondError($e);
        }
    }



    public function getPermissionsforAsk()
    {
        $roles = User::getRolesForPermission();
        
        return $this->respond([ 'roles' => $roles]);
    }

    public function getCurrentUser()
    {
        try {
            $user=Auth::user();

          $output=  $this->respond($user);
        } catch (Exception $e) {
            return Response::respondError($e);
            $output = $this->respondWentWrong($e);
        }
        return Response::respondSuccess($output);
    }

    public function getMyUsers()
    {
        $user=Auth::user();
        $my_users = User::
        where(function ($query) {
            $query->where('parent_id',Auth::id());
            $query->orWhere('id', Auth::id());
        })->get();
        return $my_users;
    }

    public function getUser($id)
    {
        $user=User::findOrFail($id);
      
        return $user;
    }

    public function getStage($id)
    {
        $stage=StageProject::findOrFail($id);
      
        return $stage;
    }



    
    protected function _saveAskedPermissionNotifications($member, $data)
    {
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new AskPermissionNotification($data));
    }





  
    
   public function checkRole($role_id) {
    return Role::find($role_id)->is_primary;
   }


   public function checkCurrentUserType($type){
           // $user=Auth::user();
           $role=  User::checkIfUSerHasType($type);
           $output=!Empty($role);;
           return Response::respondSuccess($output);
           //return 
   }
   public function getAllCustomer()
   {
      
        $customers=User::select('id', 'name','email','mobile','id_card_number')->get()->toArray();
       return $customers;
   }
   public function getRole($role_id){
    return Role::find($role_id);
 }
   public function getProjects( Request $request)
   {
      
    $user=Auth::user();
    $projects=[];
    if(!$user->hasRole('superadmin')){
        $childrens=$user->childrenIds($user->id);
        array_push($childrens,$user->id);
        $projects=Project::select('id', 'name')->whereIn('customer_id',$childrens)->get()->toArray();
    }
    else{
        $projects=Project::select('id', 'name')->get()->toArray();
    }
    return Response::respondSuccess($projects);
     
   }

   public function getSupporters()
   {
      
       return User::getAllSupporters();
   }
   
   
   public function getContrators()
   {
      
       return User::getAllContrators();
   }

   public function  showOfferRequestDetails(Request $request){
    try {

        $support_user = SupportRequestUsers::with('supporter')->where('id',$request->support_user_id)->first();
        if($support_user!=  null){
            return $this->respondSuccess($support_user);
        }
        else{
            $message = Lang::get('site.object_not_found');
            return $this->respondWentWrong($message);
        }

    }
     catch (Exception $e) {
        $output = $this->respondWentWrong($e);
        return $output ;
    }

   }
}
