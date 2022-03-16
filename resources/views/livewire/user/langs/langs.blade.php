<div>
    @include('livewire.user.langs.add')
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
        <button class="btn thbody"  data-toggle="modal" data-target="#langkiritish"><i class="fa fa-plus"></i> Til qo'shish</button>
        <hr>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead class="thbody">
            <th>#</th>
            <th>Til turi</th>
            <th>Bilish darajasi</th>
            <th>Ilova</th>
            <th>Ball</th>
            </thead>
            @foreach($langs as $item)
                <tr class="text-dark">
                    <td>{{$item->id}}</td>
                    <td>{{$item->lang_name}} </td>
                    <td><span class="badge badge-pill badge-success">{{$item->lang_type}}</span></td>
                    <td><a href="{{asset('storage/lang/'.$item->ilova)}}" target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                    <td><span class="badge badge-pill badge-success">{{$item->ball}}</span></td>
                </tr>
            @endforeach
        </table>
    </div>
</div>
