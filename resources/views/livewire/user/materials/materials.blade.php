<div>
    @include('livewire.user.materials.add')
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
        <button class="btn " style="background-color: rgb(0 35 141); color:white;" data-toggle="modal" data-target="#materialkiritish"><i class="fa fa-plus"></i> Material qo'shish</button>
        <hr>
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
