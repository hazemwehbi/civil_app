@extends('layouts.front')

@section('content')
<div class="container">

    <div class="row">
        <form class="form-signin" id="form" method="POST" action="{{ route('login') }}">
            {{ csrf_field() }}

            @php
                $pwd = '';
                $email = '';
            @endphp

     

            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto shadow-lg  mb-5 bg-white rounded mt-3" >
                <div class="card card-signin">
                    <div class="card-body">
                        <div class="card-title p-4">
                            <h5 style="color:white;">
                                {{ trans('data.Log_in_to_the_engineering_offices_system') }}
                            </h5>
                        </div>
                        <div style="padding:20px;">
                           <div class="form-outline mb-1">
                                <input type="text" id="inputEmail" name="email_id_card" class="form-control form-control-lg" placeholder="Email Address OR ID Card"  required  ><br>
                                @if ($errors->has('email'))
                                    <span class="help-block  text-danger">
                                        <small class="help-text span-email" span-email>
                                            {{ $errors->first('email') }}
                                        </small>
                                    </span>
                                @endif
                            </div>
                            <div class="form-outline mb-1">
                                <input type="password" name="password" id="inputPassword" class="form-control form-control-lg" placeholder="Password" value ="{{$pwd}}"  required ><br>
                                @if ($errors->has('password'))
                                    <span class="help-block text-danger">
                                        <small class="help-text">
                                            {{ $errors->first('password') }}
                                        </small>
                                    </span>
                                @endif
                            </div>
                            <div class="form-outline mb-1">
                            <select name="user_type" id="user_type"  class="form-control form-control-lg"   style="display:none" >
                            
                                    <!-- @foreach(array_keys(config('constants.user_types'))  as $type)
                                        <option value="{{$type}}" >{{config('constants.user_types')[$type]}} </option>
                                    @endforeach -->
                                </select>
                                @if ($errors->has('user_type'))
                                    <span class="help-block text-danger">
                                        <small class="help-text">
                                            {{ $errors->first('user_type') }}
                                        </small>
                                    </span>
                                @endif
          
                            </div>

                            <!-- <div class="form-outline mb-1">
                            <select name="type_name" id="type_name"   class="form-control form-control-lg" style="display: none;margin-top:4%;" >
                                </select>
                                @if ($errors->has('user_type'))
                                    <span class="help-block text-danger">
                                        <small class="help-text">
                                            {{ $errors->first('user_type') }}
                                        </small>
                                    </span>
                                @endif
                            </div> -->
                            
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
                                <a class="btn btn-link d-block text-center py-0"  style="color:#06706d;"  href="{{ route('register')}}">
                                    <!-- //route('client.register-form')  -->
                                {{__('data.register')}}
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
<style>


  .error{
    color: red;
  }
  /* label,
  input,
  button {
    border: 0;
    margin-bottom: 3px;
    display: block;
    width: 100%;
  }
 .common_box_body {
    padding: 15px;
    border: 12px solid #28BAA2;
    border-color: #28BAA2;
    border-radius: 15px;
    margin-top: 10px;
    background: #d4edda;
} */
</style>
@section('javascript')
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script> -->
    <script type="text/javascript">
const isEmpty = str => !str.trim().length;

