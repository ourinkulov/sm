<div wire:ignore.self class="modal fade bd-example-modal-lg" id="patentkiritish" tabindex="-1" role="dialog" aria-labelledby="patentkiritish" aria-hidden="true" >
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="patentkiritish">Patent qo'shish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <label for="">Patent turi</label>
                        <select name="" id="" wire:model="miqyosi" class="form-control">
                            <option value="0">Tanlang</option>
                            @foreach($patent_turi as $item)
                                <option value="{{$item->id}}">{{$item->miqyosi}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Patent mavzusi</label>
                        <input type="text" class="form-control" wire:model.lazy="nomi">
                    </div>
                    <div class="form-group">
                        <label for="">
                            Raqami
                        </label>
                        <input type="text" wire:model.lazy="raqami" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="">
                            Davlat reestridan o'tkazilgan sana:
                        </label>
                        <input type="date" wire:model.lazy="sana" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="">
                            Mualliflar soni
                        </label>
                        <input type="text" wire:model.lazy="muallif" class="form-control">
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
