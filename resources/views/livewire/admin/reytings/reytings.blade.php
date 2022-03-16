<div>
    {{--    @include('livewire.admin.teachers.add')--}}
    {{--    @include('livewire.admin.kurs.delete')--}}
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Eng yaxshi professor - o'qituvchilar</h6>
                    </div>
                    <div class="card-body">

                        <table class="table  table-hover" id="dataTable" width="100%" cellspacing="0">
                            <thead >

                            <th>Reyting</th>
                            <th>-</th>
                            {{--                                   <th>Rasm</th>--}}
                            <th>F.I.O</th>
                            <th>Lavozim</th>
                            <th>Kafedra</th>
                            <th>Ball</th>

                            </thead>
                            <tbody>
                            @foreach($teach_reyting as $k=>$item)
                                <tr>
                                    <td>{{++$k}}</td>
                                    <td><img src="{{asset('storage/profileimages/'.$item->profileimage)}}" alt="" width="64px" style="border-radius: 45%;"></td>
                                    <td>{{$item->name}}</td>
                                    <td>{{$item->lavozim}}</td>
                                    <td>{{$item->kafName}}</td>
                                    <td>{{$item->ball}}</td>
                                </tr>
                            @endforeach
                            </tbody>


                            {{--                                <tfoot>--}}
                            {{--                                <tr>--}}
                            {{--                                    <th>Reyting</th>--}}
                            {{--                                    --}}{{--                                   <th>Rasm</th>--}}
                            {{--                                    <th>F.I.O</th>--}}
                            {{--                                     <th>Lavozim</th> --}}
                            {{--                                    <th>Kafedra</th>--}}
                            {{--                                    <th>Ball</th>--}}

                            {{--                                </tr>--}}
                            {{--                                </tfoot>--}}
                            <tbody>
                            {{--                                @foreach ($teacher10 as $k)--}}
                            {{--                                    <tr>--}}
                            {{--                                        <td>{{++$i}}</td>--}}
                            {{--                                        --}}{{--                                       <td class="text-center"><img src="storage/images/{{$k->image}}" width="90px" height="90px" alt="" style="border-radius: 50%;"  > </td>--}}
                            {{--                                        <td><a href="{{route('admin.getteacherprofil',$k->id)}}">{{$k->name}}</a></td>--}}
                            {{--                                        --}}{{-- <td>{{$k->lavozim}}</td> --}}
                            {{--                                        <td>{{$k->kname}}</td>--}}
                            {{--                                        <td>{{number_format($k->sball,1)}}</td>--}}

                            {{--                                    </tr>--}}
                            {{--                                @endforeach--}}
                            </tbody>
                        </table>


                    </div>
                </div>
            </div>

{{--            <div class="col-lg-4 col-md-4">--}}
{{--                <div class="card shadow mb-4">--}}
{{--                    <div class="card-header py-3">--}}
{{--                        <h6 class="m-0 font-weight-bold text-primary">Eng faol kafedralar</h6>--}}
{{--                    </div>--}}
{{--                    <div class="card-body">--}}

{{--                        <table class="table  table-hover table-responsive-lg" id="dataTable" width="100%" cellspacing="0">--}}
{{--                            <thead>--}}
{{--                            <tr>--}}
{{--                                <th>Reyting</th>--}}
{{--                                <th>Kafedra nomi</th>--}}
{{--                                <th>Ball</th>--}}

{{--                            </tr>--}}
{{--                            </thead>--}}
{{--                            @foreach($kafedra_reyting as $item=>$k)--}}
{{--                                <tr>--}}
{{--                                    <td>{{++$item}}</td>--}}
{{--                                    <td>{{$k->kafName}}</td>--}}
{{--                                    <td>{{$k->ball}}</td>--}}
{{--                                </tr>--}}
{{--                            @endforeach--}}
{{--                            <tfoot>--}}
{{--                            <tr>--}}
{{--                                <th>Reyting</th>--}}
{{--                                <th>Kafedra nomi</th>--}}
{{--                                <th>Ball</th>--}}
{{--                            </tr>--}}
{{--                            </tfoot>--}}
{{--                            <tbody>--}}
{{--                            --}}{{--                                @foreach ($kaff as $kaf)--}}
{{--                            --}}{{--                                    <tr>--}}
{{--                            --}}{{--                                        <td>{{++$g}}</td>--}}
{{--                            --}}{{--                                        <td>{{$kaf->kname}}</td>--}}
{{--                            --}}{{--                                        <td>{{number_format($kaf->ball,1)}}</td>--}}
{{--                            --}}{{--                                    </tr>--}}
{{--                            --}}{{--                                @endforeach--}}
{{--                            </tbody>--}}
{{--                        </table>--}}

{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
        </div>
    </div>
</div>







