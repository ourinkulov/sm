<div>
    @if($modalOpen)
    @include('livewire.admin.dars.add')
    @endif
    @include('livewire.admin.dars.confdelete')
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
            <h5>Kiritilgan darslar</h5>
{{--        <button class="btn btn-success" data-toggle="modal" data-target="#darsupdate"><i class="fa fa-plus"></i> Dars qo'shish</button>--}}
        <hr>
        <table class="table table-hover table-responsive-lg text-white text-center">
            <thead class="bg-primary">
            <th>#</th>
            <th>Kafedra</th>
            <th>F.I.O</th>
            <th>Dars mavzusi</th>
            <th>Dars turi</th>
            <th>Guruhlar</th>
            <th>Sana</th>
            <th>Ilova</th>
            <th>Amal</th>
            </thead>

            @foreach($dars as $item)
                <tr class="text-dark ">
                    <td>{{$item->id}}</td>
                    <td>{{$item->kafName}}</td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->mavzu}}</td>
                    <td ><span class="badge-warning badge-pill">{{$item->type}}</span></td>
                    <td>{{$item->guruh}}</td>
                    <td>{{$item->sana}}</td>
                    <td><a href="{{asset('storage/dars/'.$item->ilova)}} " target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                    <td>
{{--                        <button wire:click.prevent="update({{ $item->id }})"--}}
{{--                                class="flex px-4 py-2 bg-gray-500 text-gray-900 cursor-pointer">Edit</button>--}}
                        <a href="" data-toggle="modal" type="btn" data-target="#darsupdate" wire:click.prevent="update({{$item->id}})"><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>
                        <a href=" " type="btn"  wire:click.prevent="deleteId({{$item->id}})" data-toggle="modal" data-target="#confirmDelete"><img src="{{asset('delete.png')}}" height="22px" alt="" style="float: right"></a>
                    </td>
                </tr>
            @endforeach

        </table>

    </div>
</div>
