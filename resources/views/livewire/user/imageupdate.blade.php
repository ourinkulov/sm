<div wire:ignore.self class="modal fade bd-example-modal-lg" id="rasmyangilash" tabindex="-1" role="dialog" aria-labelledby="userimageupdate" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userimageupdate">Rasmni o'zgartirish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">
                            Rasmni tanlang
                        </label>
                        <input type="file" wire:model.lazy="profileimage" class="form-control" />
                    </div>
                    <button class="btn btn-primary" wire:click.prevent="profileimageupdate()">Saqlash</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>
            </div>
        </div>
    </div>
</div>
