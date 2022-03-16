<div wire:ignore.self class="modal fade bd-example-modal-lg" id="materialnitasdiqlash" tabindex="-1" role="dialog" aria-labelledby="materialnitasdiqlash" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="materialnitasdiqlash">Materialni tasdiqlash</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">Material turi</label>
                        <select name="" id="" wire:model="turi" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($material_turi as $item)
                                <option value="{{$item->id}}">{{$item->turi}}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="">
                            Mualliflar soni
                        </label>
                        <input type="text" wire:model.lazy="muallif" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">
                            Nechta bosma taboqda <strong class="bg-warning">(1 bosma taboq 16 bet)</strong>:
                        </label>
                        <input type="text" wire:model.lazy="taboq" class="form-control" />
                    </div>
                    <button class="btn btn-primary" wire:click.prevent="update()">Saqlash</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>
            </div>
        </div>
    </div>
</div>
