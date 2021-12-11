<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
      <script>
                @auth
                    window.Permissions = {!! json_encode(Auth::user()->allPermissions, true) !!};
                @else
                    window.Permissions = [];
                @endauth
</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Civil Application</title>

    @if(!empty($favicon))
        <link rel="shortcut icon" href="{{asset('uploads/' . $favicon)}}"/>
    @endif
    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="{{ asset('front/bootstrap/css/bootstrap.min.css') }}">
    @if(!isset($no_header))
        <link rel="stylesheet" type="text/css" href="{{ asset('front/css/util.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('front/css/main.css') }}">
    @endif
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" rel="stylesheet"/>

    <style type="text/css">
          html, body {
            background-color: #fff;
            color: #636b6f;
            font-family: 'Raleway', sans-serif;
            font-weight: 100;
            height: 100vh;
            margin: 0;
            background: #ffffff url("{{asset('img/welcome.jpg')}}") no-repeat right top;
            background-size: cover;
        }
        .hide{
            display: none !important;
        }
        :root {
          --input-padding-x: 1.5rem;
          --input-padding-y: .82rem;
        }

        body {
          background: #ebeaea;
        }

        .card-signin {
          border: 0;
          border-radius: 1rem;
       /*   box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);*/
        }

        .card-signin .card-title {
          background-color:#06706d;
         /* margin-bottom: 2rem;*/
          font-weight: 300;
          font-size: 1.5rem;
        }
        .card-signin .card-body {
          padding: 0rem;
        }
        .mx-auto {
            position: relative;
            width: 100%;
            padding-right: 0px;
            padding-left: 0px;
        }
        .form-signin {
          width: 100%;
        }

        .form-signin .btn {
          font-size: 80%;
          border-radius: 5rem;
          letter-spacing: .1rem;
          font-weight: bold;
          padding: 1rem;
          transition: all 0.2s;
        }

        .form-label-group {
          position: relative;
          margin-bottom: 1rem;
        }

        .form-label-group input, .form-label-group select {
          height: auto;
        }

        .form-label-group>input,
        .form-label-group>label, .form-label-group select {
          padding: var(--input-padding-y) var(--input-padding-x);
        }

        .form-label-group>label {
          position: absolute;
          top: 0;
          left: 0;
          display: block;
          width: 100%;
          margin-bottom: 0;
          /* Override default `<label>` margin */
          line-height: 1.5;
          border: 1px solid transparent;
          border-radius: .25rem;
          transition: all .1s ease-in-out;
        }

        .form-label-group input::-webkit-input-placeholder {
          color: transparent;
        }

        .form-label-group input:-ms-input-placeholder {
          color: transparent;
        }

        .form-label-group input::-ms-input-placeholder {
          color: transparent;
        }

        .form-label-group input::-moz-placeholder {
          color: transparent;
        }

        .form-label-group input::placeholder {
          color: transparent;
        }

        .form-label-group input:not(:placeholder-shown) {
          padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
          padding-bottom: calc(var(--input-padding-y) / 3);
        }

        .form-label-group input:not(:placeholder-shown)~label {
          padding-top: calc(var(--input-padding-y) / 3);
          padding-bottom: calc(var(--input-padding-y) / 3);
          font-size: 12px;
          color: #777;
        }
        html, body {
          height: 100%;
  margin: 0;

  background-image:url("{{asset('img/welcome.jpg')}}");
/* Center and scale the image nicely */
background-position: center;
background-repeat: no-repeat;
background-size: cover;
            
         
        }
        /*.help-text {
            margin-left: 36px;
        }*/
  </style>
</head>
<body data-gr-c-s-loaded="true" cz-shortcut-listen="true" id="app">
    <div class="limiter">
        <div>
            @yield('content')
        </div>
    </div>
    <script src="{{ asset('front/js/jquery-3.2.1.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('front/bootstrap/js/bootstrap.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('front/js/main.js') }}" type="text/javascript"></script>
    @yield('javascript')
</body>
</html>
