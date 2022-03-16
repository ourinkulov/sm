<div wire:ignore.self class="modal fade bd-example-modal-lg" id="userprofileupdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Profil ma'lumotlarini o'zgartirish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form action="">
                    <div class="form-group">
                        <label for="">
                            Tavallud sanangiz
                        </label>
                        <input type="date" class="form-control" wire:model="born">
                    </div>
                    <div class="form-group">
                        <label for="">
                            Ma'lumotingiz
                        </label>
                        <select name="" id="" wire:model.lazy="malumot" class="form-control">
                            <option value="0">Tanlang</option>
                            <option value="1">Oliy</option>
                            <option value="2">Diplomli mutaxassis</option>
                            <option value="3">Magistr</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">
                            Ma'lumot bo'yicha mutaxassisligingiz
                        </label>
                        <input type="text" wire:model.lazy="mutaxassislik" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="">
                            IIO qachondan
                        </label>
                        <input type="text" wire:model.lazy="iioq" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="">
                            Amaliy ish tajribangiz
                        </label>
                        <input type="text" wire:model.lazy="ait" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="">
                            Pedagogik ish tajribangiz
                        </label>
                        <input type="text" wire:model.lazy="pit" class="form-control" />
                    </div>


                    <button class="btn btn-primary" wire:click.prevent="profileupdate()">Saqlash</button>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>

            </div>
        </div>
    </div>
</div>
