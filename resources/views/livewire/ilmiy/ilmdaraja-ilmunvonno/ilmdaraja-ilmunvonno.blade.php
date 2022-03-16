<div class="ml-2">
    <span><strong>Ilmiy daraja va unvonga </strong>  ega bo'lmagan professor-o'qituvchilar</span>

    <div class="row">

        <table class="table table-responsive-lg ">
            <thead>
            <th>#</th>
            <th>-</th>
            <th>F.I.O</th>
            <th>Kafedra</th>
            <th>Lavozim</th>
            <th>Ichki ishlarda</th>
            <th>Amaliy IT</th>
            <th>Pedagogik IT</th>
            </thead>a
            <tbody class="bg-white">
            @foreach($idiume as $item)
                <tr>
                    <td>1</td>
                    <td><img src="{{asset('storage/profileimages/'.$item->profileimage)}}" style="border-radius: 50%" alt="" width="96px"></td>
                    <td>{{$item->name}}</td>
                    <td>{{$item->kafName}}</td>
                    <td>{{$item->lavozim}}</td>
                    <td>{{$item->iioq}}</td>
                    <td>{{$item->ait}}</td>
                    <td>{{$item->pit}}</td>
                </tr>


            @endforeach
            </tbody>

        </table>

    </div>

</div>
