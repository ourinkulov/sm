<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>


    {{--    <link rel="dns-prefetch" href="//fonts.gstatic.com">--}}
    {{--    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">--}}


    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

    <link href="{{asset('vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    {{--    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">--}}


    <link href="{{asset('css/sb-admin-2.min.css')}}" rel="stylesheet">
    <script src="{{asset('js/app.js')}}"></script>
    <script src="{{asset('js/chart.js')}}"></script>
    <style>
        .card-title{font-size: 14px !important;}
        .bg-primary{background-color:rgb(0 35 141) !important;}
        body{font-size:14px !important;}
        .thbody{background-color:rgb(0 35 141);color: white }
        .legend {
            font-size: 1.5rem;
            line-height: inherit;
            display: block;
            width: 100%;
            max-width: 100%;
            margin-bottom: .5rem;
            padding: 0;
            white-space: normal;
            color: inherit;
        }
        .col-auto{width: auto;
            max-width: none;
            flex: 0 0 auto;}
        .icon-shape i {
            font-size: 1.25rem;
        }
        .footer {
            padding: 2.5rem 0;
            background: #f7fafc;
        }

        .footer .copyright {
            font-size: .875rem;
        }

        .header {
            position: relative;
        }

        .icon {
            width: 3rem;
            height: 3rem;
        }

        .icon i {
            font-size: 1.75rem;
        }

        .icon-shape {
            display: inline-flex;
            padding: 12px;
            text-align: center;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
        }
    </style>
    {{--    <script src="{{ asset('js/jquery.js') }}" ></script>--}}
    {{--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>--}}
    {{--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>--}}
    @livewireStyles
</head>
<body id="page-top">


<div id="wrapper">


    <ul class="navbar-nav bg-primary sidebar sidebar-dark accordion" id="accordionSidebar">


        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{url('/user/dashboard')}}">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-window-restore"></i>
            </div>
            <div class="mx-3 sidebar-brand-text">SMART REYTING  <sup></sup></div>
        </a>


        <hr class="my-0 sidebar-divider">


        <li class="nav-item active">
            <a class="nav-link" href="{{url('/user/dashboard')}}">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Boshqaruv paneli</span></a>
        </li>


        <hr class="sidebar-divider">


        <div class="sidebar-heading">
            SAXIFALAR
        </div>


        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-user-edit fa-cog"></i>
                <span>Profil</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="py-2 bg-white rounded collapse-inner">
                    <a class="collapse-item" href="{{route('user.userprofile')}}"><i class="fa fa-chalkboard-teacher"></i><span for=""> Profil ma'lumotlari</span></a>
{{--                    <h6 class="collapse-header">Ilmiy unvon:</h6>--}}
{{--                    <a class="collapse-item" href="{{url('/adminteachers')}}">O'qituvchilar ro'yxati</a>--}}

{{--                    <h6 class="collapse-header">Ilmiy unvon:</h6>--}}
{{--                    <a class="collapse-item" href="{{route('kafedra.dashboard')}}"><i class="fas fa-cc-mastercard fa-cog"></i><span> Professorlar</span></a>--}}
{{--                    <a class="collapse-item" href="{{route('admin.kafedra')}}"><i class="fas fa-cc-mastercard fa-cog"></i><span> Kafedra</span></a>--}}
{{--                    <a class="collapse-item" href="#"><i class="fas fa-cc-mastercard fa-cog"></i><span> Professorlar</span></a>--}}

