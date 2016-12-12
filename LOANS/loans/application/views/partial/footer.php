</div>
</div>




<!-- Modal -->
<div class="modal fade" id="print_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<div id="footer">
    <?php echo $this->lang->line('common_powered_by') . " " . $this->config->item('application_version'); ?>
</div>
</body>
</html>

<script type="text/javascript" src="<?php echo base_url(); ?>js/jquery.niftymodals/js/jquery.modalEffects.js"></script>
<script>
    $(document).ready(function () {
        $('.md-trigger').modalEffects();
    });
</script>
