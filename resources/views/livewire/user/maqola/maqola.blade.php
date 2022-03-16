<div>
    @include('livewire.user.maqola.add')
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
        <button class="btn thbody"  data-toggle="modal" data-target="#maqolakiritish"><i class="fa fa-plus"></i> Maqola qo'shish</button>
        <hr>
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
