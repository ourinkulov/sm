<div>
    @include('livewire.ilmiy.ilmiydaraja.add')
    @include('livewire.ilmiy.ilmiydaraja.confdelete')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md">
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
                <table class="table table-responsive-lg ">
                    <thead class="bg-success text-white">
                    <th>#</th>
                    <th>Muallif</th>
                    <th>Ilmiy daraja</th>
                    <th>Diplom</th>
                    <th>Tizimga kiritilgan</th>
                    <th>Amallar</th>
                    </thead>
                    <tbody class="bg-white">
                    @foreach($ilmiydaraja as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->name}}</td>
                            <td>{{$item->ilmiydaraja}}</td>
                            <td><a href="{{asset('storage/diplom/'.$item->ilmiyDarajalova)}}" target="_blank"><i class="fa fa-eye"></i></a></td>
                            <td>{{$item->created_at}}</td>
                            <td>
                                {{--                        <button wire:click.prevent="update({{ $item->id }})"--}}
                                {{--                                class="flex px-4 py-2 bg-gray-500 text-gray-900 cursor-pointer">Edit</button>--}}
                                <a href="" data-toggle="modal" type="btn" data-target="#ilmiydarajanitasdiqlash" wire:click.prevent="update({{$item->id}})"><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>
                                <a href=" " class="text-center ml-4" type="btn"  wire:click.prevent="deleteId({{$item->id}})" data-toggle="modal" data-target="#ilmiydarajadelete"><img src="{{asset('delete.png')}}" height="22px" alt="" style=""></a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
