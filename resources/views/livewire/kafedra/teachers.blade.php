
<div>
    @include('livewire.kafedra.add')

    <div class="conatiner ml-2">
        <div class="row">

            <div class="col-md-12">
                @if(session()->has('message-suc'))
                    <div class="alert alert-success">{{session('message-suc')}}
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
                <h5>{{$kafedraname}} o'qituvchilari</h5>
                    <hr>
                <button class="btn btn-info" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-user-plus"></i>  O'qituvchi qo'shish</button>
                <table class="table table-responsive-sm table-hover table-lg">
                    <thead class="bg-success text-white">
                    <th>#</th>
                    <th>F.I.O</th>
                    <th>Lavozim</th>
                    <th>Login</th>
                    <th>Parol</th>
                    </thead>
                    <tbody class="bg-white">
                   @foreach($teachers as $item=>$val)
                       <tr>
                           <td>{{++$item}}</td>
                           <td>{{$val->name}}</td>
                           <td>{{$val->lavozim}}</td>
                           <td>{{$val->email}}</td>
                           <td>
                               <input type="text" value="{{$val->open_pas}}" id="myPas" class="form-control">

                           </td>
                       </tr>
                   @endforeach
{{--                    <thead class="bg-success text-white">--}}
{{--                    <th>#</th>--}}
{{--                    <th>Name</th>--}}
{{--                    <th>Login</th>--}}
{{--                    <th>Parol</th>--}}
{{--                    </thead>--}}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
