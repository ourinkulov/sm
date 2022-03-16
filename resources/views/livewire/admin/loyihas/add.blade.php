<div wire:ignore.self class="modal fade bd-example-modal-lg" id="loyihanitasdiqlash" tabindex="-1" role="dialog" aria-labelledby="patentkiritish" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loyihanitasdiqlash">Loyihani tasdiqlash</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">Loyiha turi</label>
                        <select name="" id="" wire:model="miqyosi" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($loyiha_turi as $item)
                                <option value="{{$item->id}}">{{$item->miqyosi}}</option>
                            @endforeach
                        </select>
                    </div>
{{--                    <div class="form-group">--}}
{{--                        <label for="">Loyiha mavzusi</label>--}}
{{--                        <input type="text" class="form-control" wire:model.lazy="mavzu">--}}
{{--                    </div>--}}
{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Raqami--}}
{{--                        </label>--}}
{{--                        <input type="text" wire:model.lazy="raqami" class="form-control">--}}
{{--                    </div>--}}

{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Boshlanish sanasi:--}}
{{--                        </label>--}}
{{--                        <input type="date" wire:model.lazy="bsana" class="form-control" />--}}
{{--                    </div>--}}
{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Yakunlanish sanasi--}}
{{--                        </label>--}}
{{--                        <input type="date" wire:model.lazy="ysana" class="form-control">--}}
{{--                    </div>--}}
{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Buyruq raqami--}}
{{--                        </label>--}}
{{--                        <input type="text" wire:model="buyruq" class="form-control">--}}
{{--                    </div>--}}

{{--                    <div class="form-group">--}}
{{--                        <label for="">--}}
{{--                            Ilova--}}
{{--                        </label>--}}
{{--                        <input type="file" wire:model="ilova" class="form-control" />--}}
{{--                    </div>--}}
                    <button class="btn btn-primary" wire:click.prevent="update()">Tasdiqlash</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Yopish</button>
            </div>
        </div>
    </div>
</div>
