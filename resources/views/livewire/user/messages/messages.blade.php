<div>
    <div class="container-fluid">
        <div class="row">
            @foreach($mes as $item)
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <div class="card-title ">
                                <div class="text-gray-800 small">{{$item->created_at}}</div>
                            </div>
                            {{$item->message}}
                        </div>
                        <span></span>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
