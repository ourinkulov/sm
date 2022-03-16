<div wire:ignore.self class="modal fade bd-example-modal-lg" id="dalolatnomaqushish" tabindex="-1" role="dialog" aria-labelledby="dalolatnomaqushish" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="dalolatnomaqushish">Dalolatnoma qo'shish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">Ximoya qilingan sana</label>
                        <input type="date" wire:model="ysana" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">Dissertatsiya mavzusi</label>
                        <input type="file" wire:model="dalolatnoma" class="form-control" >
                    </div>

                    <button class="btn btn-primary" wire:click.prevent="update()">Qo'shish</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>
            </div>
        </div>
    </div>
</div>
