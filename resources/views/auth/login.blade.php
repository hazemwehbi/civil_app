@extends('layouts.front')

@section('content')
<div class="container">
    @if (session('status'))
        <div class="row">
            <div class="col-md-12">
                <div class="alert @if(session('status.success')) alert-success @else alert-danger @endif alert-dismissible fade show mt-5" role="alert">
                  {{ session('status.msg') }}
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
            </div>
        </div>
    @endif
    <div class="row">
        <form class="form-signin" method="POST" action="{{ route('login') }}">
            {{ csrf_field() }}

            @php
                $pwd = '';
                $email = '';
            @endphp

            <div class="text-center mt-5">
                <img src="{{asset('img/logo.png')}}"  alt="logo" width="100" />
            </div>

            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto shadow-lg  mb-5 bg-white rounded mt-3" >
                <div class="card card-signin">
                    <div class="card-body">
                        <div class="card-title p-4">
                            <h5 style="color:white;">
                                {{ trans('data.Log_in_to_the_engineering_offices_system') }}
                            </h5>
                        </div>
                        <div style="padding:20px;">
                            <div class="form-label-group">
                                <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email Address" value="{{$email}}" required autofocus>
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

                            <div class="form-label-group">
                                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" value ="{{$pwd}}" required>
                                <label for="inputPassword">
                                    Password
                                </label>
                                @if ($errors->has('password'))
                                    <span class="help-block text-danger">
                                        <small class="help-text">
                                            {{ $errors->first('password') }}
                                        </small>
                                    </span>
                                @endif
                            </div>
                            <div class="form-label-group">

                            <select name="user_type" id="user_type"  required class="form-control" >
                            <option value="" disabled selected>Select your Type</option>
                                    @foreach(array_keys(config('constants.user_types'))  as $type)
                                        <option value="{{$type}}" >{{config('constants.user_types')[$type]}} </option>
                                    @endforeach
                                </select>
                                @if ($errors->has('user_type'))
                                    <span class="help-block text-danger">
                                        <small class="help-text">
                                            {{ $errors->first('user_type') }}
                                        </small>
                                    </span>
                                @endif
                            </div>
                            <div class="form-label-group">
                            <select name="user_type1" id="user_type1"  required class="form-control" style="display: none;">
                            <option value="" disabled selected>Select your Type</option>
                                    @foreach(array_keys(config('constants.user_types'))  as $type)
                                        <option value="{{$type}}" >{{config('constants.user_types')[$type]}} </option>
                                    @endforeach
                                </select>
                                @if ($errors->has('user_type'))
                                    <span class="help-block text-danger">
                                        <small class="help-text">
                                            {{ $errors->first('user_type') }}
                                        </small>
                                    </span>
                                @endif
                            </div>
                            
                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label class="custom-control-label" for="remember">
                                    Remember Me
                                </label>
                            </div>
                            <br>
                            <button class="btn btn-lg btn-block text-uppercase" style="background-color:#06706d;color:white;" id="submit" type="submit">
                                Log in
                            </button>
                            <a class="btn btn-link d-block text-center" style="color:#06706d;" href="{{ route('password.request') }}">
                                Forgot Password?
                            </a>
                            @if(config('constants.enable_client_signup'))
                                <a class="btn btn-link d-block text-center py-0" href="{{ route('client.register-form') }}">
                                {{__('messages.client_register')}}
                                </a>
                            @endif
                        </div>
                        <div class="card-title text-center"style="margin-bottom: 0px;">
                            <span style="font-size:12px; color:white;">
                                {{ trans('data.all_rights_are_save') }} <b>2020</b>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    @if(config('app.env') == 'demo')
        <div class="row justify-content-md-center">
            <div class="col-md-4">
                <p class="text-center text-danger">Demo Logins</p>
                <table class="table table-sm">
                    <tr>
                        <th>User Role</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>#</th>
                    </tr>
                    <tr>
                        <th>Admin</th>
                        <td>admin@example.com</td>
                        <td>123456</td>
                        <td>
                            <button class="btn btn-sm btn-success copy" data-email="admin@example.com" data-pwd="123456">Login</button>
                        </td>
                    </tr>
                    <tr>
                        <th>Employee</th>
                        <td>employee@example.com</td>
                        <td>123456</td>
                        <td>
                            <button class="btn btn-sm btn-success copy" data-email="employee@example.com" data-pwd="123456">Login</button>
                        </td>
                    </tr>
                    <tr>
                        <th>Customer / Client</th>
                        <td>customer@example.com</td>
                        <td>123456</td>
                        <td>
                            <button class="btn btn-sm btn-success copy" data-email="customer@example.com" data-pwd="123456">Login</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    @endif

</div>
@endsection

@section('javascript')
    <script type="text/javascript">

        $("#user_type").change(function() {
       var value = $("option:selected", this).val();
           $("#user_type1").show(); 
           var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    /* the route pointing to the post function */
                    url: '/postajax',
                    type: 'POST',
                    /* send the csrf-token and the input to the controller */
                    data: {_token: CSRF_TOKEN, message:value},
                    /* remind that 'data' is the response of the AjaxController */
                    success: function (data) { 
                        alert(1)
                       // $(".writeinfo").append(data.msg); 
                    }
                }); 
         // $("#user_typ1 > option[value=" + value + "]").attr("selected", true);  
           })
        $('button.copy').click(function(){
            $('input#inputEmail').val($(this).data('email'));
            $('input#inputPassword').val($(this).data('pwd'));
            $('button#submit').trigger('click');
        });
    </script>
@endsection