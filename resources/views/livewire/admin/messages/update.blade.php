<div wire:ignore.self class="modal fade bd-example-modal-lg" id="messageupdate" tabindex="-1" role="dialog" aria-labelledby="messageupdate" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="langtasdiqlash">E'lonni o'zgartirish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="" enctype="multipart/form-data">
                    @csrf
                    {{--                    <div class="form-group">--}}
                    {{--                        <label>Name</label>--}}
                    {{--                        <input type="text" name="name" class="form-control"/>--}}
                    {{--                    </div>--}}
                    <div class="form-group">
                        <label><strong>E'lon matni :</strong></label>
                        <textarea class="ckeditor form-control" name="description" wire:model="message"></textarea>
                    </div>


                    <div class="text-center" style="margin-top: 10px;">
                        <button type="submit" class="btn btn-success" wire:click.prevent="update()">Saqlash</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>
            </div>
        </div>
    </div>
</div>
