<div wire:ignore.self class="modal fade bd-example-modal-lg" id="maqolakiritish" tabindex="-1" role="dialog" aria-labelledby="maqolakiritish" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="maqolakiritish">Maqola qo'shish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">Maqola turi</label>
                        <select name="" id="" wire:model="maqola_turi_id" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($maqola_turi as $item)
                                <option value="{{$item->id}}">{{$item->turi}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Maqola miqyosi</label>

                        <select name="" id="" wire:model="maqola_miqyosi_id" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($maqola_miqyosi as $item)
                                <option value="{{$item->id}}">{{$item->miqyosi}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">
                            Maqola mavzusi
                        </label>
                        <input type="text" wire:model.lazy="maqola_mavzusi" class="form-control" placeholder=" Maqola mavzusi ... ">
                    </div>
                    <div class="form-group">
                        <label for="">
                            Mualliflar soni
                        </label>
                        <input type="text" wire:model.lazy="maqola_mualliflari" class="form-control" />
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
