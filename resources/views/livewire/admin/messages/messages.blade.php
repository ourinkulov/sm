<div>
    @include('livewire.admin.messages.add')
    @include('livewire.admin.messages.update')
    @include('livewire.admin.messages.delete')

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
        <button class="btn " style="background-color: rgba(30,80,225,0.75); color:white;" data-toggle="modal" data-target="#messagesaqlash"><i class="fa fa-plus"></i> E'lon qo'shish</button>
        <hr>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead style="background-color: rgba(167,182,227,0.33); " class="text-center">
            <th>#</th>
            <th>E'lon matni</th>
            <th>Kiritilgan sana</th>
            <th colspan="2">O'zgartirish | O'chirish</th>
            </thead>
            @foreach($mes as $item)
                <tr>
                    <td>{{$item->id}}</td>
                    <td>{{$item->message}}</td>
                    <td class="text-center">{{$item->created_at}}</td>
                    <td class="text-right">
                        <a href="" wire:click.prevent="showMessage({{$item->id}})"><i class="fa fa-pen" data-toggle="modal" data-target="#messageupdate"></i></a>

                    </td>
                    <td>
                        <a href="" data-toggle="modal" data-target="#elondelete" wire:click.prevent="deleteId({{$item->id}})"><i class="fa fa-trash"></i></a>
                    </td>
                </tr>
            @endforeach
        </table>
    </div>
</div>