$(document).ready(function(){

        $("#inputEmail").on("change",function() {
        var email = $("#inputEmail").val();
        var password = $("#inputPassword").val();
        if(!isEmpty(email) && !isEmpty(password)){
            $('#user_type').children().remove();
            var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content')
                $.ajax({
                        headers: {
                        'X-CSRF-TOKEN': CSRF_TOKEN
                        },
                        type:'POST',
                        url:"{{ route('getType.post') }}",
                        data:{email: email,password:password},
                        success:function(result){
                          
                            console.log(result.length)
                            var options = "";
                                    if (result.length > 1){
                                        $('#user_type').children().remove();
                                       $("#user_type").prop('required',true);
                                      var options1 = `<option value="" disabled selected>choose Type</option>`;
                                        $("#user_type").append(options1);
                                            for (var i = 0; i < result.length; i++) {
                                            options += `<option value=${result[i].id}>${result[i].name}</option>`;//<--string 
                                            }
                                            $("#user_type").append(options);
                                    }
                                    else{

                                    }
                            }
                     
                    });
        }
   });
   $("#inputPassword").on("change",function() {
        var email = $("#inputEmail").val();
        var password = $("#inputPassword").val();
        if(!isEmpty(email) && !isEmpty(password)){
            $('#user_type').children().remove();
            var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content')
                $.ajax({
                        headers: {
                        'X-CSRF-TOKEN': CSRF_TOKEN
                        },
                        type:'POST',
                        url:"{{ route('getType.post') }}",
                        data:{email: email,password:password},
                        success:function(result){
                           
                            console.log(result.length)
                            var options = "";
                                    if (result.length > 1){
                                        $("#user_type").show(); 
                                        $("#user_type").prop('required',true);
                                        var options1 = `<option value="" disabled selected>choose Type</option>`;
                                            $("#user_type").append(options1);
                                                for (var i = 0; i < result.length; i++) {
                                                options += `<option value=${result[i].id}>${result[i].name}</option>`;//<--string 
                                                }
                                                $("#user_type").append(options);
                                            }
                                    else{ 

                                   }
                            }
                    
                     
                    });
        }
   });
//    // e.preventDefault();
//       var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content')
//     $.ajax({
//             headers: {
//             'X-CSRF-TOKEN': CSRF_TOKEN
//             },
//             type:'POST',
//             url:"{{ route('getTypes.post') }}",
//          //   data:{},
//             success:function(result){
//                 console.log(result.types.length)
//                 var options = "";
//               //  var options1 = `<option value="" disabled selected>choose ${result.type}</option>`;
//                    // $("#type_name").append(options1);
//                     for (var i = 0; i < result.types.length; i++) {
//                     options += `<option value=${result.types[i].id}>${result.types[i].name}</option>`;//<--string 
//                     }
//                     $("#user_type").append(options);
//                 }
//         });


    // var options = "";
    //     var options1 = `<option value="" disabled selected>choose ${result.type}</option>`;
    //         $("#type_name").append(options1);
    //         for (var i = 0; i < result.users.length; i++) {
    //         options += `<option value=${result.users[i].id}>${result.users[i].name}</option>`;//<--string 
    //         }
    //         $("#type_name").append(options);


//   $("#form").validate({
//     // Specify validation rules
//     rules: {
//       user_type: "required",
//       type_name: "required",
//       email: {
//         required: true,
//         email: true
//       },      
//       password: {
//         required: true,
//        // minlength: 5,
//       }
//     },
//     messages: {
//         user_type: {
//       required: "Please Select your type",
//      },      
//      type_name: {
//       required: "Please select name of  type",
//      },     
//      password: {
//       required: "Please enter password",
//      }, 
//      email: {
//       required: "Please enter email address",
//       email: "Please enter a valid email address.",
//      },
//     },
  
//   });
 });
 
//   $("#user_type").change(function(e) {
//       e.preventDefault();
//       var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content')
//        var value = $("option:selected", this).val();
//        var email = $("#inputEmail").val();
//        $(".error-type").remove();
//        if(true){
//         $.ajax({
//             headers: {
//             'X-CSRF-TOKEN': CSRF_TOKEN
//             },
//             type:'POST',
//             url:"{{ route('checkUser.post') }}",
//             data:{email: email,user_type:value},
//             success:function(result){
//                 $('#type_name').children().remove();
//                 $("#type_name").prop('required',false);
//                 $("#type_name").hide(); 
//                if(true){ 
//                         if(value == '2' || value == '3' || value == '5')
//                         {
//                         $("#type_name").show(); 
//                         $("#type_name").prop('required',true);
//                             var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
//                                     $.ajax({
//                                         headers: {
//                                         'X-CSRF-TOKEN': CSRF_TOKEN
//                                         },
//                                     type:'POST',
//                                     url:"{{ route('ajaxRequest.post') }}",
//                                     data:{name: value},
//                                     success:function(result){
//                                         var options = "";
//                                     var options1 = `<option value="" disabled selected>choose ${result.type}</option>`;
//                                         $("#type_name").append(options1);
//                                         for (var i = 0; i < result.users.length; i++) {
//                                         options += `<option value=${result.users[i].id}>${result.users[i].name}</option>`;//<--string 
//                                         }
//                                         $("#type_name").append(options);
//                                     }
//                                     });
//                         }
//                }
//                else{
//                $('#inputEmail').after('<span class="help-block text-danger error-type"> <small class="help-text"> user not match with type </small> </span>')
                                   
//                }
//              }
//         });

//        }
    
//     });

//     $('#form').submit(function() {
//         var isValid=false;
//         var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content')
//        var value = $('#user_type').find(":selected").val();
//        var email = $("#inputEmail").val();
//         $.ajax({
//             headers: {
//             'X-CSRF-TOKEN': CSRF_TOKEN
//             },
//             async: false,
//             type:'POST',
//             url:"{{ route('checkUser.post') }}",
//             data:{email: email,user_type:value},
//             success:function(result){
//                 isValid= result;
//             }

//                });
//                if(!isValid){
//                 $(".error-type").remove();
//                 $('#inputEmail').after('<span class="help-block text-danger error-type"> <small class="help-text"> user not match with type </small> </span>')
//                }
//                else{
//                 $(".error-type").remove();
//                }
//                return isValid;
              
         
// });

       $('button.copy').click(function(){
            $('input#inputEmail').val($(this).data('email'));
            $('input#inputPassword').val($(this).data('pwd'));
            $('button#submit').trigger('click');
        });








    </script>
@endsection