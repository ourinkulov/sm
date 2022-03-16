<div>
{{--    @include('livewire.admin.teachers.add')--}}
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
                <div class="col-md-2">
                  <div class="form-group">
                      <label for="">O'qituvchilar soni:</label>
                      <span class="form-control">
                          @if(!empty($teachers))
                              {{count($teachers)}}
                          @endif
                      </span>
                  </div>
                </div>
            </div>
        <table class="table table-hover table-responsive-lg text-black-50 bg-white">
            <thead style="background-color: rgba(167,182,227,0.33); ">
            <th>#</th>
            <th> - </th>
            <th>Professor-o'qituvchi </th>
            <th>Lavozimi </th>
{{--            <th>Amallar</th>--}}

            </thead>
            @if(!empty($teachers))
                @foreach($teachers as $k=>$item)
                    <tr class="text-dark">
                        <td>{{++$k}}</td>
                        <td><img src="{{asset('storage/profileimages').'/'.$item->profileimage}}" alt="" width="64px" style="border-radius: 45%"></td>
                        @if(!empty($item->id))<td><a href="{{route('admin.oneteacher',['id'=>$item->id])}}}">{{$item->name}}</a></td>@else<td><a href="{{route('admin.oneteacher')}}}">{{$item->name}}</a></td>@endif
                        <td>{{$item->lavozim}}</td>
{{--                        <td>--}}
{{--                            <a href=""  data-toggle="modal" type="btn" data-target="#" ><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>--}}
{{--                            <a href=" " class="ml-4" type="btn"   data-toggle="modal" data-target="#"><img src="{{asset('delete.png')}}" height="22px" alt="" ></a>--}}
{{--                        </td>--}}
                    </tr>
                @endforeach
            @endif
        </table>
    </div>
</div>







