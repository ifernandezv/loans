<?php $this->load->view("partial/header"); ?>
<style>
    table#datatable td:nth-child(2),
    td:nth-child(8) {
        text-align: center
    }
</style>
<div id="title_bar">
    <div id="title" class="float_left"><i class="fa fa-users" style="font-size: 40px; color:#FF5400"></i> <?php echo $this->lang->line('common_list_of') . ' ' . $this->lang->line('module_' . $controller_name); ?></div>
    <div id="new_button">
        <?= anchor("$controller_name/view/-1", "<div class='btn btn-primary' style='float: left; margin-right: 10px'><span>" . $this->lang->line($controller_name . '_new') . "</span></div>", array('class' => 'thickbox none', 'data-toggle' => 'modal', 'data-target' => '#employee_modal', 'title' => $this->lang->line($controller_name . '_new'))); ?>
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
<div class="modal fade" id="employee_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                    <th style="text-align: center; width: 1%"><input type="checkbox" /></th>
                    <th style="text-align: center"><?= $this->lang->line('employees_id') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_last_name') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_first_name') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_username') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_email') ?></th>
                    <th style="text-align: center"><?= $this->lang->line('common_phone_number') ?></th>
                    <th style="text-align: center; width: 1%"><?=$this->lang->line("common_action");?></th>
                </tr>
            </thead>
        </table>
    </div>
</div>
<div id="feedback_bar"></div>
<?php $this->load->view("partial/footer"); ?>

<script type="text/javascript">
    $(document).ready(function () {
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
                    url: $("#site_url").val() + "js/people.js?v=<?= time() ?>",
                    dataType: "script",
                    cache: true
                });
            }
            count_show++;
        });

        $("#datatable").dataTable({
            "aoColumnDefs": [
                {'bSortable': false, 'aTargets': [0, 7]}
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
                "url": "<?php echo site_url("employees/data") ?>",
            },
            "initComplete": function (settings, json) {
                $("#datatable_filter").find("input[type='search']").attr("placeholder", "<?= $this->lang->line("common_search"); ?>");
            }
        });

        enable_delete('<?php echo $this->lang->line($controller_name . "_confirm_delete") ?>', '<?php echo $this->lang->line($controller_name . "_none_selected") ?>');
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
            $("#employee_modal").modal("hide");
            $('#datatable').dataTable()._fnAjaxUpdate();
        }
    }
</script>