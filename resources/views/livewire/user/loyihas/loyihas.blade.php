<div>
    @include('livewire.user.loyihas.add')
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
        <button class="btn thbody" data-toggle="modal" data-target="#loyihakiritish"><i class="fa fa-plus"></i> Loyiha qo'shish</button>
        <hr>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead class="thbody">
            <th>#</th>
            <th>Loyiha miqyosi (darajasi)</th>
            <th>Mavzusi</th>
            <th>Raqami</th>
            <th>Buyruq soni</th>
            <th>Boshlangan sana</th>
            <th>Yakunlangan sana</th>
            <th>Ilova</th>
            <th>Ball</th>
            </thead>
            @foreach($loyihas as $item)
                <tr class="text-dark">
                    <td>{{$item->id}}</td>
                    <td><span class="badge badge-pill badge-success">{{$item->miqyosi}}</span> </td>
                    <td>{{$item->mavzu}}</td>
                    <td><span class="badge badge-pill badge-success">{{$item->raqami}}</span></td>
                    <td><span class="badge badge-pill badge-success">{{$item->buyruq}}</span></td>
                    <td>{{$item->bsana}}</td>
                    <td>{{$item->ysana}}</td>
                    <td><a href="{{asset('storage/loyiha/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                    <td><span class="badge badge-pill badge-success">{{$item->ball}}</span></td>
                </tr>
            @endforeach
        </table>
    </div>
</div>
