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
use File;
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

    protected function _saveAskedPermissionNotifications($member, $data)
    {
            $notifiable_users = User::find($member);
            Notification::send($notifiable_users, new AskPermissionNotification($data));
    }


    public function getRole($role_id){
       return Role::find($role_id);
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
}
