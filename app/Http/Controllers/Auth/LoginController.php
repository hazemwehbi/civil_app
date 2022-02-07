<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Components\User\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Http\Util\CommonUtil;
use App\Components\User\Repositories\UserRepository;
class LoginController extends Controller
{
    use AuthenticatesUsers;
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    protected $commonUtil;
    /**
     * @var UserRepository
     */
    private $userRepository;

    /**
     * UserController constructor.
     * @param UserRepository $userRepository
     */
    /**
     * Create a new controller instance.
     */
    public function __construct(UserRepository $userRepository, CommonUtil $commonUtil)
    {
        $this->middleware('guest')->except('logout');
        $this->CommonUtil = $commonUtil;
        $this->userRepository = $userRepository;
    }

    /**
     * Handle a login request to the application.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response|\Illuminate\Http\JsonResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function login(Request $request)
    {
        // echo $request->input('type_name');
       // $x= $this->userRepository->getTypeOfUser($request->input('email_id_card'), $request->input('user_type'));
        
        if(true){
           
            $this->validateLogin($request);
            // If the class is using the ThrottlesLogins trait, we can automatically throttle
            // the login attempts for this application. We'll key this by the username and
            // the IP address of the client making these requests into this application.
            if ($this->hasTooManyLoginAttempts($request)) {
                $this->fireLockoutEvent($request);
    
                return $this->sendLockoutResponse($request);
            }
   
            if ($this->attemptLogin($request)) {
                $this->guard()->user()->logLastLogin();
                return $this->sendLoginResponse($request);
            }
    
            // If the login attempt was unsuccessful we will increment the number of attempts
            // to login and redirect the user back to the login form. Of course, when this
            // user surpasses their maximum number of attempts they will get locked out.
            $this->incrementLoginAttempts($request);
    
            return $this->sendFailedLoginResponse($request);
        }
        else{
            return $this->sendFailedLoginResponse($request);
        }
        
    }

    /**
     * Handles the login redirect for employees & clients.
     *
     * @return string
     */
    protected function redirectTo()
    {
        $user = Auth::user();
        if ($user->is_employee) {
            //employee
            return '/admin';
        } else {
            //client
            return '/client';
        }
    }

    protected function validateLogin(Request $request)
    {
        $this->validate($request, [
            'email_id_card' => 'required', 'password' => 'required',
        ]);
        // adjust as needed
    }


  
    protected function attemptLogin(Request $request)
    {
       
        if($this->checkEmail($request->input('email_id_card'))){
            $user = User::where('email', $request->input('email_id_card'))->first();
        }
        else{
            $user = User::where('id_card_number', $request->input('email_id_card'))->first();
        }
    
        if(isset($user)){
            if (Hash::check($request->password, $user->password)) {
                return    Auth::login($user);
            }
        }
        else{
            return false;
        }

        
    }

    function checkEmail($email) {
        $find1 = strpos($email, '@');
        $find2 = strpos($email, '.');
        $x= ($find1 !== false && $find2 !== false && $find2 > $find1);
        return $x;
     }
  
}
