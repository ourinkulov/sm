@extends('layouts.ilmiyApp')
@section('content')
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-7">Ilmiy-tadqiqot ishlarini muvofiqlashtirish bo'limi</h1>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
               <div class="card">
                   <div class="card-body">
                       Dissertatsiya himoyalari
                       <canvas id="myChart" width="500" height="100" ></canvas>
                   </div>
               </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-6">
               <div class="card">
                   <div class="card-body">
                       Ilmiy darajaning o'sish ko'rsatkichlari (Yillar kesimida)
                       <canvas id="myChart2" width="500" height="100" ></canvas>
                   </div>
               </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        Ilmiy unvonlarning o'sish ko'rsatkichlari (Yillar kesimida)
                        <canvas id="myChart3" width="500" height="100" ></canvas>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        Ilmiy daraja
                        <canvas id="myChart4" ></canvas>
                    </div>
                </div>
            </div>
{{--            <div class="col-md-2"></div>--}}
            <div class="col-md-6">
               <div class="card">
                   <div class="card-body">
                       Ilmiy unvon
                       <canvas id="myChart5"></canvas>
                   </div>
               </div>
            </div>
        </div>
    </div>
@endsection

