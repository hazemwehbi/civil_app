<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    use AuthenticatesUsers;

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->check()) {
            if (Auth::user()->user_type_log=='SITE_MANAGENMENT') {
                return redirect('/admin');
            } 
            elseif(Auth::user()->user_type_log=='ESTATE_OWNER') {
                return redirect('/estate_owner');
            }
            elseif(Auth::user()->user_type_log=='ENGINEERING_OFFICE') {
                return redirect('/enginner_office');
            }
        }

        return $next($request);
    }
}
