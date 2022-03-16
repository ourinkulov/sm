@extends('layouts.kafedraApp')
@section('content')
    <div class="container-fluid ">

            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <h1 class="display-4">{{\Illuminate\Support\Facades\Auth::user()->name}}</h1>
                </div>
            </div>
        <table class="table table-responsive-lg text-center bg-white">
            <thead>
                <td>Tashkil etilgan:</td>
                <td>Shtat bo'yicha:</td>
                <td>Erkin yollanganlar:</td>
                <td>DSc:</td>
                <td>PhD:</td>
            </thead>

           <tr>
               <td><span class="table-fon badge-pill badge-dark">1994</span></td>
               <td><span class="table-fon badge-pill badge-dark">12</span></td>
               <td><span class="table-fon badge-pill badge-dark">9</span></td>
               <td><span class="table-fon badge-pill badge-dark">2</span></td>
               <td><span class="table-fon badge-pill badge-dark">4</span></td>


           </tr>

        </table>

        <div class="row">

            <div class="col-md-6 offset-3"><h3 class="text-center">Kafedra professor-o'qituvchilari</h3>
                <hr style="height: 3px"></div>
        </div>
        <div class="row offset-1">


            @foreach($teachers as $item)
                <div class="col-md-2">
                    <div class="card text-center">
                        @if(!empty($item->profileimage))
                            <img class="card-img-top" height="214px" src="{{asset('storage/profileimages/'.$item->profileimage)}}" alt="Card image cap">
                        @else
                            <img class="card-img-top" height="214px" src="{{asset('storage/profileimages/1633514222_icons8-expert-128.png')}}" alt="Card image cap">
                        @endif
                        <div class="card-body">
                            <div class="card-title"><span class="card_text">{{$item->name}}</span></div>
                            <p class="card-text"><small class="card_text2"><span>{{$item->lavozim}}</span></small></p>
                        </div>
                    </div>
                </div>
            @endforeach

        </div>
    </div>

@endsection
