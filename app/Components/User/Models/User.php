<?php

namespace App\Components\User\Models;

use App\System;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Auth;
/**
 * Class User.
 *
 * @property int         $id
 * @property string      $name
 * @property string      $email
 * @property array       $permissions
 * @property string|null $active
 */
class User extends Authenticatable implements HasMedia
{
    use Notifiable,
        LogsActivity,
        HasRoles,
        HasMediaTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];
    protected static $logUnguarded = true;
    protected static $logOnlyDirty = true;
    protected $appends = ['avatar_url'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * the validation rules.
     *
     * @var array
     */
    public static $rules = [];

    /**
     * hashes password.
     *
     * @param $password
     */
    public function setPasswordAttribute($password)
    {
        $this->attributes['password'] = bcrypt($password);
    }

    /**
     * register medias for users
     *
     */
    public function registerMediaCollections()
    {
        $this
            ->addMediaCollection('avatar')
            ->singleFile();
    }

    /**
     * logs last login date of the user.
     */
    public function logLastLogin()
    {
        $this->last_login = $this->freshTimestamp();
        $this->save();
    }

    /**
     * Scope a query to only include Employess.
     * (one that does not have customer_id).
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeEmployees($query)
    {
        return $query->where('customer_id', null);
    }

    public function scopeOfName($query, $name)
    {
        if (null === $name || '' === $name) {
            return false;
        }

        return $query->where('name', 'LIKE', "%{$name}%");
    }

    public function scopeOfEmail($query, $email)
    {
        if (null === $email || '' === $email) {
            return false;
        }

        return $query->where('email', '=', $email);
    }

    /**
     * Get all of the employee's notes.
     */
    public function notes()
    {
        return $this->morphMany('App\Note', 'notable');
    }
    
    /**
     * Get the leaves for the employee.
     */
    public function leaves()
    {
        return $this->hasMany('App\Leave');
    }

    /**
     * Get user avatar.
     */
    public function getAvatarUrlAttribute()
    {
        return optional($this->getMedia('avatar')->first())
            ->getFullUrl();
    }

    /**
     * Get the user type (employee or client).
     *
     * @return string
     */
    public function getUserTypeAttribute()
    {
        if (empty($this->customer_id)) {
            return 'employee';
        } else {
            return 'client';
        }
    }

    /**
     * Check if user type is employee.
     *
     * @return bool
     */
    public function getIsEmployeeAttribute()
    {
        return empty($this->customer_id);
    }

    /**
     * Check if user type is client.
     *
     * @return bool
     */
    public function getIsClientAttribute()
    {
        return !empty($this->customer_id);
    }

    /**
     * Customer for the contact.
     */
    public function customer()
    {
        return $this->belongsTo('App\Customer');
    }

    /**
     * retrieve users for dropdown.
     *
     * @return $users
     */
    public static function getUsersForDropDown($append_all = false)
    {
        $users = User::where('customer_id', null)
                        ->select('id', 'name')
                        ->orderBy('name')
                        ->get()
                        ->toArray();

        if ($append_all) {
            $users = array_merge([['id' => 0, 'name' => __('messages.all')]], $users);
        }
        return $users;
    }


    public static function getUsersMemberForDropDown($append_all = false)
    {
        $user=Auth::user();
        if ($user->hasRole('superadmin')){
            $users = User::where('customer_id', null)
            ->select('id', 'name')
            ->orderBy('name')
            ->get()
            ->toArray();
        }
        else{
            $users=User::
            where(function ($query) {
                $query->where('parent_id',Auth::id());
                $query->orWhere('id', Auth::id());
            })->select('id', 'name')
            ->orderBy('name')
            ->get()->toArray();
        }
        if ($append_all) {
            $users = array_merge([['id' => 0, 'name' => __('messages.all')]], $users);
        }
        return $users;
    }


    public static function getRolesForEmployee()
    {
        // $roles = Role::where('type', 'employee')
        //             ->get()
        //             ->toArray();
        $user=Auth::user();
        if ($user->hasRole('Estate Owner'))
         {
            $roles = Role::where('type', 'ESTATE_OWNER')
                      ->get()
                        ->toArray();
         }
         else{
            $roles=Role::all();
         }
                    
        return $roles;
    }

    public static function getRolesForPermission()
    {
      
        
     
        //where('type','!=', $userrole->type)
       
        $roles = Role:: where(function ($query) {
            $roles_ids = Auth::user()->roles->pluck('id');
            $query->where('is_primary',1);
            $query->whereNotIn('id', $roles_ids);
        })->select('id', 'name')
                      ->get()
                        ->toArray();
                    
        return $roles;
    }
    /**
     * retrieve gender for dropdown.
     *
     * @return array
     */
    public static function getGenders()
    {
        return [
                ['value' => 'male',
                 'text' => __('messages.male'),
                ],
                ['value' => 'female',
                 'text' => __('messages.female'),
                ],
                ['value' => 'other',
                 'text' => __('messages.other'),
                ],
            ];
    }


    public static function getUserTypes()
    {
        return [
                ['value' => 'ESTATE_OWNER',
                 'text' => __('Estate Owner'),
                ],
                ['value' => 'ENGINEERING_OFFICE',
                 'text' => __('Engineering Office'),
                ],
                ['value' => 'SUPPORT_SERVICES_OFFICE',
                 'text' => __('Support Service Office'),
                ],



                ['value' => 'CONTRACTING_COMPANY',
                'text' => __('Contracting  Company'),
               ],
               ['value' => 'GOVERNMENT_AGENCIES',
                'text' => __('Government Agencies'),
               ],
               ['value' => 'SITE_MANAGENMENT',
                'text' => __('Site Managnment'),
               ],
            ];
    }
    
    
    /**
     * retrieve all the permissions
     * of user.
     *
     * @return array
     */
    public static function getUserPermissions($user)
    {
        $userPermissions = $user->getAllPermissions();

        $permissions = [];
        foreach ($userPermissions as $userPermission) {
            $permissions[$userPermission->name] = 1;
        }

        if (($user->hasRole('superadmin'))) {
            $permissions['superadmin'] = 1;
        }

        return $permissions;
    }


    public static function getUserByRoleType($id)
    {
      
        //check if role not null
        $role=Role::where('id', $id)->first();
       //$role=Role::where('type', $type)->first();
        $users=[];
        if($role != null){
            $users= $role->users() ->select('id', 'name')
            ->orderBy('name')
            ->get()
            ->toArray();
        }
  
         return $users;
    }



    //check user type
    public static function getTypeOfUser($email,$id)
    {
        $user =User::where('email',$email)->first();
        foreach ($user->roles as $role) {
           if($role->id==$id){
                return 'true';
           }
  
        }
        return 'false';
    }


    /**
     * retrieve all the roles
     * of user.
     *
     * @return array
     */
    public static function getUserRoles($user)
    {
        $user_roles = $user->roles;

        $roles = [];
        foreach ($user_roles as $user_role) {
            $roles[$user_role->name] = 1;
        }

        if (($user->hasRole('superadmin'))) {
            $permissions['superadmin'] = 1;
        }

        return $roles;
    }

    /**
     * retrieve date format
     * of app.
     *
     */
    public static function appDateFormat()
    {
        $value = System::where('key', 'date_format')->value('value');

        if ($value == 'd-m-Y') {
            return ['KEY' => 'd-m-Y', 'VALUE' => 'DD-MM-YYYY'];
        } elseif ($value == 'm-d-Y') {
            return ['KEY' => 'm-d-Y', 'VALUE' => 'MM-DD-YYYY'];
        } elseif ($value == 'd/m/Y') {
            return ['KEY' => 'd/m/Y', 'VALUE' => 'DD/MM/YYYY'];
        } elseif ($value == 'm/d/Y') {
            return ['KEY' => 'm/d/Y', 'VALUE' => 'MM/DD/YYYY'];
        }
    }

    /**
     * retrieve time format
     * of app.
     *
     */
    public static function appTimeFormat()
    {
        $value = System::where('key', 'time_format')->value('value');

        return $value;
    }


    //add my code
    public function visitRequests()
    {
        return $this->hasMany('App\VisitRequest','customer_id');
    }

    public function GetAgencies()
    {
        return $this->hasMany('App\Agency','user_id');
    }


    public function getAllPermissionsAttribute() {
        $permissions = [];
          foreach (Permission::all() as $permission) {
            if (Auth::user()->can($permission->name)) {
              $permissions[] = $permission->name;
            }
          }
          return $permissions;
      }



      public static function getOfficeUsers($append_all = false)
      {
            //check if role not null
        $role=Role::where('type', 'ENGINEERING_OFFICE')->first();
        //$role=Role::where('type', $type)->first();
         $users=[];
         if($role != null){
             $users= $role->users() ->select('id', 'name')
             ->orderBy('name')
             ->get()
             ->toArray();
         }
   
          return $users;
        //   $users = User::where('office_id', null)
        //                   ->select('id', 'name')
        //                   ->orderBy('name')
        //                   ->get()
        //                   ->toArray();
  
        //   if ($append_all) {
        //       $users = array_merge([['id' => 0, 'name' => __('messages.all')]], $users);
        //   }
          
        //   return $users;
      }



          /**
     * Get the leaves for the employee.
     */
    public function documents()
    {
        return $this->hasMany('App\Document');
    }



        /**
     * Get the leaves for the employee.
     */
    public function requestRoles()
    {
        return $this->hasMany('App\RequestRole');
    }
}
