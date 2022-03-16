<div wire:ignore.self class="modal fade bd-example-modal-lg" id="malakatasdiqlash" tabindex="-1" role="dialog" aria-labelledby="patentkiritish" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="malakatasdiqlash">Malaka oshirish ma'lumotlarini qo'shish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">Malak oshirish turi </label>
                        <select name="" id="" wire:model="turi" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($malaka_turi as $item)
                                <option value="{{$item->id}}">{{$item->turi}}</option>
                            @endforeach
                        </select>
                    </div>
{{--                    <div class="form-group">--}}
{{--                        <label for="">O'quv yili</label>--}}
{{--                        <select name="" id="" wire:model="sana" class="form-control">--}}
{{--                            <option value="0">Tanlang</option>--}}
{{--                            @foreach($study_year as $item)--}}
{{--                                <option value="{{$item->id}}">{{$item->year}}</option>--}}
{{--                            @endforeach--}}
{{--                        </select>--}}
{{--                    </div>--}}
                    {{--                    php artisan make:livewire --}}


{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Mavzu:--}}
{{--                        </label>--}}
{{--                        <input type="text" wire:model.lazy="mavzu" class="form-control" />--}}
{{--                    </div>--}}
                    <div class="form-group">
                        <label for="">
                            Davomiyligi
                        </label>
                        <input type="number" wire:model.lazy="kun" class="form-control">
                    </div>


{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Ilova--}}
{{--                        </label>--}}
{{--                        <input type="file" wire:model="ilova" class="form-control" />--}}
{{--                    </div>--}}
                    <button class="btn btn-primary" wire:click.prevent="update()">Saqlash</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>
            </div>
        </div>
    </div>
</div>
