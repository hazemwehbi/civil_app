@extends('layouts.front')

@section('content')
<div class="container">
    <div class="row">
        <form class="form-signin" method="POST" action="{{ route('register') }}">
            {{ csrf_field() }}
         

                @php
                    $pwd = '';
                    $email = '';
                @endphp
            <div class="col-md-12">
                <div class="card card-signin my-5">
                    <div class="card-body">
                    
                    <div class="card-title p-4">
                            <h5 style="color:white;">
                              <!-- //  {{ trans('data.') }} -->
                                  Register Form
                            </h5>
                        </div>
                  <div style="padding:20px;">
                    <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="name" style="padding-bottom: 5px;">
                                    {{__('messages.name')}}
                                </label>
                                <input type="text" id="name" name="name" class="form-control" placeholder="{{__('messages.name')}}" value="{{ old('name') }}"  required >
                            </div>
                            <div class="form-group col-md-4">
                                <label for="id_card_number" style="padding-bottom: 5px;">
                                    {{__('data.id_card_number')}}
                                </label>
                                <input type="number" id="id_card_number" name="id_card_number" class="form-control" placeholder="{{__('data.id_card_number')}}" value="{{ old('id_card_number') }}"   required >
                                @if ($errors->has('id_card_number'))
                                    <span class="help-block  text-danger">
                                        <small class="help-text span-email" span-email>
                                            {{ $errors->first('id_card_number') }}
                                        </small>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group col-md-4">
                                <label for="company" style="padding-bottom: 5px;">
                                    {{__('messages.email')}}
                                </label>
                                <input type="email" id="email" name="email" class="form-control" placeholder="{{__('messages.email')}}"  required  value="{{ old('email') }}">
                                @if ($errors->has('email'))
                                    <span class="help-block  text-danger">
                                        <small class="help-text span-email" span-email>
                                            {{ $errors->first('email') }}
                                        </small>
                                    </span>
                                @endif
                            </div>

                            <div class="form-group col-md-6">
                                <label for="password" style="padding-bottom: 5px;">
                                    {{__('messages.password')}}
                                </label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="{{__('messages.password')}}" onchange="check_pass()"  required >
                                @if ($errors->has('password'))
                                    <span class="help-block  text-danger">
                                        <small class="help-text span-email" span-email>
                                            {{ $errors->first('password') }}
                                        </small>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group col-md-6">
                                <label for="confirm_password" style="padding-bottom: 5px;">
                                    {{__('messages.confirm_password')}}
                                </label>
                                <input type="confirm_password" id="confirm_password" name="confirm_password" class="form-control"   onchange="check_pass()" placeholder="{{__('messages.confirm_password')}}"   >
                                <span id='message'></span>
                            </div>

                   


                            <div class="form-group col-md-4">
                                <label for="name" style="padding-bottom: 5px;">
                                    {{__('messages.mobile')}}
                                </label>
                                <input type="number" id="mobile" name="mobile" class="form-control" placeholder="{{__('messages.mobile')}}"   >
                            </div>
                            <div class="form-group col-md-4">
                                <label for="alternate_num" style="padding-bottom: 5px;">
                                    {{__('messages.alternate_num')}}
                                </label>
                                <input type="number" id="alternate_num" name="alternate_num" class="form-control" placeholder="{{__('messages.alternate_num')}}"   >
                            </div>

                            <div class="form-group col-md-4">
                                <label for="skype" style="padding-bottom: 5px;">
                                    {{__('messages.skype')}}
                                </label>
                                <input type="text" id="skype" name="skype" class="form-control" placeholder="{{__('messages.skype')}}"   >
                            </div>



                            <div class="form-group col-md-4">
                                <label for="linkedin" style="padding-bottom: 5px;">
                                    {{__('messages.linkedin')}}
                                </label>
                                <input type="text" id="linkedin" name="linkedin" class="form-control" placeholder="{{__('messages.linkedin')}}"   >
                            </div>
                            <div class="form-group col-md-4">
                                <label for="facebook" style="padding-bottom: 5px;">
                                    {{__('messages.facebook')}}
                                </label>
                                <input type="text" id="facebook" name="facebook" class="form-control" placeholder="{{__('messages.facebook')}}"   >
                            </div>

                            <div class="form-group col-md-4">
                                <label for="twitter" style="padding-bottom: 5px;">
                                    {{__('messages.twitter')}}
                                </label>
                                <input type="text" id="twitter" name="twitter" class="form-control" placeholder="{{__('messages.twitter')}}"   >
                            </div>




                            <div class="form-group col-md-6">
                                <label for="linkedin" style="padding-bottom: 5px;">
                                    {{__('messages.home_address')}}
                                </label>
                                <input type="text" id="home_address" name="home_address" class="form-control" placeholder="{{__('messages.home_address')}}"   >
                            </div>
                            <div class="form-group col-md-6">
                                <label for="current_address" style="padding-bottom: 5px;">
                                    {{__('messages.current_address')}}
                                </label>
                                <input type="text" id="current_address" name="current_address" class="form-control" placeholder="{{__('messages.current_address')}}"   >
                            </div>




                            <div class="form-group col-md-4">
                                <label for="date_of_birth" style="padding-bottom: 5px;">
                                    {{__('messages.date_of_birth')}}
                                </label>
                                <input type="date" id="date_of_birth" name="date_of_birth" class="form-control" placeholder="{{__('messages.date_of_birth')}}"   >
                            </div>
                            <div class="form-group col-md-4">
                                <label for="guardian_name" style="padding-bottom: 5px;">
                                    {{__('messages.guardian_name')}}
                                </label>
                                <input type="text" id="guardian_name" name="guardian_name" class="form-control" placeholder="{{__('messages.guardian_name')}}"   >
                            </div>

                            <div class="form-group col-md-4">
                                <label for="gender" style="padding-bottom: 5px;">
                                    {{__('messages.gender')}}
                                </label>
                                <select class="form-control" id="gender" name="gender" >
                                    <option selected> select Gendre</option>
                                    <option value='male'> Male</option>
                                    <option value='female'> Female</option>
                                    </select>
                            </div>
                    </div>

                </div>
            </div>
        

            <div class="col-md-12">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 mx-auto">
                            <button class="btn btn-lg btn-block text-uppercase" style="background-color:#06706d;color:white;" id="submit" type="submit">
                            {{__('messages.register')}}
                            </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>

</div>

@endsection

@section('javascript')
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script> -->
    <script type="text/javascript">
    function check_pass() {
    if (document.getElementById('password').value ==
            document.getElementById('confirm_password').value) {
        document.getElementById('submit').disabled = false;
    } else {
        document.getElementById('submit').disabled = true;
    }
}

$(document).ready(function(){
    if ($("#password").val() ==$("#confirm_password").val() )  {
        $("#submit").disabled = false;
    } else {
        $("#submit").disabled = true;
    }
    $('#password, #confirm_password').on('keyup', function () {
  if ($('#password').val() == $('#confirm_password').val()) {
    $('#message').html('Matching').css('color', 'green');
  } else 
    $('#message').html('Not Matching').css('color', 'red');
});

});


    </script>
@endsection