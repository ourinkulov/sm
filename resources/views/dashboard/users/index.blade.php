@extends('layouts.userApp2')
@section('content')

    <div class="container-fluid">

        <div class="row justify-content-center">
{{--            <h3>{{ 2021 }}</h3>--}}

            <div class="col-md-2">
                <div class="card shadow p-3 mb-5 bg-white rounded" style="border-radius: 2%; border-color: white">
                    @if (is_null($userprofiles->profileimage))
                        <img src="{{asset('storage/profileimages/1639310802_Уринкулов О.jpg')}}" class="card-img-top" alt="..." style="height: 267px; !important;">
                    @else
                        <img src="{{asset('storage/profileimages/1639310802_Уринкулов О.jpg')}}" class="card-img-top" alt="..." style="height: 267px; !important;">
                    @endif
{{--                    @if (!is_null($user1->image))<img src="storage\images\{{$user1->image}}" class="card-img-top" alt="..." style="height: 267px; !important;">  @endif--}}


                    <div class="card-body text-center">
                        <h5 class="card-title">

                            <strong>{{\Illuminate\Support\Facades\Auth::user()->name}}</strong>
                        </h5>
                        <h6>{{$userprofiles->kafName}}</h6>
                        <h6>{{$userprofiles->lavozim}}</h6>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 text-right">
                                    <img src="{{asset('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0hQbEzmtyhO_VNZGC5Yvm8Pu7Obwdg5bnCA&usqp=CAU')}}" width="36px;" alt="">
                                </div>
                                <div class="col-md-6 text-left m-0 ml-0 pl-0">
                                    <a href="{{url('/user/reyting')}}"><span style="font-size: 16px; " class=" badge badge-pill badge-warning badge-counter">{{$val1->rey1}}</span></a>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class="card " style="border-radius: 2%; border-color: white">
{{--                    <div class="card-header"><strong>{{ __('Umumiy ma\'lumotlar') }}</strong></div>--}}
                    <div class="card-body ">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-hover table-responsive-lg " style="border: none">
                                        <tr ><td class="text-center" style="background-color: rgba(8,34,201,0.37); border-radius: 16px;">
                                                <img src="{{asset('calendar.svg')}}" width="36px" alt=""></td><td>Tavallud sanasi:</td><td>
                                            {{$userprofiles->born}}</tr>

                                        <tr ><td class="text-center" style="background-color:rgba(91,97,190,0.37); border-radius: 16px">
                                                <img src="{{asset('graduated.svg')}}" width="36px" alt=""></td><td>Malumoti:</td><td>@if($userprofiles->malumot==1){{('Bakalavr')}}@elseif($userprofiles->malumot==2){{('Diplomli mutaxassis')}}@elseif($userprofiles->malumot==3){{('Magistr')}}@endif</td></tr>
                                        <tr><td class="text-center" style="background-color: rgba(120,210,125,0.37); border-radius: 16px">
                                                <img src="{{asset('certificate.svg')}}" width="36px" alt=""></td><td>Ma'lumoti bo'yicha mutaxassisligi:</td><td>{{$userprofiles->mutaxassislik}}</td></tr>
                                        <tr><td class="text-center" style="background-color:  rgba(115,220,224,0.37); border-radius: 16px">
                                                <img src="{{asset('calendar.png')}}" width="36px" alt=""></td><td>IIOda qachondan:</td><td>{{$userprofiles->iioq}}</td></tr>

                                        <tr><td class="text-center" style="background-color: rgba(187,89,167,0.37); border-radius: 16px">
                                                <img src="{{asset('year.svg')}}" width="36px" alt=""></td><td>Amaliy ish tajribasi:</td><td><span style="font-size: 18px;" class="badge badge-success badge-colors">{{$userprofiles->ait}}</span></td></tr>
                                        <tr><td class="text-center" style="background-color: rgba(220,143,157,0.37); border-radius: 16px">
                                                <img src="{{asset('year.svg')}}" width="36px" alt=""></td><td>Pedagogik ish tajribasi:</td><td><span style="font-size: 18px;" class="badge badge-success badge-colors">{{$userprofiles->pit}}</span></td></tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card" style="border-radius: 2%; border-color: white">
                    {{--                    <div class="card-header"><strong>{{ __('Umumiy ma\'lumotlar') }}</strong></div>--}}
                    <div class="card-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-hover table-responsive-lg -border-none">
                                        <tr><td class="text-center" style="background-color: rgba(245,2,2,0.37); border-radius: 16px">
                                                <img src="{{asset('diploma.png')}}" width="36px" alt=""></td><td>Ilmiy darajasi:<td>@if($userprofiles->ilmiyDaraja == 1 &&  $userprofiles->ilmiydarajastatus != null){{('PhD')}}@elseif($userprofiles->ilmiyDaraja == 2 &&  $userprofiles->ilmiydarajastatus != null){{('DSc')}}@elseif($userprofiles->ilmiyDaraja == 3 &&  $userprofiles->ilmiydarajastatus == null){{('Mavjud emas')}}@endif</td><td></td></tr>
                                        <tr><td class="text-center" style="background-color: rgba(171,1,175,0.37); border-radius: 16px">
                                                <img src="{{asset('file-download.svg')}}" width="36px" alt=""></td><td>Ilmiy daraja ilovasi:</td><td>@if(!empty($userprofiles->ilmiyDarajalova)  &&  $userprofiles->ilmiydarajastatus != null)<a href="{{asset('storage/diplom/'.$userprofiles->ilmiyDarajalova)}}" target="_blank"><img src="{{asset('graduation-diploma.png')}}" width="36px" alt=""></a>@endif</td></tr>
                                        <tr><td class="text-center" style="background-color: rgba(33,30,136,0.37); border-radius: 16px">
                                                <img src="{{asset('graduation-diploma.png')}}" width="36px" alt=""></td><td>Ilmiy unvon::</td><td>@if($userprofiles->iu == 1 && $userprofiles->ilmiyunvonstatus != null){{('Dotsent')}}@elseif($userprofiles->iu == 2 && $userprofiles->ilmiyunvonstatus != null){{('Professor')}}@elseif($userprofiles->iu == 5 ){{('Mavjud emas')}}@endif</td></tr>
                                        <tr><td class="text-center" style="background-color: rgba(9,112,115,0.37); border-radius: 16px">
                                                <img src="{{asset('file-download.svg')}}" width="36px" alt=""></td><td>Ilmiy unvon ilovasi:</td><td>@if(!empty($userprofiles->iui && $userprofiles->ilmiyunvonstatus != null))<a href="{{asset('storage/diplom/'.$userprofiles->iui)}}" target="_blank"><img src="{{asset('graduation-diploma.png')}}" width="36px" alt=""></a>@endif</td></tr>
                                        <tr><td class="text-center" style="background-color: rgba(82,182,78,0.37); border-radius: 16px">
                                                <img src="{{asset('meeting.svg')}}" width="36px" alt=""></td><td>Kuratorlik guruhi:</td><td>{{$userprofiles->iu}}</td></tr>
                                        <tr><td class="text-center" style="background-color: rgba(215,158,53,0.37); border-radius: 16px">
                                                <img src="{{asset('classroom.png')}}" width="36px" alt=""></td><td>Auditoriya soati:<td></td></tr>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
{{--            <div class="col-md-2">--}}
{{--                <div class="card" style="border-radius: 2%; border-color: white">--}}
{{--                    --}}{{--                    <div class="card-header"><strong>{{ __('Umumiy ma\'lumotlar') }}</strong></div>--}}
{{--                    <div class="card-body">--}}
{{--                        <div class="container">--}}
{{--                            <div class="row">--}}
{{--                                <div class="col-md-12">--}}
{{--                                    <table class="table table-hover table-responsive-lg -border-none">--}}
{{--                                        <tr><td>Maqolalar:</td><td><span  style="font-family: 'Denk One', sans-serif, cursive;font-size: 16px; font-weight: bolder;float: right; color: rgb(48,172,210)">36</span></td></tr>--}}
{{--                                        <tr><td>Dissertatsiyalar:</td><td><span  style="font-family: 'Denk One', sans-serif, cursive;font-size: 16px; font-weight: bolder;float: right; color: rgb(48,172,210)">24</span></td></tr>--}}
{{--                                        <tr><td>O'quv materiallari:</td><td><span  style="font-family: 'Denk One', sans-serif, cursive;font-size: 16px; font-weight: bolder;float: right; color: rgb(48,172,210)">12</span></td></tr>--}}
{{--                                        <tr><td>Malaka oshirishlar:</td><td><span  style="font-family: 'Denk One', sans-serif, cursive;font-size: 16px; font-weight: bolder;float: right; color:  rgb(48,172,210)">8</span></td></tr>--}}
{{--                                        <tr><td>Patent va guvohnomalar:</td><td><span  style="font-family: 'Denk One', sans-serif, cursive;font-size: 16px; font-weight: bolder;float: right; color:  rgb(48,172,210)">4</span></td></tr>--}}
{{--                                        <tr><td>Grantlar:</td><td><span  style="font-family: 'Denk One', sans-serif, cursive;font-size: 16px; font-weight: bolder;float: right; color:  rgb(48,172,210)">2</span></td></tr>--}}
{{--                                    </table>--}}
{{--                                </div>--}}

{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
            <div class="col-md-3">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title text-uppercase text-muted mb-0">Maqolalar</h5>
                                <span class="h4 font-weight-bold mb-0"><a href="{{url('user/maqolas')}}">{{$all_soni->maqola_soni}}</a></span>
                            </div>
                            <div class="col-auto">
                                <div class=" thbody icon icon-shape  text-white rounded-circle shadow">
                                    <i class="fas fa-scroll fa-0.5x"></i>
                                </div>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
                            <span class="text-nowrap">O'quv yili mobaynida</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title text-uppercase text-muted mb-0">Dissertatsiya</h5>
                                <span class="h4 font-weight-bold mb-0"><a href="{{url('user/dissertats')}}">{{$all_soni->diss_soni}}</a></span>
                            </div>
                            <div class="col-auto">
                                <div  class="thbody icon icon-shape  text-white rounded-circle shadow">
                                    <i class="fas fa-atom"></i>
                                </div>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 2.48%</span>
                            <span class="text-nowrap">O'quv yili mobaynida</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title text-uppercase text-muted mb-0">Maxorat darslari</h5>
                                <span class="h4 font-weight-bold mb-0 "><a href="{{url('user/dars')}}">{{$all_soni->dars_soni}}</a></span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape thbody text-white rounded-circle shadow">
                                    <i class="fas fa-chalkboard-teacher"></i>
                                </div>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 1.48%</span>
                            <span class="text-nowrap">O'quv yili mobaynida</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title text-uppercase text-muted mb-0">O'quv materiallari</h5>
                                <span class="h4 font-weight-bold mb-0"><a href="{{url('user/materials')}}">{{$all_soni->dars_soni}}</a></span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape thbody text-white rounded-circle shadow">
                                    <i class="fas fa-book fa-2x"></i>
                                </div>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 0.36%</span>
                            <span class="text-nowrap">O'quv yili mobaynida</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <p></p>
        <div class="row">
            <div class="col-md-3">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title text-uppercase text-muted mb-0">Patentlar</h5>
                                <span class="h4 font-weight-bold mb-0"><a href="{{url('user/patents')}}">{{$all_soni->patent_soni}}</a></span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape thbody text-white rounded-circle shadow">
                                    <i class="fas fa-certificate"></i>
                                </div>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 0.04%</span>
                            <span class="text-nowrap">O'quv yili mobaynida</span>
                        </p>
                    </div>
                </div>
            </div><div class="col-md-3">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title text-uppercase text-muted mb-0">Loyihalar</h5>
                                <span class="h4 font-weight-bold mb-0"><a href="{{url('user/loyiha')}}">{{$all_soni->loyiha_soni}}</a></span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape thbody text-white rounded-circle shadow">
                                    <i class="fas fa-pencil-ruler"></i>
                                </div>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 8.48%</span>
                            <span class="text-nowrap">O'quv yili mobaynida</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title text-uppercase text-muted mb-0">To'garaklar</h5>
                                <span class="h4 font-weight-bold mb-0"><a href="{{url('user/kurs')}}">{{$all_soni->kurs_soni}}</a></span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape thbody text-white rounded-circle shadow">
                                    <i class="fas fa-users"></i>
                                </div>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 7.84%</span>
                            <span class="text-nowrap">O'quv yili mobaynida</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title text-uppercase text-muted mb-0">Malaka oshirishlar</h5>
                                <span class="h4 font-weight-bold mb-0"><a href="{{url('user/malaka')}}">{{$all_soni->malaka_soni}}</a></span>
                            </div>
                            <div class="col-auto">
                                <div class="icon icon-shape thbody text-white rounded-circle shadow">
                                    <i class="fas fa-hat-wizard"></i>
                                </div>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i>1.08%</span>
                            <span class="text-nowrap">O'quv yili mobaynida</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <p></p>
        <div class="row">
            <div class="col-md-6">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">


{{--                                <span class="h4 font-weight-bold mb-0">120</span>--}}

                            <div class="col-auto">
                                <canvas id="myChart" width="600" height="400"></canvas>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
{{--                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 7.84%</span>--}}
                            <span class="text-nowrap ">O'qituvchinig kompitentlik diagrammasi</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">


                            {{--                                <span class="h4 font-weight-bold mb-0">120</span>--}}

                            <div class="col-auto">
                                <canvas id="myChart2" width="600" height="600"></canvas>
                            </div>
                        </div>
                        <p class="mt-3 mb-0 text-muted text-sm">
                            {{--                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 7.84%</span>--}}
                            <span class="text-nowrap ">O'qituvchinig kompitentlik diagrammasi</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>


    </div>
@endsection
