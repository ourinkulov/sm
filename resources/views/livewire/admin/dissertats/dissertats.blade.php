<div>
    @include('livewire.admin.dissertats.add')
    @include('livewire.admin.dissertats.delete')
    <div class="container-fluid mt-2">
        @if(session()->has('message'))
            <div class="alert alert-success">{{session('message')}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif
        @if(session()->has('message-dan'))
            <div class="alert alert-danger">{{session('message-dan')}}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif
{{--        <button class="btn " style="background-color: rgba(30,80,225,0.75); color:white;" data-toggle="modal" data-target="#dissertatsiyakiritish"><i class="fa fa-plus"></i> Dissertatsiya qo'shish</button>--}}
        <hr>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead style="background-color: rgba(167,182,227,0.33); ">
            <th>#</th>
            <th>Muallif</th>
            <th>Mavzusi</th>
            <th>Maqomi</th>
            <th>Ixtisislik shifri</th>
            <th>Ixtisislik nomi</th>
            <th>Mavzuni IK tasdiqlagan sana</th>
            <th>Ximoya qilingan sana</th>
            <th>AJE dalolatnomasi</th>
            <th>Ball</th>
            <th>Amallar</th>
            </thead>
                        @foreach($diss as $item)
                            <tr class="text-dark">
                                <td>{{$item->id}}</td>
                                <td>{{$item->name}}</td>
                                <td>{{$item->mavzu}}</td>
                                <td><span class="badge badge-pill badge-success">{{$item->maqomi}}</span> </td>
                                <td>{{$item->shifr}}</td>
                                <td>{{$item->nomi}}</td>
                                <td>{{$item->tsana}}</td>
                                <td>{{$item->ysana}}</td>
                                <td>@if(!empty($item->dalolatnoma))<a href="{{asset('storage/diss/'.$item->dalolatnoma)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a>@endif</td>
                                <td><span class="badge badge-pill badge-info">{{$item->ball}}</span></td>
                                <td>
                                    <a href="" data-toggle="modal" type="btn" data-target="#dissertatsiyanitasdiqlash" wire:click.prevent="showDiss({{$item->id}})"><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>
                                    <a href=" " type="btn"  wire:click.prevent="deleteid({{$item->id}})" data-toggle="modal" data-target="#dissertatsiyaniuchirish"><img src="{{asset('delete.png')}}" height="22px" alt="" style="float: right"></a>
                                </td>
                            </tr>
                        @endforeach
        </table>
    </div>
</div>
