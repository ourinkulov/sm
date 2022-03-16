<div>
    @include('livewire.admin.materials.update')
    @include('livewire.admin.materials.delete')
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
{{--        <button class="btn " style="background-color: rgba(30,80,225,0.75); color:white;" data-toggle="modal" data-target="#materialtasdiqlash"><i class="fa fa-plus"></i> Maqola qo'shish</button>--}}
        <hr>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead style="background-color: rgba(167,182,227,0.33); ">
            <th>#</th>
            <th>Muallif</th>
            <th>Material turi</th>
            <th>Nomlanishi (Mavzusi)</th>
            <th>Taboqi</th>
            <th>Mualliflar soni</th>
            <th>Sana</th>
            <th>Ilova</th>
            <th>Amallar</th>
            </thead>
                        @foreach($materials as $item)
                            <tr class="text-dark">
                                <td>{{$item->id}}</td>
                                <td>{{$item->name}}</td>
                                <td><span class="badge badge-pill badge-success">{{$item->turi}}</span> </td>
                                <td>{{$item->nomi}}</td>
                                <td><span class="badge badge-pill badge-success">{{$item->taboq}}</span></td>
                                <td><span class="badge badge-pill badge-success">{{$item->muallif}}</span></td>
                                <td>{{$item->sana}}</td>
                                <td><a href="{{asset('storage/material/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                                <td>
                                    <a href="" data-toggle="modal" type="btn" data-target="#materialnitasdiqlash" wire:click.prevent="showMaterial({{$item->id}})"><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>
                                    <a href=" " type="btn"  wire:click.prevent="deleteid({{$item->id}})" data-toggle="modal" data-target="#materialniuchirish"><img src="{{asset('delete.png')}}" height="22px" alt="" style="float: right"></a>
                                </td>
                            </tr>
                        @endforeach
        </table>
    </div>
</div>
