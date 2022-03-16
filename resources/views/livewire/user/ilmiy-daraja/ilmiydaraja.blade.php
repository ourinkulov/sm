<div wire:ignore.self class="modal fade bd-example-modal-lg" id="ilmiyDaraja" tabindex="-1" role="dialog" aria-labelledby="ilmiyDaraja" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ilmiy daraja ma'lumotlarini yangilash</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">
                            Ilmiy darajangiz
                        </label>
                        <select name="ilmd" id="ilmd" wire:model="ilmd" class="form-control">
                            <option value="0">Tanlang</option>
                            <option value="1">PhD</option>
                            <option value="2">DSc</option>
                            <option value="3">Mavjud emas</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">
                            Ilmiy daraja diplomi
                        </label>
                        <input type="file" wire:model="ilmdi" class="form-control" />
                    </div>
{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Ilmiy unvoningiz--}}
{{--                        </label>--}}
{{--                        <select name="iu" id="iu" wire:model="iu" class="form-control">--}}
{{--                            <option value="0">Tanlang</option>--}}
{{--                            <option value="3">PhD</option>--}}
{{--                            <option value="4">DSc</option>--}}
{{--                            <option value="5">Mavjud emas</option>--}}
{{--                        </select>--}}
{{--                    </div>--}}

{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Ilmiy unvon diplomi--}}
{{--                        </label>--}}
{{--                        <input type="file" wire:model.lazy="iui" class="form-control" />--}}
{{--                    </div>--}}


                    <button class="btn btn-primary" wire:click.prevent="ilmiyDarajaUpdate()">Saqlash</button>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>

            </div>
        </div>
    </div>
</div>
