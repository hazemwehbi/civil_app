@extends('layouts.front')

@section('content')
<div class="container mt-5">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="text-center mt-5">
            <img src="{{asset('img/logo.png')}}"  alt="logo" width="100" />
        </div>
        <div class="card card-signin my-5">
            <div class="card-body" >
                @if (session('status'))
                    <div class="alert alert-success">
                        {{ session('status') }}
                    </div>
                @endif
                <h5 class="card-title text-center p-4" style="color:white;">
                    Reset Password
                </h5>
                <div class="p-3">
                    <form class="form-signin" method="POST" action="{{ route('password.email') }}">
                        {{ csrf_field() }}
                        <div class="form-label-group" >
                            <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email Address" value="{{ old('email') }}" required autofocus>
                            <label for="inputEmail">
                                Email Address
                            </label>
                            @if ($errors->has('email'))
                                <span class="help-block text-danger">
                                    <small class="help-text">
                                        {{ $errors->first('email') }}
                                    </small>
                                </span>
                            @endif
                        </div>
                        <button style="background-color:#06706d;color:white;" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">
                            Send Password Reset Link
                        </button>
                        <a class="btn btn-link d-block text-center" style="color:#06706d;" href="{{ route('login') }}">
                            Back to login
                        </a>
                    </form>
                </div>                
            </div>
        </div>
    </div>
</div>
@endsection
