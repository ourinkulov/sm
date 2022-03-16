<div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card" >
                    <div class="card-title text-center mt-2 mb-2"><img src="{{asset('storage/profileimages/'.$userName->profileimage)}}" alt="" width="86px" style="border-radius: 45%;"><h1>{{$userName->name}}</h1></div>

                </div>
            </div>
            <div class="col-md-12">
                    <div class="card" >
                        <div class="card-title"><h1>Maqolalar</h1></div>
                        <div class="card-body">
                            <table class="table table-hover table-responsive-lg text-black-50 bg-white">
                                <thead class="thbody">
                                <th>#</th>
                                <th>Maqola turi</th>
                                <th>Maqola miqyosi</th>
                                <th>Maqola mavzusi</th>
                                <th>Mualliflar soni</th>
                                <th>Ilova</th>
                                <th>Ball</th>
                                </thead>
                                @foreach($maqolas as $item)
                                    <tr class="text-dark">
                                        <td>{{$item->id}}</td>
                                        <td>{{$item->turi}}</td>
                                        <td><span class="badge badge-pill badge-success">{{$item->miqyosi}}</span> </td>
                                        <td>{{$item->mavzu}}</td>
                                        <td>{{$item->mualliflik}}</td>
                                        <td><a href="{{asset('storage/maqolalar/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                                        <td><span class="badge badge-pill badge-info">{{$item->ball}}</span></td>
                                    </tr>
                                @endforeach
                            </table>
                        </div>
                    </div>
            </div>
            <div class="col-md-12">
                <div class="card" >
                    <div class="card-title"><h1>Dissertatsiyalar</h1></div>
                    <div class="card-body">
                        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
                            <thead class="thbody">
                            <th>#</th>
                            <th>Mavzusi</th>
                            <th>Maqomi</th>
                            <th>Ixtisislik shifri</th>
                            <th>Ixtisislik nomi</th>
                            <th>Mavzuni IK tasdiqlagan sana</th>
                            <th>Ximoya qilingan sana</th>
                            <th>AJE dalolatnomasi</th>
                            <th>Ball</th>
                            {{--            <th>Dalolatnoma qo'shish</th>--}}
                            </thead>
                            @foreach($diss as $item)
                                <tr class="text-dark">
                                    <td>{{$item->id}}</td>
                                    <td>{{$item->mavzu}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->maqomi}}</span> </td>
                                    <td>{{$item->shifr}}</td>
                                    <td>{{$item->nomi}}</td>
                                    <td>{{$item->tsana}}</td>
                                    <td>{{$item->ysana}}</td>
                                    <td>@if(!empty($item->dalolatnoma))<a href="{{asset('storage/diss/'.$item->dalolatnoma)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a>@endif</td>
                                    <td>@if(!empty($item->dalolatnoma))<span class="badge badge-pill badge-info">{{$item->ball}}</span>@endif</td>
                                    {{--                    <td>--}}
                                    {{--                        @if($item->status != 2)<a href="" data-toggle="modal" type="btn" data-target="#dalolatnomaqushish" wire:click.prevent="showDiss({{$item->id}})"><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>@endif--}}
                                    {{--                    </td>--}}
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card" >
                    <div class="card-title"><h1>To'garaklar</h1></div>
                    <div class="card-body">
                        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
                            <thead class="thbody">
                            <th>#</th>
                            <th>Turi</th>
                            <th>Nomlanishi</th>
                            <th>O'quv yili</th>
                            <th>Ilova</th>
                            <th>Ball</th>
                            </thead>
                            @foreach($kurs as $item)
                                <tr class="text-dark">
                                    <td>{{$item->id}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->turi}}</span></td>
                                    <td>{{$item->nomi}}</td>
                                    <td>{{$item->year}}</td>
                                    <td><a href="{{asset('storage/kurs/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->ball}}</span></td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card" >
                    <div class="card-title"><h1>Til bilishi</h1></div>
                    <div class="card-body">
                        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
                            <thead class="thbody">
                            <th>#</th>
                            <th>Til turi</th>
                            <th>Bilish darajasi</th>
                            <th>Ilova</th>
                            <th>Ball</th>
                            </thead>
                            @foreach($langs as $item)
                                <tr class="text-dark">
                                    <td>{{$item->id}}</td>
                                    <td>{{$item->lang_name}} </td>
                                    <td><span class="badge badge-pill badge-success">{{$item->lang_type}}</span></td>
                                    <td><a href="{{asset('storage/lang/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->ball}}</span></td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card" >
                    <div class="card-title"><h1>Loyihalar</h1></div>
                    <div class="card-body">
                        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
                            <thead class="thbody">
                            <th>#</th>
                            <th>Loyiha miqyosi (darajasi)</th>
                            <th>Mavzusi</th>
                            <th>Raqami</th>
                            <th>Buyruq soni</th>
                            <th>Boshlangan sana</th>
                            <th>Yakunlangan sana</th>
                            <th>Ilova</th>
                            <th>Ball</th>
                            </thead>
                            @foreach($loyihas as $item)
                                <tr class="text-dark">
                                    <td>{{$item->id}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->miqyosi}}</span> </td>
                                    <td>{{$item->mavzu}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->raqami}}</span></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->buyruq}}</span></td>
                                    <td>{{$item->bsana}}</td>
                                    <td>{{$item->ysana}}</td>
                                    <td><a href="{{asset('storage/loyiha/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->ball}}</span></td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card" >
                    <div class="card-title"><h1>Malaka oshirishlar</h1></div>
                    <div class="card-body">
                        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
                            <thead class="thbody">
                            <th>#</th>
                            <th>Malaka oshirish turi</th>
                            <th>Mavzusi/th>
                            <th>O'quv yili</th>
                            <th>Davomiyligi</th>
                            <th>Ilova</th>
                            <th>Ball</th>
                            </thead>
                            @foreach($malakas as $item)
                                <tr class="text-dark">
                                    <td>{{$item->id}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->turi}}</span> </td>
                                    <td>{{$item->mavzu}}</td>
                                    <td>{{$item->year}}</td>
                                    <td>{{$item->kun}}</td>
                                    <td><a href="{{asset('storage/lang/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->ball}}</span></td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card" >
                    <div class="card-title"><h1>Materiallar</h1></div>
                    <div class="card-body">
                        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
                            <thead class="thbody">
                            <th>#</th>
                            <th>Material turi</th>
                            <th>Nomlanishi (Mavzusi)</th>
                            <th>Taboqi</th>
                            <th>Mualliflar soni</th>
                            <th>Sana</th>
                            <th>Ilova</th>
                            <th>Ball</th>
                            </thead>
                            @foreach($materials as $item)
                                <tr class="text-dark">
                                    <td>{{$item->id}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->turi}}</span> </td>
                                    <td>{{$item->nomi}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->taboq}}</span></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->muallif}}</span></td>
                                    <td>{{$item->sana}}</td>
                                    <td><a href="{{asset('storage/material/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->ball}}</span></td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card" >
                    <div class="card-title"><h1>Patentlar</h1></div>
                    <div class="card-body">
                        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
                            <thead class="thbody">
                            <th>#</th>
                            <th>Patent turi</th>
                            <th>Miqyosi (Darajasi)</th>
                            <th>Mavzusi</th>
                            <th>Raqami</th>
                            <th>Sana</th>
                            <th>Ilova</th>
                            <th>Ball</th>
                            </thead>
                            @foreach($patents as $item)
                                <tr class="text-dark">
                                    <td>{{$item->id}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->miqyosi}}</span> </td>
                                    <td>{{$item->nomi}}</td>
                                    <td><span class="badge badge-pill badge-success">{{$item->raqami}}</span></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->muallif}}</span></td>
                                    <td>{{$item->sana}}</td>
                                    <td><a href="{{asset('storage/material/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                                    <td><span class="badge badge-pill badge-success">{{$item->ball}}</span></td>
                                </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
