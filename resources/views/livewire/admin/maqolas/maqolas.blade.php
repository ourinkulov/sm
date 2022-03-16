<div class="container-fluid">
    @include('livewire.admin.maqolas.update')
    @include('livewire.admin.maqolas.delete')
    <h5 class="ml-4">Kiritilgan maqolalar</h5>
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
{{--            <button class="btn " style="background-color: rgba(30,80,225,0.75); color:white;" data-toggle="modal" data-target="#maqolakiritish"><i class="fa fa-plus"></i> Maqola qo'shish</button>--}}
            <hr>
            <table class="table table-hover table-responsive-lg text-black-50 bg-white text-center ">
                <thead class="bg-primary text-white">
                <th>#</th>
                <th>Muallif</th>
                <th>Maqola turi</th>
                <th>Maqola miqyosi</th>
                <th>Maqola mavzusi</th>
                <th>Mualliflar soni</th>
                <th>Ilova</th>
                <th>Amallar</th>
                </thead>
                @foreach($maqolas as $item)
                    <tr class="text-dark">
                        <td>{{$item->id}}</td>
                        <td>{{$item->name}}</td>
                        <td>{{$item->turi}}</td>
                        <td><span class="badge badge-pill badge-success">{{$item->miqyosi}}</span> </td>
                        <td>{{$item->mavzu}}</td>
                        <td>{{$item->mualliflik}}</td>
                        <td><a href="{{asset('storage/maqolalar/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                        <td>
                            <a href="" data-toggle="modal" type="btn" data-target="#maqolanitaxrirlash" wire:click.prevent="showMaqola({{$item->id}})"><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>
                            <a href=" " type="btn"  wire:click.prevent="deleteid({{$item->id}})" data-toggle="modal" data-target="#maqolaniochirish"><img src="{{asset('delete.png')}}" height="22px" alt="" style="float: right"></a>
                        </td>
                    </tr>
                @endforeach
            </table>
</div>
