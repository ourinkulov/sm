<div>
    @include('livewire.admin.kafedra.add')
{{--    @include('livewire.admin.kurs.delete')--}}
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
        <button class="btn " style="background-color: rgba(30,80,225,0.75); color:white;" data-toggle="modal" data-target="#"><i class="fa fa-plus"></i> Kafedra qo'shish</button>
        <hr>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead style="background-color: rgba(167,182,227,0.33); ">
            <th>#</th>
            <th>Kafedra</th>
            <th>Kafedra raxbari</th>
            <th>Amallar</th>

            </thead>
            @foreach($kafedras as $item)
                <tr class="text-dark">
                    <td>{{$item->id}}</td>
                    <td>{{$item->kafName}}</td>
                    <td>@if(!empty($item->name)){{$item->name}}@else <span style="font-weight:bolder; color: #d73d3d">{{'Tizimga kiritilmagan'}}</span>@endif</td>
                    <td>
                        <a href=""  data-toggle="modal" type="btn" data-target="#" ><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>
                        <a href=" " class="ml-4" type="btn"   data-toggle="modal" data-target="#"><img src="{{asset('delete.png')}}" height="22px" alt="" ></a>
                    </td>
                </tr>
            @endforeach
        </table>
    </div>
</div>







