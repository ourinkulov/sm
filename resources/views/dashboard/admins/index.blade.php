@extends('layouts.adminApp')

@section('content')
    <div class="container-fluid">
        @if (session('status'))
            <div class="alert alert-success">
                {{session('status')}}
            </div>
        @endif
        @if (session('danger'))
            <div class="alert alert-success">
                {{session('danger')}}
            </div>
        @endif
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Professor-o'qituvchilar reytingi</h6>
                            </div>
                            <div class="card-body">

                                <table class="table  table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead >

                                    <th>Reyting</th>
                                    <th>-</th>
                                    {{--                                   <th>Rasm</th>--}}
                                    <th>F.I.O</th>
                                    <th>Lavozim</th>
                                    <th>Kafedra</th>
                                    <th>Ball</th>

                                    </thead>
                                    <tbody>
                                    @foreach($teach_reyting as $k=>$item)
                                        <tr>
                                            <td>{{++$k}}</td>
                                            <td><img src="{{asset('storage/profileimages/'.$item->profileimage)}}" alt="" width="64px" style="border-radius: 45%;"></td>
                                            <td>{{$item->name}}</td>
                                            <td>{{$item->lavozim}}</td>
                                            <td>{{$item->kafName}}</td>
                                            <td>{{$item->ball}}</td>
                                        </tr>
                                    @endforeach
                                    </tbody>



                                    {{--                                <tfoot>--}}
                                    {{--                                <tr>--}}
                                    {{--                                    <th>Reyting</th>--}}
                                    {{--                                    --}}{{--                                   <th>Rasm</th>--}}
                                    {{--                                    <th>F.I.O</th>--}}
                                    {{--                                     <th>Lavozim</th> --}}
                                    {{--                                    <th>Kafedra</th>--}}
                                    {{--                                    <th>Ball</th>--}}

                                    {{--                                </tr>--}}
                                    {{--                                </tfoot>--}}
                                    <tbody>
                                    {{--                                @foreach ($teacher10 as $k)--}}
                                    {{--                                    <tr>--}}
                                    {{--                                        <td>{{++$i}}</td>--}}
                                    {{--                                        --}}{{--                                       <td class="text-center"><img src="storage/images/{{$k->image}}" width="90px" height="90px" alt="" style="border-radius: 50%;"  > </td>--}}
                                    {{--                                        <td><a href="{{route('admin.getteacherprofil',$k->id)}}">{{$k->name}}</a></td>--}}
                                    {{--                                        --}}{{-- <td>{{$k->lavozim}}</td> --}}
                                    {{--                                        <td>{{$k->kname}}</td>--}}
                                    {{--                                        <td>{{number_format($k->sball,1)}}</td>--}}

                                    {{--                                    </tr>--}}
                                    {{--                                @endforeach--}}
                                    </tbody>

                                </table>
                                <a href="{{url('/admin/reytings')}}"><button class="btn btn-primary">Batafsil ...</button></a>


                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Eng faol kafedralar</h6>
                            </div>
                            <div class="card-body">

                                <table class="table  table-hover table-responsive-lg" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>Reyting</th>
                                        <th>Kafedra nomi</th>
                                        <th>Ball</th>

                                    </tr>
                                    </thead>
                                    @foreach($kafedra_reyting as $item=>$k)
                                        <tr>
                                            <td>{{++$item}}</td>
                                            <td>{{$k->kafName}}</td>
                                            <td>{{$k->ball}}</td>
                                        </tr>
                                    @endforeach
{{--                                    <tfoot>--}}
{{--                                    <tr>--}}
{{--                                        <th>Reyting</th>--}}
{{--                                        <th>Kafedra nomi</th>--}}
{{--                                        <th>Ball</th>--}}
{{--                                    </tr>--}}
{{--                                    </tfoot>--}}
                                    <tbody>
                                    {{--                                @foreach ($kaff as $kaf)--}}
                                    {{--                                    <tr>--}}
                                    {{--                                        <td>{{++$g}}</td>--}}
                                    {{--                                        <td>{{$kaf->kname}}</td>--}}
                                    {{--                                        <td>{{number_format($kaf->ball,1)}}</td>--}}
                                    {{--                                    </tr>--}}
                                    {{--                                @endforeach--}}
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Professor-o'qituvchilar ilmiy saloxiyat reytingi</h6>
                            </div>
                            <div class="card-body">

                                <table class="table  table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead >

                                    <th>Reyting</th>
                                    <th>-</th>
                                    {{--                                   <th>Rasm</th>--}}
                                    <th>F.I.O</th>
                                    <th>Lavozim</th>
                                    <th>Kafedra</th>
                                    <th>Ball</th>

                                    </thead>
                                    <tbody>
                                    @foreach($pedagogik_reyting as $k=>$item)
                                        <tr>
                                            <td>{{++$k}}</td>
{{--                                            <td><img src="{{asset('storage/profileimages/'.$item->profileimage)}}" alt="" width="64px" style="border-radius: 45%;"></td>--}}
                                            <td>{{$item->name}}</td>
                                            <td>{{$item->lavozim}}</td>
                                            <td>{{$item->kafName}}</td>
                                            <td>{{$item->ball}}</td>
                                        </tr>
                                    @endforeach
                                    </tbody>



                                    {{--                                <tfoot>--}}
                                    {{--                                <tr>--}}
                                    {{--                                    <th>Reyting</th>--}}
                                    {{--                                    --}}{{--                                   <th>Rasm</th>--}}
                                    {{--                                    <th>F.I.O</th>--}}
                                    {{--                                     <th>Lavozim</th> --}}
                                    {{--                                    <th>Kafedra</th>--}}
                                    {{--                                    <th>Ball</th>--}}

                                    {{--                                </tr>--}}
                                    {{--                                </tfoot>--}}
                                    <tbody>
                                    {{--                                @foreach ($teacher10 as $k)--}}
                                    {{--                                    <tr>--}}
                                    {{--                                        <td>{{++$i}}</td>--}}
                                    {{--                                        --}}{{--                                       <td class="text-center"><img src="storage/images/{{$k->image}}" width="90px" height="90px" alt="" style="border-radius: 50%;"  > </td>--}}
                                    {{--                                        <td><a href="{{route('admin.getteacherprofil',$k->id)}}">{{$k->name}}</a></td>--}}
                                    {{--                                        --}}{{-- <td>{{$k->lavozim}}</td> --}}
                                    {{--                                        <td>{{$k->kname}}</td>--}}
                                    {{--                                        <td>{{number_format($k->sball,1)}}</td>--}}

                                    {{--                                    </tr>--}}
                                    {{--                                @endforeach--}}
                                    </tbody>

                                </table>
                                <a href="{{url('/admin/reytings')}}"><button class="btn btn-primary">Batafsil ...</button></a>


                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Professor-o'qituvchilar pedagogik saloxiyat reytingi</h6>
                            </div>
                            <div class="card-body">

                                <table class="table  table-hover table-responsive-lg" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>Reyting</th>
                                        <th>-</th>
                                        {{--                                   <th>Rasm</th>--}}
                                        <th>F.I.O</th>
                                        <th>Lavozim</th>
                                        <th>Kafedra</th>
                                        <th>Ball</th>

                                    </tr>
                                    </thead>
                                    @foreach($ilmiy_reyting as $k=>$item)
                                        <tr>
                                            <td>{{++$k}}</td>
{{--                                            <td><img src="{{asset('storage/profileimages/'.$item->profileimage)}}" alt="" width="64px" style="border-radius: 45%;"></td>--}}
                                            <td>{{$item->name}}</td>
                                            <td>{{$item->lavozim}}</td>
                                            <td>{{$item->kafName}}</td>
                                            <td>{{$item->ball}}</td>
                                        </tr>
                                    @endforeach
{{--                                    <tfoot>--}}
{{--                                    <tr>--}}
{{--                                        <th>Reyting</th>--}}
{{--                                        <th>Kafedra nomi</th>--}}
{{--                                        <th>Ball</th>--}}
{{--                                    </tr>--}}
{{--                                    </tfoot>--}}
                                    <tbody>
                                    {{--                                @foreach ($kaff as $kaf)--}}
                                    {{--                                    <tr>--}}
                                    {{--                                        <td>{{++$g}}</td>--}}
                                    {{--                                        <td>{{$kaf->kname}}</td>--}}
                                    {{--                                        <td>{{number_format($kaf->ball,1)}}</td>--}}
                                    {{--                                    </tr>--}}
                                    {{--                                @endforeach--}}
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div> -->


