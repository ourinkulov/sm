<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link href="{{asset('vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sigmar+One&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Denk+One&family=Sigmar+One&display=swap" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <style>
        .hov:hover { background-color: #b2b5c7; border-radius: 8%;
        }
    </style>
    @livewireStyles
</head>
<body>
<div id="app">
    <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
        <div class="container-fluid ">
            <a class="navbar-brand" href="{{ url('/user/dashboard') }}">
                {{ config('app.name', 'Laravel') }}
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Left Side Of Navbar -->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.dars') }}">{{ __('Darslar') }}</a>
                    </li>
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.dissertats') }}">{{ __('Dissertatsiyalar') }}</a>
                    </li>
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.maqola') }}">{{ __('Maqolalar') }}</a>
                    </li>
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.materials') }}">{{ __('O\'quv materiallari') }}</a>
                    </li>
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.patents') }}">{{ __('Patentlar') }}</a>
                    </li>
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.loyiha') }}">{{ __('Loyihalar') }}</a>
                    </li>
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.lang') }}">{{ __('Til bilish') }}</a>
                    </li>
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.kurs') }}">{{ __('To\'garak va Olimpiada natijalari') }}</a>
                    </li>
                    <li class="nav-item hov">
                        <a class="nav-link " href="{{ route('user.malaka') }}">{{ __('Malaka oshirishlar') }}</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{__('Sozlamalar') }}
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">

                            <a class="dropdown-item" href="{{ route('user.userprofile') }}">
                                {{ __('Profil') }}
                            </a>
                            <a class="dropdown-item" href="{{ route('logout') }}">
                                {{ __('Ilmiy ma\'lumotlar') }}
                            </a>


                        </div>
                    </li>
{{--                    <li class="nav-item hov">--}}
{{--                        <a class="nav-link " href="{{ route('login') }}">{{ __('Darslar') }}</a>--}}
{{--                    </li>--}}
{{--                    <li class="nav-item hov">--}}
{{--                        <a class="nav-link " href="{{ route('login') }}">{{ __('Darslar') }}</a>--}}
{{--                    </li>--}}
{{--                    <li class="nav-item hov">--}}
{{--                        <a class="nav-link " href="{{ route('login') }}">{{ __('Darslar') }}</a>--}}
{{--                    </li>--}}

                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Authentication Links -->
                    @guest
                        @if (Route::has('login'))


                        @endif


                        @if (Route::has('register'))
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('register') }}">{{ __('Registratsiya') }}</a>
                            </li>
                        @endif
                    @else

                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                {{ Auth::user()->name }}
                            </a>

                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="{{ route('logout') }}"
                                   onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                    {{ __('Chiqish') }}
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                    @csrf
                                </form>
                            </div>
                        </li>
                    @endguest
                </ul>
            </div>
        </div>
    </nav>

    <main class="py-4">
        @yield('content')
    </main>
</div>

@livewireScripts
<script type="text/javascript" >
    window.livewire.on('darsturiSaqlandi',()=>{
        $('#darsadd').modal('hide');
    });
    window.livewire.on('storeuserprofile',()=>{
        $('#userprofile').modal('hide');
    });
    window.livewire.on('storeuserilm',()=>{
        $('#userprilm').modal('hide');
    });
    window.livewire.on('storeuserimage',()=>{
        $('#userimage').modal('hide');
    });
    window.livewire.on('profilupdated',()=>{
        $('#userprofileupdate').modal('hide');
    });
    window.livewire.on('storeuserilmupdate',()=>{
        $('#userilmupdate').modal('hide');
    });
    window.livewire.on('updateuserimage',()=>{
        $('#rasmyangilash').modal('hide');
    });
    window.livewire.on('ilmiyDrajaYangilandi',()=>{
        $('#ilmiyDaraja').modal('hide');
    });
    window.livewire.on('ilmiyDarajaSaqlandi',()=>{
        $('#ilmiyDarajaKiritish').modal('hide');
    });
    window.livewire.on('maqolasaqlandi',()=>{
        $('#maqolakiritish').modal('hide');
    });
    window.livewire.on('dissertatsiyasaqlandi',()=>{
        $('#dissertatsiyakiritish').modal('hide');
    });
    window.livewire.on('dissdalolatnomakiritildi',()=>{
        $('#dalolatnomaqushish').modal('hide');
    });
    window.livewire.on('materialsaqlandi',()=>{
        $('#materialkiritish').modal('hide');
    });
    window.livewire.on('patentkiritildi',()=>{
        $('#patentkiritish').modal('hide');
    });
    window.livewire.on('loyihakiritildi',()=>{
        $('#loyihakiritish').modal('hide');
    });
    window.livewire.on('langsaqlandi',()=>{
        $('#langkiritish').modal('hide');
    });

    window.livewire.on('kurskiritildi',()=>{
        $('#kurskiritish').modal('hide');
    });
    window.livewire.on('malakakiritildi',()=>{
        $('#malakakiritish').modal('hide');
    });



</script>
</body>
</html>
