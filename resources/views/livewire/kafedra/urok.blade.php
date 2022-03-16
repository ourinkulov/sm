
<div>


    <div class="conatiner ml-2">
        <div class="row">

            <div class="col-md-12">

                <h5 style="color: #047938">Kafedra o'qituvchilari tomonidan o'tkazilgan maxorat va ochiq darslar</h5>
                <hr>
{{--                <button class="btn btn-info" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-user-plus"></i>  O'qituvchi qo'shish</button>--}}
                <table class="table table-hover table-responsive-lg text-white text-center">
                    <thead style="background-color: rgba(44,140,71,0.75)">
                    <th>#</th>
                    <th>Kafedra</th>
                    <th>F.I.O</th>
                    <th>Dars mavzusi</th>
                    <th>Dars turi</th>
                    <th>Guruhlar</th>
                    <th>Sana</th>
                    <th>Ilova</th>
                    <th>Ball</th>

                    </thead>

                    @foreach($dars as $item)
                        <tr class="text-dark ">
                            <td>{{$item->id}}</td>
                            <td>{{$item->kafName}}</td>
                            <td>{{$item->name}}</td>
                            <td>{{$item->mavzu}}</td>
                            <td ><span class="badge-warning badge-pill">{{$item->type}}</span></td>
                            <td>{{$item->guruh}}</td>
                            <td>{{$item->sana}}</td>
                            <td><a href="{{asset('storage/dars/'.$item->ilova)}} " target="_blank"><i class="fa fa-eye fa-1x" style="color: darkblue"></i></a></td>
                            <td>{{$item->ball}}</td>
{{--                            <td>--}}
{{--                                --}}{{--                        <button wire:click.prevent="update({{ $item->id }})"--}}
{{--                                --}}{{--                                class="flex px-4 py-2 bg-gray-500 text-gray-900 cursor-pointer">Edit</button>--}}
{{--                                <a href="" data-toggle="modal" type="btn" data-target="#darsupdate" wire:click.prevent="update({{$item->id}})"><img src="{{asset('pencil.png')}}" height="22px" alt="" ></a>--}}
{{--                                <a href=" " type="btn"  wire:click.prevent="deleteId({{$item->id}})" data-toggle="modal" data-target="#confirmDelete"><img src="{{asset('delete.png')}}" height="22px" alt="" style="float: right"></a>--}}
{{--                            </td>--}}
                        </tr>
                    @endforeach

                </table>
            </div>
        </div>
    </div>
</div>
