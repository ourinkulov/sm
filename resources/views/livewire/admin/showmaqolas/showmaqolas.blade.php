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
                            <option value="0">Kafedrani tanlang</option>

                                @foreach($kafedras as $item)
                                    <option value="{{$item->id}}">{{$item->kafName}}</option>
                                @endforeach

                        </select>
                    </div>
                </form>
            </div>
{{--            <div class="col-md-2">--}}
{{--                <div class="form-group">--}}
{{--                    <label for="">Maqolalar soni:</label>--}}
{{--                    <span class="form-control">--}}
{{--                          @if(!empty($teachers))--}}
{{--                            {{count($teachers)}}--}}
{{--                        @endif--}}
{{--                      </span>--}}
{{--                </div>--}}
{{--            </div>--}}
        </div>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead style="background-color: rgba(167,182,227,0.33); ">
            <th>#</th>
            <th> Muallif</th>
            <th>Maqola turi</th>
            <th>Maqola miqyosi</th>
            <th>Maqola mavzusi</th>
            <th>Mualliflar</th>
            <th>Ilova</th>
            <th>Ball</th>


            </thead>
            @if(!empty($maqolas))
                @foreach($maqolas as $k=>$item)
                    <tr class="text-dark">
                        <td>{{++$k}}</td>
                        <td>{{$item->name}}</td>
                        <td>{{$item->turi}}</td>
                        <td>{{$item->miqyosi}}</td>
                        <td>{{$item->mavzu}}</td>
                        <td>{{$item->mualliflik}}</td>
                        <td><a href="{{asset('storage/maqolalar/'.$item->ilova)}}"><i class="fa fa-eye"></i></a></td>
                        <td>{{$item->ball}}</td>

                    </tr>
                @endforeach
            @endif
        </table>
    </div>
</div>







