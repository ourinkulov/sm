<div wire:ignore.self class="modal fade bd-example-modal-lg" id="langkiritish" tabindex="-1" role="dialog" aria-labelledby="patentkiritish" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="langkiritish">Til qo'shish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">Til turi</label>
                        <select name="" id="" wire:model="lang_name" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($lang_names as $item)
                                <option value="{{$item->id}}">{{$item->lang_name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Til turi</label>
                        <select name="" id="" wire:model="lang_type" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($lang_types as $item)
                                <option value="{{$item->id}}">{{$item->lang_type}}</option>
                            @endforeach
                        </select>
                    </div>
{{--                    php artisan make:livewire --}}


                    <div class="form-group">
                        <label for="">
                            Sertifikat olingan sana:
                        </label>
                        <input type="date" wire:model.lazy="bsana" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="">
                            Amal qilish sanasi
                        </label>
                        <input type="date" wire:model.lazy="ysana" class="form-control">
                    </div>


                    <div class="form-group">
                        <label for="">
                            Ilova
                        </label>
                        <input type="file" wire:model="ilova" class="form-control" />
                    </div>
                    <button class="btn btn-primary" wire:click.prevent="store()">Saqlash</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>
            </div>
        </div>
    </div>
</div>
