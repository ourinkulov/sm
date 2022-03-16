<div wire:ignore.self class="modal fade bd-example-modal-lg" id="dissertatsiyakiritish" tabindex="-1" role="dialog" aria-labelledby="dissertatsiyakiritish" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="dissertatsiyakiritish">Dissertatsiya qo'shish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">Dissertatsiya mavzusi</label>
                        <input type="text" wire:model="mavzu" class="form-control" placeholder="Dissertatsiya mavzusi ... ">
                    </div>

                    <div class="form-group">
                        <label for="">Dissertatsiya maqomi</label>
                        <select name="" id="" wire:model="maqomi" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($diss_maqomi as $item)
                                <option value="{{$item->id}}">{{$item->maqomi}}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="">
                            Ixtisoslik shifri
                        </label>
                        <input type="text" wire:model.lazy="shifr" class="form-control" placeholder="12.02... ">
                    </div>
                    <div class="form-group">
                        <label for="">
                            Ixtisoslik nomi
                        </label>
                        <input type="text" wire:model.lazy="nomi" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="">
                            Fan soxasi
                        </label>
                        <input type="text" wire:model.lazy="fan" class="form-control" />
                    </div>


                    <div class="form-group">
                        <label for="">
                            Mavzuning ilmiy kengash tomonidan tasdiqlangan sanasi
                        </label>
                        <input type="date" wire:model="tsana" class="form-control" />
                    </div>


                    <div class="form-group">
                                <label for="">Ximoya qilingan sana</label>
                                <input type="date" wire:model="ysana" class="form-control">
                    </div>
                    <div class="form-group">
                                <label for="">Dissertatsiya mavzusi</label>
                                <input type="file" wire:model="dalolatnoma" class="form-control" >
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