{{--                    <a class="collapse-item" href="{{route('kafedra.profile')}}">Dotsentlar</a>--}}
                    {{--                    <a class="collapse-item" href="{{route('admin.iume')}}">IU mavjud emas</a>--}}
                    {{--                    <h6 class="collapse-header">Ilmiy daraja:</h6>--}}
                    {{--                    <a class="collapse-item" href="{{route('admin.doktors')}}">Fan doktorlari</a>--}}
                    {{--                    <a class="collapse-item" href="{{route('admin.phd')}}">Fan nomzod(PhD)lari</a>--}}
                    {{--                    <a class="collapse-item" href="{{route('admin.idme')}}">ID mavjud emas</a>--}}
                    {{--                    <h6 class="collapse-header">Pedagogik maxorat:</h6>--}}
                    {{--                    <a class="collapse-item" href="{{route('admin.getopenles')}}">Baxolash (PM)</a>--}}


                </div>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-book "></i>
                <span>Faoliyat</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="py-2 bg-white rounded collapse-inner">
                    <a class="collapse-item" href="{{route('user.dars')}}"><i class="fa fa-chalkboard-teacher"></i><span for=""> Maxorat darslari</span></a>
                    <a class="collapse-item" href="{{route('user.maqola')}}"><i class="fa fa-scroll"></i><span for="">  Maqolalar</span></a>
                    <a class="collapse-item" href="{{route('user.dissertats')}}"><i class="fa fa-atom"></i><span for="">  Dissertatsiyalar</span></a>
                    <a class="collapse-item" href="{{route('user.materials')}}"><i class="fa fa-book"></i><span for="">  Materiallar</span></a>
                    <a class="collapse-item" href="{{route('user.patents')}}"><i class="fa fa-certificate"></i><span for="">  Patentlar</span></a>
                    <a class="collapse-item" href="{{route('user.loyiha')}}"><i class="fa fa-pencil-ruler"></i><span for="">  Loyihalar</span></a>
                    <a class="collapse-item" href="{{route('user.lang')}}"><i class="fa fa-language"></i><span for=""> Til bilish</span></a>
                    <a class="collapse-item" href="{{route('user.kurs')}}"><i class="fa fa-users"></i><span for="">  To'garaklar</span></a>
                    <a class="collapse-item" href="{{route('user.malaka')}}"><i class="fa fa-hat-wizard"></i><span for="">  Malaka oshirishlar</span></a>

                    {{-- <a class="collapse-item" href="#">Maqolalar</a>
                    <a class="collapse-item" href="#">Materiallar</a>
{{--                    <a class="collapse-item" href="{{ route('admindis.index') }}">Dissertatsiya</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('loyiha.showLoyiha') }}">Loyihalar</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('patent.getPatent') }}">Patentlar</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminmaterial.index') }}">Material</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminkurs.index') }}">Kurslar</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminmalaka.getAdminIndex') }}">Malaka</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminmaqola.index') }}">Maqola</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminlang.index') }}">Lang</a>--}}


                </div>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities1" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-book "></i>
                <span>Arxiv</span>
            </a>
            <div id="collapseUtilities1" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="py-2 bg-white rounded collapse-inner">
{{--                    <a class="collapse-item" href="{{route('user.dars')}}"><i class="fa fa-chalkboard-teacher"></i><span for=""> Maxorat darslari</span></a>--}}
                    <a class="collapse-item" href="{{url('user/oldmaqola')}}"><i class="fa fa-scroll"></i><span for="">  Maqolalar</span></a>
{{--                    <a class="collapse-item" href="{{route('user.dissertats')}}"><i class="fa fa-atom"></i><span for="">  Dissertatsiyalar</span></a>--}}
{{--                    <a class="collapse-item" href="{{route('user.materials')}}"><i class="fa fa-book"></i><span for="">  Materiallar</span></a>--}}
{{--                    <a class="collapse-item" href="{{route('user.patents')}}"><i class="fa fa-certificate"></i><span for="">  Patentlar</span></a>--}}
{{--                    <a class="collapse-item" href="{{route('user.loyiha')}}"><i class="fa fa-pencil-ruler"></i><span for="">  Loyihalar</span></a>--}}
{{--                    <a class="collapse-item" href="{{route('user.lang')}}"><i class="fa fa-language"></i><span for=""> Til bilish</span></a>--}}
{{--                    <a class="collapse-item" href="{{route('user.kurs')}}"><i class="fa fa-users"></i><span for="">  To'garaklar</span></a>--}}
{{--                    <a class="collapse-item" href="{{route('user.malaka')}}"><i class="fa fa-hat-wizard"></i><span for="">  Malaka oshirishlar</span></a>--}}

                    {{-- <a class="collapse-item" href="#">Maqolalar</a>
                    <a class="collapse-item" href="#">Materiallar</a>
{{--                    <a class="collapse-item" href="{{ route('admindis.index') }}">Dissertatsiya</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('loyiha.showLoyiha') }}">Loyihalar</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('patent.getPatent') }}">Patentlar</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminmaterial.index') }}">Material</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminkurs.index') }}">Kurslar</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminmalaka.getAdminIndex') }}">Malaka</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminmaqola.index') }}">Maqola</a>--}}
                    {{--                    <a class="collapse-item" href="{{ route('adminlang.index') }}">Lang</a>--}}


                </div>
            </div>
        </li>

    {{--
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-question "></i>
                    <span>So'rovnomalar</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="py-2 bg-white rounded collapse-inner">
                        <h6 class="collapse-header">Amallar:</h6>
                        <a class="collapse-item" href="#">Yaratish</a>
                        <a class="collapse-item" href="#">O'tkazish</a>
                        <a class="collapse-item" href="#">Natijalar</a>

                    </div>
                </div>
            </li> --}}



    {{--        <hr class="sidebar-divider">--}}


    {{--        <div class="sidebar-heading">--}}
    {{--            Addons--}}
    {{--        </div>--}}

    {{--        <!-- Nav Item - Pages Collapse Menu -->--}}
    {{--        <li class="nav-item">--}}
    {{--            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">--}}
    {{--                <i class="fas fa-fw fa-folder"></i>--}}
    {{--                <span>Pages</span>--}}
    {{--            </a>--}}
    {{--            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">--}}
    {{--                <div class="py-2 bg-white rounded collapse-inner">--}}
    {{--                    <h6 class="collapse-header">Login Screens:</h6>--}}
    {{--                    <a class="collapse-item" href="login.html">Login</a>--}}
    {{--                    <a class="collapse-item" href="register.html">Register</a>--}}
    {{--                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>--}}
    {{--                    <div class="collapse-divider"></div>--}}
    {{--                    <h6 class="collapse-header">Other Pages:</h6>--}}
    {{--                    <a class="collapse-item" href="404.html">404 Page</a>--}}
    {{--                    <a class="collapse-item" href="blank.html">Blank Page</a>--}}
    {{--                </div>--}}
    {{--            </div>--}}
    {{--        </li>--}}

    {{--        <!-- Nav Item - Charts -->--}}
    {{--        <li class="nav-item">--}}
    {{--            <a class="nav-link" href="charts.html">--}}
    {{--                <i class="fas fa-fw fa-chart-area"></i>--}}
    {{--                <span>Charts</span></a>--}}
    {{--        </li>--}}

    {{--        <!-- Nav Item - Tables -->--}}
    {{--        <li class="nav-item">--}}
    {{--            <a class="nav-link" href="tables.html">--}}
    {{--                <i class="fas fa-fw fa-table"></i>--}}
    {{--                <span>Tables</span></a>--}}
    {{--        </li>--}}

    <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="border-0 rounded-circle" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="mb-4 bg-white shadow navbar navbar-expand navbar-light topbar static-top">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="mr-3 btn btn-link d-md-none rounded-circle">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                <form class="my-2 mr-auto d-none d-sm-inline-block form-inline ml-md-3 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="border-0 form-control bg-light small" placeholder="Qidiruv..." aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <ul class="ml-auto navbar-nav">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i><sup>2</sup>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="p-3 shadow dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="searchDropdown">
                            <form class="mr-auto form-inline w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="border-0 form-control bg-light small" placeholder="Qidiruv..." aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="mx-1 nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="{{route('user.messages')}}" >
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- Counter - Alerts -->
                            <span class="badge badge-danger badge-counter"></span>
                        </a>
                        <!-- Dropdown - Alerts -->
                                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="alertsDropdown">
                                                    <h6 class="dropdown-header">
                                                        E'lonlar
                                                    </h6>
                                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                                        <div class="mr-3">
                                                            <div class="icon-circle bg-primary">
                                                                <i class="text-white fas fa-file-alt"></i>

                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="text-gray-500 small">December 12, 2019</div>
                                                            <span class="font-weight-bold">Ўзбекистон Республикаси ИИВ Академияси бошлиғи томонидан 2021 йил 28 июль куни тасдиқланган “Олий таълимдан кейинги таълим факультети докторантлари томонидан диссертация тадқиқоти натижалари бўйича Республика илмий-амалий конференциялар ўтказиш жадвали”га асосан 2021 йил 25 сентябрь куни соат 10:00 да ИИВ Академиясида “Ўзбекистон Республикаси жиноят-ижроия қонунчилигининг ривожланиш истиқболлари” мавзусидаги республика илмий-амалий конференцияси ўтказилиши режалаштирилган.

Шу муносабат билан, барча кафедра профессор-ўқитувчиларини мазкур илмий-амалий конференцияга таклиф этамиз.</span>
                                                        </div>
                                                    </a>
{{--                                                    <a class="dropdown-item d-flex align-items-center" href="#">--}}
{{--                                                        <div class="mr-3">--}}
{{--                                                            <div class="icon-circle bg-success">--}}
{{--                                                                <i class="text-white fas fa-donate"></i>--}}
{{--                                                            </div>--}}
{{--                                                        </div>--}}
{{--                                                        <div>--}}
{{--                                                            <div class="text-gray-500 small">December 7, 2019</div>--}}
{{--                                                            $290.29 has been deposited into your account!--}}
{{--                                                        </div>--}}
{{--                                                    </a>--}}
{{--                                                    <a class="dropdown-item d-flex align-items-center" href="#">--}}
{{--                                                        <div class="mr-3">--}}
{{--                                                            <div class="icon-circle bg-warning">--}}
{{--                                                                <i class="text-white fas fa-exclamation-triangle"></i>--}}
{{--                                                            </div>--}}
{{--                                                        </div>--}}
{{--                                                        <div>--}}
{{--                                                            <div class="text-gray-500 small">December 2, 2019</div>--}}
{{--                                                            Spending Alert: We've noticed unusually high spending for your account.--}}
{{--                                                        </div>--}}
{{--                                                    </a>--}}
                                                    <a class="text-center text-gray-500 dropdown-item small" href="#">Show All Alerts</a>
                                                </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="mx-1 nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-envelope fa-fw"></i>
                            <!-- Counter - Messages -->
                            <span class="badge badge-danger badge-counter"></span>
                        </a>
                        <!-- Dropdown - Messages -->
                        {{--                        <div class="shadow dropdown-list dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="messagesDropdown">--}}
                        {{--                            <h6 class="dropdown-header">--}}
                        {{--                                Message Center--}}
                        {{--                            </h6>--}}
                        {{--                            <a class="dropdown-item d-flex align-items-center" href="#">--}}
                        {{--                                <div class="mr-3 dropdown-list-image">--}}
                        {{--                                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">--}}
                        {{--                                    <div class="status-indicator bg-success"></div>--}}
                        {{--                                </div>--}}
                        {{--                                <div class="font-weight-bold">--}}
                        {{--                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>--}}
                        {{--                                    <div class="text-gray-500 small">Emily Fowler · 58m</div>--}}
                        {{--                                </div>--}}
                        {{--                            </a>--}}
                        {{--                            <a class="dropdown-item d-flex align-items-center" href="#">--}}
                        {{--                                <div class="mr-3 dropdown-list-image">--}}
                        {{--                                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">--}}
                        {{--                                    <div class="status-indicator"></div>--}}
                        {{--                                </div>--}}
                        {{--                                <div>--}}
                        {{--                                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>--}}
                        {{--                                    <div class="text-gray-500 small">Jae Chun · 1d</div>--}}
                        {{--                                </div>--}}
                        {{--                            </a>--}}
                        {{--                            <a class="dropdown-item d-flex align-items-center" href="#">--}}
                        {{--                                <div class="mr-3 dropdown-list-image">--}}
                        {{--                                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">--}}
                        {{--                                    <div class="status-indicator bg-warning"></div>--}}
                        {{--                                </div>--}}
                        {{--                                <div>--}}
                        {{--                                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>--}}
                        {{--                                    <div class="text-gray-500 small">Morgan Alvarez · 2d</div>--}}
                        {{--                                </div>--}}
                        {{--                            </a>--}}
                        {{--                            <a class="dropdown-item d-flex align-items-center" href="#">--}}
                        {{--                                <div class="mr-3 dropdown-list-image">--}}
                        {{--                                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">--}}
                        {{--                                    <div class="status-indicator bg-success"></div>--}}
                        {{--                                </div>--}}
                        {{--                                <div>--}}
                        {{--                                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>--}}
                        {{--                                    <div class="text-gray-500 small">Chicken the Dog · 2w</div>--}}
                        {{--                                </div>--}}
                        {{--                            </a>--}}
                        {{--                            <a class="text-center text-gray-500 dropdown-item small" href="#">Read More Messages</a>--}}
                        {{--                        </div>--}}
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    {{--                    <li class="nav-item dropdown no-arrow">--}}
                    {{--                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--}}
                    {{--                            <span class="mr-2 text-gray-600 d-none d-lg-inline small">{{\Illuminate\Support\Facades\Auth::user()->name}}</span>--}}

                    {{--                        </a>--}}
                    {{--                        <!-- Dropdown - User Information -->--}}
                    {{--                        <div class="shadow dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="userDropdown">--}}
                    {{--                            <a class="dropdown-item" href="#">--}}
                    {{--                                <i class="mr-2 text-gray-400 fas fa-user fa-sm fa-fw"></i>--}}
                    {{--                                Profile--}}
                    {{--                            </a>--}}
                    {{--                            <a class="dropdown-item" href="#">--}}
                    {{--                                <i class="mr-2 text-gray-400 fas fa-cogs fa-sm fa-fw"></i>--}}
                    {{--                                Settings--}}
                    {{--                            </a>--}}
                    {{--                            <a class="dropdown-item" href="#">--}}
                    {{--                                <i class="mr-2 text-gray-400 fas fa-list fa-sm fa-fw"></i>--}}
                    {{--                                Activity Log--}}
                    {{--                            </a>--}}
                    {{--                            <div class="dropdown-divider"></div>--}}

                    {{--                            <a class="dropdown-item" href="{{route('logout')}}" data-toggle="modall" data-target="#logoutModall">--}}
                    {{--                                <i class="mr-2 text-gray-400 fas fa-sign-out-alt fa-sm fa-fw"></i>--}}
                    {{--                                Logout--}}
                    {{--                            </a>--}}
                    {{--                        </div>--}}
                    {{--                    </li>--}}

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

                </ul>

            </nav>
            @yield('content')
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="my-auto text-center copyright">
                    <span>IIV Akademiyasi &copy; Axborot texnologiyalari va ta'limni raqamlashtirish bo'limi 2021</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
{{--<a class="rounded scroll-to-top" href="#page-top">--}}
{{--    <i class="fas fa-angle-up"></i>--}}
{{--</a>--}}

<!-- Logout Modal-->
{{--<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">--}}
{{--    <div class="modal-dialog" role="document">--}}
{{--        <div class="modal-content">--}}
{{--            <div class="modal-header">--}}
{{--                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>--}}
{{--                <button class="close" type="button" data-dismiss="modal" aria-label="Close">--}}
{{--                    <span aria-hidden="true">×</span>--}}
{{--                </button>--}}
{{--            </div>--}}
{{--            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>--}}
{{--            <div class="modal-footer">--}}
{{--                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>--}}
{{--                <a class="btn btn-primary" href="login.html">Logout</a>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div>--}}
{{--</div>--}}
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
<!-- Bootstrap core JavaScript-->
<!-- <script src="{{asset('vendor/jquery/jquery.min.js')}}"></script>
<script src="{{asset('vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

<!-- Core plugin JavaScript-->
<!-- <script src="{{asset('vendor/jquery-easing/jquery.easing.min.js')}}"></script> --> -->

<!-- Custom scripts for all pages-->
<script src="{{asset('js/sb-admin-2.min.js')}}"></script>

<!-- Page level plugins -->
<!-- <script src="{{asset('vendor/chart.js/Chart.min.js')}}"></script>

<!-- Page level custom scripts -->
<!-- <script src="{{asset('js/demo/chart-area-demo.js')}}"></script>
<script src="{{asset('js/demo/chart-pie-demo.js')}}"></script> -->
<script  type="text/javascript"> -->
    // window.livewire.on('darstas', () => {
    //     $('#darsupdate').modal('hide');
    // });
    // window.livewire.on('darstasdiqlandi',()=>{
    //     $('#darsupdate').modal('hide');
    // });
    // window.livewire.on('maqolatasdiqlandi',()=>{
    //     $('#maqolanitaxrirlash').modal('hide');
    // });
    // window.livewire.on('dissertatsiyatasdiqlandi',()=>{
    //     $('#dissertatsiyanitasdiqlash').modal('hide');
    // });
    // window.livewire.on('dissertatsiyauchirildi',()=>{
    //     $('#dissertatsiyaniuchirish').modal('hide');
    // });
    // window.livewire.on('materialtasdiqlandi',()=>{
    //     $('#materialnitasdiqlash').modal('hide');
    // });
    // window.livewire.on('patenttasdiqandi',()=>{
    //     $('#patentnitasdiqlash').modal('hide');
    // });
    // window.livewire.on('loyihadeleted',()=>{
    //     $('#loyihadelet').modal('hide');
    // });
    // window.livewire.on('loyihatasdiqlandi',()=>{
    //     $('#loyihanitasdiqlash').modal('hide');
    // });
    // window.livewire.on('langtasdiqlandi',()=>{
    //     $('#langtasdiqlash').modal('hide');
    // });
    // window.livewire.on('langdeleted',()=>{
    //     $('#langdelete').modal('hide');
    // });
    // window.livewire.on('kurstasdiqlandi',()=>{
    //     $('#kurstasdiqlash').modal('hide');
    // });
    // window.livewire.on('kursdeleted',()=>{
    //     $('#kursdelete').modal('hide');
    // });
    // window.livewire.on('malakatasdiqlandi',()=>{
    //     $('#malakatasdiqlash').modal('hide');
    // });
    // window.livewire.on('malakadeleted',()=>{
    //     $('#malakadelete').modal('hide');
    // });
    // function getdarsball(){
    //     var darsID =$("#ballid").val();
    //
    //     var darsVal = document.querySelector("#darsVal");
    //     if (darsID==1)
    //     {
    //         darsVal.value=12.5;
    //     }
    //     if     (darsID==2)
    //     {
    //         darsVal.value=35;
    //     }
    //
    //     if (darsID==0)
    //     {
    //
    //         darsVal.value=0;
    //     }
    //
    //
    //     // //miqyosVal.value = miqyosID;
    //     console.log(darsVal.value );
    //}
    function getDissVal(){
        var dissID =  $( "#maqomi" ).val();
        var dissVal = document.querySelector("#dissVal");
        if (dissID==1)
        {
            dissVal.value=12.5;
        }
        if     (dissID==2)
        {
            dissVal.value=35;
        }

        if (dissID==0)
        {

            dissVal.value=0;
        }


        // //miqyosVal.value = miqyosID;
        console.log(dissVal.value );
    }
    function getLangVal(){
        var levelID =  $( "#levelID" ).val();
        var levelVal = document.querySelector("#levelVal");
        if (levelID==1)
        {
            levelVal.value=10;
        }
        if     (levelID==2)
        {
            levelVal.value=7.5;
        }
        if (levelID==3)
        {
            levelVal.value=5;
        }
        if (levelID==0)
        {

            levelVal.value=0;
        }


        // //miqyosVal.value = miqyosID;
        console.log(levelVal.value );
    }
    function getMiqyosVal(){
        var miqyosID =  $( "#miqyosID" ).val();
        var miqyosVal = document.querySelector("#miqyosVal");
        if (miqyosID==3)
        {
            miqyosVal.value=15;
        }
        if     (miqyosID==4)
        {
            miqyosVal.value=7.5;
        }
        if (miqyosID==5)
        {
            miqyosVal.value=10;
        }
        if (miqyosID==6)
        {

            miqyosVal.value=5;
        }
        if (miqyosID==0)
        {

            miqyosVal.value=0;
        }


        // //miqyosVal.value = miqyosID;
        console.log(miqyosVal.value );
    };
    function getPatentBall(){
        var patentID=$("#patentID").val();
        var patentBall=document.querySelector("#patentBall");
        if(patentID==1)
        {
            patentBall.value=15;
        }
        if(patentID==2)
        {
            patentBall.value=7.5;
        }
        if(patentID==0)
        {
            patentBall.value=0;
        }
        console.log(patentBall.value );
    }
    function getMaterialBall(){
        var patentID=$("#turiID").val();
        var muallifID=$("#muallifID").val();
        var taboqID=$("#taboqID").val();
        var patentBall=document.querySelector("#materialBall");
        if(patentID==1)
        {
            patentBall.value=taboqID*2.5/muallifID;
        }
        if(patentID==2)
        {
            patentBall.value=taboqID*1.5/muallifID;
        }
        if(patentID==3)
        {
            patentBall.value=taboqID*1.5/muallifID;
        }
        if(patentID==4)
        {
            patentBall.value=taboqID*2.5/muallifID;
        }
        if(patentID==0)
        {
            patentBall.value=0;
        }
        console.log(patentBall.value );
    }

    function getValue(){
        var Val = document.getElementById("miqyosi").value;
        alert(Val);
    };
    // Area Chart Example
    var ctx = document.getElementById("myAreaChart").getContext('2d');
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels:['2016','2017','2018','2019','2020',],
            // labels: ["2016", "2017", "2018", "2019", "2020"],
            datasets: [{
                label: "",
                lineTension: 0.3,
                backgroundColor: "rgba(78, 115, 223, 0.05)",
                borderColor: "rgb(252,38,4)",
                pointRadius: 3,
                pointBackgroundColor: "rgb(223,78,211)",
                pointBorderColor: "rgb(223,155,78)",
                pointHoverRadius: 3,
                pointHoverBackgroundColor: "rgb(84,255,157)",
                pointHoverBorderColor: "rgba(91,97,190,0.37)",
                pointHitRadius: 10,
                pointBorderWidth: 2,
                data:['1','2','3','4','5'],
                //data: [10, 11, 20, 25, 30],
            }],
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        maxTicksLimit: 5,
                        padding: 10,
                        // Include a dollar sign in the ticks
                        callback: function(value, index, values) {
                            return '#' + number_format(value);
                        }
                    },
                    gridLines: {
                        color: "rgb(234, 236, 244)",
                        zeroLineColor: "rgb(234, 236, 244)",
                        drawBorder: false,
                        borderDash: [2],
                        zeroLineBorderDash: [2]
                    }
                }],
            },
            legend: {
                display: false
            },
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                intersect: false,
                mode: 'index',
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem, chart) {
                        var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                        return datasetLabel + ': #' + number_format(tooltipItem.yLabel);
                    }
                }
            }
        }
    });


    // Pie Chart Example
    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ["Fan doktorlari", "PhD", "Mavjud emas"],
            datasets: [{
                data: [8.33, 29.17, 62.50],
                backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
                hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
            legend: {
                display: false
            },
            cutoutPercentage: 80,
        },
    });

    // Bar Chart Example
    var ctx = document.getElementById("myBarChart");
    var myBarChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["ATK", "TQFK", "DTK", "HTK", "DHFK", "ss","dd", "fg", "uh", "HTK", "DHFK", "IIFK","ATK", "TQFK", "DTK", "HTK", "DHFK", "IIFK","ATK", "TQFK", "DTK", "HTK", "DHFK", "IIFK"],
            datasets: [{
                label: "",
                backgroundColor: ["#0000000","#1cc88a"],
                hoverBackgroundColor: "#4e73df",
                borderColor: "#4e73df",
                data: [215, 312, 251, 841, 821, 4984, 4215, 5312, 6251, 7841, 9821, 4984,4215, 5312, 6251, 7841, 9821, 4984,4215, 5312, 10, 100, 1000, 1],
            }],
        },
        options: {
            maintainAspectRatio: false,
            layout: {
                padding: {
                    left: 10,
                    right: 25,
                    top: 25,
                    bottom: 0
                }
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    ticks: {
                        maxTicksLimit: 6
                    },
                    maxBarThickness: 25,
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 10000,
                        maxTicksLimit: 5,
                        padding: 10,
                        // Include a dollar sign in the ticks
                        callback: function(value, index, values) {
                            return '#' + number_format(value);
                        }
                    },
                    gridLines: {
                        color: "rgb(234, 236, 244)",
                        zeroLineColor: "rgb(234, 236, 244)",
                        drawBorder: false,
                        borderDash: [2],
                        zeroLineBorderDash: [2]
                    }
                }],
            },
            legend: {
                display: false
            },
            tooltips: {
                titleMarginBottom: 10,
                titleFontColor: '#6e707e',
                titleFontSize: 14,
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#9561e2",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
                callbacks: {
                    label: function(tooltipItem, chart) {
                        var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                        return datasetLabel + '' + number_format(tooltipItem.yLabel);
                    }
                }
            },
        }
    });


    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
</script>
<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: ['Ilmiy faoliyat', 'Pedagogik faoliyat', 'Xorijiy tillar', 'Loyihalar', 'To\'garalar', 'Malak oshirishlar'],
            datasets: [{
                label: '# Darajada',
                data: [12, 15, 13, 15, 12, 13],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
<script>
    var ctx = document.getElementById('myChart2').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Ilmiy faoliyat', 'Pedagogik faoliyat', 'Xorijiy tillar', 'Loyihalar', 'To\'garalar', 'Malak oshirishlar'],
            datasets: [{
                label: '# Darajada',
                data: [12, 15, 13, 15, 12, 13],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</body>

</html>
