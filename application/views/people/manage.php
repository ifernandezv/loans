<?php $this->load->view("partial/header"); ?>
<style>
    table#datatable td:nth-child(2),
    td:nth-child(7)
    {
        text-align: center
    }
</style>
<div id="title_bar">
    <div id="title" class="float_left"><i class="fa fa-smile-o" style="font-size: 40px; color:#FF5400"></i> <?php echo $this->lang->line('common_list_of') . ' ' . $this->lang->line('module_' . $controller_name); ?></div>
    <div id="new_button">
        <?= anchor("$controller_name/view/-1", "<div class='btn btn-primary' style='float: left; margin-right: 10px'><span>" . $this->lang->line($controller_name . '_new') . "</span></div>", array('class' => 'thickbox none', 'data-toggle' => 'modal', 'data-target' => '#customer_modal', 'title' => $this->lang->line($controller_name . '_new'))); ?>
        <?php if ($controller_name == 'customers') : ?>
            <?php
            echo anchor("$controller_name/excel_import/", "<div class='btn btn-default' style='float: left; margin-right: 20px'><span>Excel Import</span></div>", array('class' => 'thickbox none', 'data-toggle' => 'modal', 'data-target' => '#customer_modal', 'title' => 'Import Items from Excel'));
            ?>  
        <?php endif; ?>
    </div>
</div>

<div id="table_action_header">

    <div class="row">
        <div class="col-xs-3">
            <?php echo anchor("$controller_name/delete", $this->lang->line("common_delete"), array('id' => 'delete', 'class' => 'btn btn-primary')); ?>
            <a href="#" class="btn btn-default" id="email"><?php echo $this->lang->line("common_email"); ?></a>
        </div>
        <div class="col-xs-3">
            &nbsp;
        </div>

    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="customer_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div style="clear: both"></div>

<div class="row table-body">
    <div class="col-md-12">
        <table id="datatable" class="table table-hover table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th style="text-align: center; width: 1%"><input type="checkbox" class="select_all_" /></th>
                    <th style="text-align: center"><?= $this->lang->line('common_id') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_last_name') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_first_name') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_email') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_phone_number') ?></th>
                    <th style="text-align: center; width: 1%"><?=$this->lang->line('common_action');?></th>
                </tr>
            </thead>
        </table>
    </div>
</div>

<input type="hidden" id="hidden-error-first-name" value="<?php echo $this->lang->line('common_first_name_required'); ?>" />
<input type="hidden" id="hidden-error-last-name" value="<?php echo $this->lang->line('common_last_name_required'); ?>" />
<input type="hidden" id="hidden-error-email" value="<?php echo $this->lang->line('common_email_invalid_format'); ?>" />

<div id="feedback_bar"></div>
<?php $this->load->view("partial/footer"); ?>

<script type="text/javascript">
    $(document).ready(function ()
    {
        var count_show = 0;

        $('body').on('hidden.bs.modal', '.modal', function () {
            $(this).removeData('bs.modal');
            count_show = 0;
        });

        $('body').on('shown.bs.modal', '.modal', function () {
            if (count_show === 0)
            {
                $.ajax({
                    type: "GET",
                    url: $("#site_url").val() + "js/people.js?v=<?= time(); ?>",
                    dataType: "script",
                    cache: true
                });
            }
            count_show++;
        });

        enable_delete('<?php echo $this->lang->line($controller_name . "_confirm_delete") ?>', '<?php echo $this->lang->line($controller_name . "_none_selected") ?>');

        $("#datatable").dataTable({
            "aoColumnDefs": [
                {'bSortable': false, 'aTargets': [0, 6]}
            ],
            "language": {
                "url": "<?php echo site_url($this->config->item('language').".json"); ?>"
            },
            "processing": true,
            "serverSide": true,
            "aLengthMenu": [[50, 100, 200, 100000], [50, 100, 200, "<?=$this->lang->line("common_all")?>"]],
            "iDisplayLength": 50,
            "order": [1, "desc"],
            "ajax": {
                "url": "<?php echo site_url("customers/data") ?>",
            },
            "initComplete": function (settings, json) {
                $("#datatable_filter").find("input[type='search']").attr("placeholder", "<?= $this->lang->line("common_search"); ?>");
            }
        });
        
        $(".select_all_").click(function () {
            if ($(this).is(":checked"))
            {
                $("input[name='chk[]']").prop("checked", true);
            }
            else
            {
                $("input[name='chk[]']").prop("checked", false);
            }
        });
    });

    function post_person_form_submit(response)
    {
        if (!response.success)
        {
            set_feedback(response.message, 'error_message', true);
        }
        else
        {
            set_feedback(response.message, 'success_message', false);
            $('#datatable').dataTable()._fnAjaxUpdate();
            $('#customer_modal').modal("hide");
        }
    }
</script>