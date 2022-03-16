<div>
    @include('livewire.user.malakas.add')
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
        <button class="btn thbody"  data-toggle="modal" data-target="#malakakiritish"><i class="fa fa-hat-wizard"></i> Malaka oshirish ma'lumotlarini qo'shish</button>
        <hr>
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
