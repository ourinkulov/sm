<div wire:ignore.self class="modal fade bd-example-modal-lg" id="messagesaqlash" tabindex="-1" role="dialog" aria-labelledby="messagesaqlash" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="langtasdiqlash">E'lon kiritish</h5>
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
{{--                    <div class="">--}}
{{--                        <label><strong>Kimga :</strong></label><br/>--}}
{{--                        <select class="form-control" name="cat"  wire:model="kafid">--}}
{{--                            <option value="0">PHP</option>--}}
{{--                            <option value="1">React</option>--}}
{{--                            <option value="2">JQuery</option>--}}
{{--                            <option value="3">Javascript</option>--}}
{{--                            <option value="4">Angular</option>--}}
{{--                            <option value="5">Vue</option>--}}
{{--                        </select>--}}
{{--                    </div>--}}

                    <div class="text-center" style="margin-top: 10px;">
                        <button type="submit" class="btn btn-success" wire:click.prevent="store()">Saqlash</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>
            </div>
        </div>
    </div>
</div>
