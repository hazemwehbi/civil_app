<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Config;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
class LanguageController extends Controller
{
    //
    public function switchLang($lang)
    {
        if (array_key_exists($lang, Config::get('languages'))) {
           
            App::setLocale('ar');
            Session::put('applocale','ar');
        }
        return Redirect::back();
    }
}
