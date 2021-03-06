<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Civil Application</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
    <script>
                @auth
                    window.Permissions = {!! json_encode(Auth::user()->allPermissions, true) !!};
                @else
                    window.Permissions = [];
                @endauth
</script>
    <!-- Styles -->
    <style>
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

        .full-height {
            height: 100vh;
        }

        .flex-center {
            align-items: center;
            display: flex;
            justify-content: center;
        }

        .position-ref {
            position: relative;
        }

        .top-right {
            position: absolute;
            right: 10px;
            top: 18px;
        }

        .content {
            text-align: center;
        }

        .title {
            font-size: 84px;
        }

        .links > a {
            color: #636b6f;
            padding: 0 25px;
            font-size: 12px;
            font-weight: 600;
            letter-spacing: .1rem;
            text-decoration: none;
            text-transform: uppercase;
        }

        .m-b-md {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="flex-center position-ref full-height">
    @if (Route::has('login'))
        <div class="top-right links">
            @auth
                @if(Auth::user()->is_employee)
                    <a href="{{ url('/admin') }}" style="color:black;"><strong>Login</strong></a>
                @else
                    <a href="{{ url('/client') }}" style="color:black;"><strong>Login</strong></a>
                @endif
            @else
                <a href="{{ route('login') }}" style="color:black;">Login</a>
                {{-- <a href="{{ route('register') }}" style="color:black;">Register</a> --}}
            @endauth
        </div>
    @endif

    <div class="content">
        <div class="links">
            <h1 style="color:black;">Civil Application</h1>
         <!--   <h4>Civil Application</h4>-->
        </div>
    </div>
</div>
</body>
</html>