{{--        <div class="d-sm-flex align-items-center justify-content-between mb-4">--}}
{{--            <h1 class="h3 mb-0 text-gray-800">Boshqaruv paneli</h1>--}}
{{--            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Umumiy amallar</a>--}}
{{--        </div>--}}
        <div class="row">
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><a href="{{route('admin.kafedra')}}">O'quv kafedralari</a></div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$kafedra_soni}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fa fa-home fa-2x text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><a href="{{route('admin.teachers')}}">Professor-o'qituvchilar</a></div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$teacher_soni}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-user fa-2x text-success"></i>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1"><a href="{{route('admin.showmaqolas')}}">Maqolalar</a></div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">{{$maqola_soni}}</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-book-reader fa-2x text-info"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1"><a href="{{route('admin.showpatents')}}">Patent va guvohnomalar</a></div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$patent_soni}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-poll fa-2x text-warning"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1"><a href="{{route('admin.showmaterials')}}">O'quv materiallari</a></div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$material_soni}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fa fa-book-open fa-2x text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1"><a href="{{route('admin.showdars')}}">Ochiq va maxorat darslari</a></div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$dars_soni}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-address-card fa-2x text-success"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1"><a href="{{route('admin.showkurs')}}">To'garaklar</a></div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">{{$kurs_soni}}</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-info"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-secondary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-secondary text-uppercase mb-1"><a href="{{route('admin.showmalakas')}}">Malaka oshirishlar</a></div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$malakas_soni}}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-warning"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!----Kafedralar reytingi boshlandi--->

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">

                <div class="card shadow mb-2">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Kafedralar reytingi</h6>
                        <div class="dropdown no-arrow">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                <div class="dropdown-header">Dropdown Header:</div>
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                    </div>
                    <!-- Card Body -->
                    {{--                <div class="card-body">--}}
                    {{--                    <div class="chart-area">--}}
                    {{--                        <canvas id="myBarChart"></canvas>--}}
                    {{--                    </div>--}}
                    {{--                </div>--}}
                </div>
            </div>

        </div>




        <!--Kaf Reyting tugadi-->



        <div class="row">


            <div class="col-xl-4 col-lg-4">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Ilmiy salohiyatning o'sish dinamikasi</h6>

                    </div>

                    <div class="card-body">
                        <div class="chart-area">
                            <canvas id="myAreaChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-xl-8 col-lg-6">
                <div class="card shadow mb-4">

                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Ilmiy salohiyat</h6>
                    </div>

                    <div class="card-body">
                        <div class="chart-pie pt-4 pb-2">
                            <canvas id="myPieChart"></canvas>
                        </div>
                        <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> Fan doktorlari
                    </span>
                            <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> PhD
                    </span>
                            <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> Mavjud emas
                    </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">


            <div class="col-lg-6 mb-4">


                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Ilmiy darajalar statistikasi</h6>
                    </div>
                    <div class="card-body">
{{--                        <h4 class="small font-weight-bold">Fan doktorlari<span class="float-right">{{number_format($count->fdoktor*100/$count->teachers,2) ?? ''}}%</span></h4>--}}
{{--                        <div class="progress mb-4">--}}
{{--                            <div class="progress-bar bg-danger" role="progressbar" style="width: {{number_format($count->fdoktor*100/$count->teachers,2) ?? ''}}%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>--}}
{{--                        </div>--}}
{{--                        <h4 class="small font-weight-bold">PhD <span class="float-right">{{number_format($count->phd*100/$count->teachers,2) ?? ''}}%</span></h4>--}}
{{--                        <div class="progress mb-4">--}}
{{--                            <div class="progress-bar bg-warning" role="progressbar" style="width: {{number_format($count->phd*100/$count->teachers,2) ?? ''}}%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>--}}
{{--                        </div>--}}
{{--                        <h4 class="small font-weight-bold">Mavjud emas <span class="float-right">{{number_format($count->idme*100/$count->teachers,2) ?? ''}}%</span></h4>--}}
{{--                        <div class="progress mb-4">--}}
{{--                            <div class="progress-bar" role="progressbar" style="width: {{number_format($count->idme*100/$count->teachers,2) ?? ''}}%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>--}}
{{--                        </div>--}}

                    </div>
                </div>


            </div>

            <div class="col-lg-6 mb-4">


                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Ilmiy unvonlar statistikasi</h6>
                    </div>
                    <div class="card-body">
{{--                        <h4 class="small font-weight-bold">Professorlar<span class="float-right"> {{number_format($count->professor*100/$count->teachers,2) ?? ''}}%</span></h4>--}}
{{--                        <div class="progress mb-4">--}}
{{--                            <div class="progress-bar bg-danger" role="progressbar" style="width: {{$count->professor*100/$count->teachers }}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="10"></div>--}}
{{--                        </div>--}}
{{--                        <h4 class="small font-weight-bold">Dotsentlar <span class="float-right">{{number_format($count->dotsent*100/$count->teachers,2) ?? ''}}%</span></h4>--}}
{{--                        <div class="progress mb-4">--}}
{{--                            <div class="progress-bar bg-warning" role="progressbar" style="width: {{$count->dotsent*100/$count->teachers}}%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>--}}
{{--                        </div>--}}
{{--                        <h4 class="small font-weight-bold">Ilmiy unvoni mavjud emas o'qituvchilar <span class="float-right">{{number_format($count->iume*100/$count->teachers,2) ?? ''}}%</span></h4>--}}
{{--                        <div class="progress mb-4">--}}
{{--                            <div class="progress-bar" role="progressbar" style="width: {{$count->iume*100/$count->teachers}}%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>--}}
{{--                        </div>--}}
                    </div>
                </div>
            </div>
        </div>



    </div>

@endsection

