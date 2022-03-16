<div wire:ignore.self class="modal fade" id="patentuchirish" tabindex="-1" role="dialog" aria-labelledby="patentuchirish" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="patentuchirish">Patentni o'chirish</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true close-btn">×</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Ushbu ma'lumot o'chirishiga aminmisiz?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary close-btn" data-dismiss="modal">Yo'q</button>
                <button type="button" wire:click.prevent="delete()" class="btn btn-danger close-modal" data-dismiss="modal">Ha, O'chirish</button>
            </div>
        </div>
    </div>
</div>
