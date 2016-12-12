<?php $this->load->view("partial/header"); ?>
<style>
  table#datatable td:nth-child(6), td:nth-child(7) {
    text-align: right
  }
  table#datatable td:nth-child(10), 
  td:nth-child(11), 
  td:nth-child(12),
  td:nth-child(13),
  td:nth-child(14){
    text-align: center
  }
</style>

<?php echo form_open('#', array('id' => 'remote_loan_form')); ?>

  <input type="hidden" id="customer_id" name="customer_id" value="<?= $customer_id; ?>" />
  <input type="hidden" id="customer_name" name="customer_name" value="<?= $customer_name; ?>" />
  <input type="hidden" id="loan_amount" name="loan_amount" value="<?= $loan_amount; ?>" />
  <input type="hidden" id="sale_id" name="sale_id" value="<?= $sale_id; ?>" />
  <input type="hidden" id="sale_type" name="sale_type" value="<?= $sale_type; ?>" />

<?php
  echo form_close();
?>

<div id="title_bar">
  <div id="title" class="float_left"><i class="fa fa-money" style="font-size: 40px; color:#4EA216"></i> <?php echo $this->lang->line('common_list_of') . ' ' . $this->lang->line('module_' . $controller_name); ?></div>
  <div id="new_button">
    <?php
      echo anchor("$controller_name/view/-1", "<div class='btn btn-primary' style='float: left; margin-right:20px;'><span>" . $this->lang->line($controller_name . '_new') . "</span></div>", array('data-toggle' => 'modal', 'data-target' => '#loan_modal', 'title' => $this->lang->line($controller_name . '_new')));
    ?>
  </div>
</div>

<?php echo $this->pagination->create_links(); ?>

<div id="table_action_header">
  <div class="row">
    <div class="col-xs-3">
      <?php echo anchor("$controller_name/delete", $this->lang->line("common_delete"), array('id' => 'delete', 'class' => 'btn btn-primary')); ?>
      <a href="javascript:void(0)" id="overdue" class="btn btn-danger"><?= $this->lang->line("loans_overdue") . " (" . $count_overdues . ")" ?></a>
    </div>
    <div class="col-xs-3">            
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="loan_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="attachment_modal" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      fdsfas
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="row table-body">
  <div class="col-md-12">
    <table id="datatable" class="table table-hover table-bordered" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th style="text-align: center; width: 1%"><input type="checkbox" class="select_all_" /></th>
          <th style="text-align: center"><?= $this->lang->line('common_id') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_type') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_account') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_description') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_amount') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_balance') ?></th>
          <th style="text-align: center">Cuota</th>
          <th style="text-align: center"><?= $this->lang->line('loans_customer') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_agent') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_approver') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_apply_date') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_payment_date') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_status') ?></th>
          <th style="text-align: center; width: 1%"><?= $this->lang->line("common_action"); ?></th>
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
      if (count_show === 0) {
        $.ajax({
          type: "GET",
          url: $("#site_url").val() + "js/loan.js?v=<?= time(); ?>",
          dataType: "script",
          cache: true
        });
      }
      count_show++;
    });

    if ($('#loan_amount') && $('#loan_amount').val() > 0) {
      // $('#loan_modal').removeData('bs.modal');
      $('#loan_modal').modal({remote: 'loans/view/-1' });
      $('#loan_modal').modal('show');
    }

    $(document).on("change", "#filter_by", function () {
      oTable.fnReloadAjax('<?php echo site_url("loans/data") ?>' + "/" + $(this).val());
    });

    $("#overdue").click(function () {
      $("#filter_by").val('overdue');
      oTable.fnReloadAjax('<?php echo site_url("loans/data") ?>' + "/overdue");
    });

    var oTable = $("#datatable").dataTable({
      "aoColumnDefs": [
        {'bSortable': false, 'aTargets': [0, 13]}
      ],
      "language": {
        "url": "<?php echo site_url($this->config->item('language') . ".json"); ?>"
      },
      "processing": true,
      "serverSide": true,
      "aLengthMenu": [[50, 100, 200, 100000], [50, 100, 200, "<?= $this->lang->line("common_all") ?>"]],
      "iDisplayLength": 50,
      "order": [1, "desc"],
      "ajax": {
        "url": "<?php echo site_url("loans/data") ?>"
      },
      "initComplete": function (settings, json) {
        $("#datatable_filter").prepend("&nbsp;");
        var options = $("<select />").attr("id", "filter_by").addClass("form-control");
        options.append("<option value='all'><?= $this->lang->line("common_all"); ?></option><option value='paid'><?= $this->lang->line("loans_paid"); ?></option><option value='unpaid'><?= $this->lang->line("loans_unpaid"); ?></option><option value='overdue'><?= $this->lang->line("loans_overdue"); ?></option>");
        $("#datatable_filter").prepend(options);
        $("#datatable_filter").find("input[type='search']").attr("placeholder", "<?= $this->lang->line("common_search"); ?>");
      }
    });

    enable_delete('<?php echo $this->lang->line($controller_name . "_confirm_delete") ?>', '<?php echo $this->lang->line($controller_name . "_none_selected") ?>');

    $(".select_all_").click(function () {
      if ($(this).is(":checked")) {
        $("input[name='chk[]']").prop("checked", true);
      }
      else {
        $("input[name='chk[]']").prop("checked", false);
      }
    });

  });

  function post_loan_form_submit(response) {
    if (!response.success) {
      set_feedback(response.message, 'error_message', true);
    }
    else {
      set_feedback(response.message, 'success_message', false);
      $('#datatable').dataTable()._fnAjaxUpdate();
      $('#loan_modal').modal("hide");
    }
  }
</script>
