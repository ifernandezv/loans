
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title"><?php echo $this->lang->line("common_print"); ?></h4>

</div>
<div class="modal-body">
    <object data="<?= $pdf_file; ?>" type="application/pdf" width="100%" height="<?= $height; ?>">
        <embed src="<?= $pdf_file; ?>" type="application/pdf" width="100%" height="<?= $height; ?>" />
    </object>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close">Close</button>
</div>
