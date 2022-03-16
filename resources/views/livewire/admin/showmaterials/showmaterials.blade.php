<div>
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
        <hr>
        <div class="row">
            <div class="col-md-4">
                <form action="">
                    <div class="form-group">
                        <label for="">Kafedralar</label>
                        <select name="" id="" wire:model="kaf_id" class="form-control" >
                            <option value=" ">Kafedrani tanlang</option>
                            @foreach($kafedras as $item)
                                <option value="{{$item->id}}">{{$item->kafName}}</option>
                            @endforeach
                        </select>
                    </div>
                </form>
            </div>
        </div>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead style="background-color: rgba(167,182,227,0.33); ">
            <th>#</th>
            <th> Muallif</th>
            <th>Turi</th>
            <th>Mavzu</th>
            <th>Taboq</th>
            <th>Mualliflar</th>
            <th>Ilova</th>
            <th>Ball</th>
            </thead>
            @if(empty($materials))
            @else
                @foreach($materials as $item)
                    <tr class="text-dark">
                        <td>{{$item->id}}</td>
                        <td>{{$item->name}}</td>
                        <td>{{$item->turi}}</td>
                        <td>{{$item->nomi}}</td>
                        <td>{{$item->taboq}}</td>
                        <td>{{$item->muallif}}</td>
                        <td><a href="{{asset('storage/material/'.$item->ilova)}}"><i class="fa fa-eye"></i></a></td>
                        <td>{{$item->ball}}</td>
                    </tr>
                @endforeach
            @endif
        </table>
    </div>
</div>







