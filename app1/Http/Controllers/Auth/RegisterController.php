<?php

namespace App\Http\Controllers\Auth;

use App\Components\User\Models\User;
use App\Components\Core\Utilities\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\DB;
use App\Components\User\Repositories\UserRepository;
class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    //protected $redirectTo = '/admin';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
       $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
 
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'id_card_number' => 'required|unique:users',
            'password' => 'required',
        ]);
    }
    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Components\User\Models\User
     */
    public function register(Request $request)
    {
      

        
        $this->validator($request->all())->validate();
        try {
            DB::beginTransaction();

            $input = $request->only('name', 'email', 'mobile', 'alternate_num', 'home_address', 'current_address', 'skype', 'linkedin', 'facebook', 'twitter', 'birth_date', 'guardian_name', 'gender',  'password', 'id_card_number');
             
            /** @var User $user */
            $user = $this->userRepository->create($input);


            $user->assignRole('Estate Owner');

           

            // //send email to employee is send_email is enabled
            // if (!empty($request->input('send_email'))) {
            //     $this->_sendEmailToEmployee($input, $user);
            // }
            DB::commit();

            $output = [
                'success' => true,
                'msg' => __('messages.registered_successfully')
            ];
        } catch (\Exception $e) {
            DB::rollBack();
            $output = [
                'success' => false,
                'msg' => __('messages.something_went_wrong')
            ];
        }

        return redirect()->route('login')->with('status', $output);
    }


    protected function validateRegister(Request $request)
    {
       
    }
}
