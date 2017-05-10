<?php $this->load->view("partial/header"); ?>
<style>
    table#datatable td:nth-child(5), 
    td:nth-child(6) {
        text-align: right
    }
    table#datatable td:nth-child(2),
    td:nth-child(7), 
    td:nth-child(12) {
        white-space: nowrap;
        text-align: center;
    }
</style>

<div id="title_bar">
    <div id="title" class="float_left"><i class="fa fa-paypal" style="font-size: 40px; color:#2B9EC4"></i> <?php echo $this->lang->line('common_list_of') . ' ' . $this->lang->line('module_' . $controller_name); ?></div>
    <div id="new_button">
        <?php
        echo anchor(
          "$controller_name/report",
          "<div class='btn btn-primary' style='float: left; margin-right:20px; color:#00ffaa;'><span>Reporte</span></div>",
          array(
            'target' => '_blank',
          )
        );
        ?>
        <?php
        echo anchor("$controller_name/view/-1", "<div class='btn btn-primary' style='margin-right:20px;'><span>" . $this->lang->line($controller_name . '_new') . "</span></div>", array('data-toggle' => 'modal', 'data-target' => '#payment_modal', 'title' => $this->lang->line($controller_name . '_new')));
        ?>
    </div>
</div>

<?php echo $this->pagination->create_links(); ?>
<div id="table_action_header">
  <!-- div class="row">
    <div class="col-xs-3">
      <?php echo anchor("$controller_name/delete", $this->lang->line("common_delete"), array('id' => 'delete', 'class' => 'btn btn-primary')); ?>
    </div>
   <div class="col-xs-3">
     &nbsp;
   </div>
  </div -->
</div>

<!-- Modal -->
<div class="modal fade" id="payment_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

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
          <th style="text-align: center; width: 1%"><!-- input type="checkbox" class="select_all_" / --></th>
          <th style="text-align: center"><?= $this->lang->line('common_trans_id') ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_customer') ?></th>
          <th style="text-align: center"><?= 'Préstamo N°' ?></th>
          <th style="text-align: center"><?= $this->lang->line('payments_loan') ?></th>
          <th style="text-align: center"><?= 'Cuota' ?></th>
          <th style="text-align: center"><?= $this->lang->line('loans_balance') ?></th>
          <th style="text-align: center"><?= $this->lang->line('payments_amount') ?></th>
          <th style="text-align: center"><?= 'Multa' ?></th>
          <th style="text-align: center"><?= 'Fecha de Pago' ?></th>
          <th style="text-align: center"><?= $this->lang->line('payments_teller') ?></th>
          <th style="text-align: center; width: 2%"><?=$this->lang->line("common_action");?></th>
        </tr>
      </thead>
    </table>
  </div>
</div>

<div id="feedback_bar"></div>
<?php $this->load->view("partial/footer"); ?>

<script type="text/javascript">
    $(document).ready(function ()
    {

        $('body').on('hidden.bs.modal', '.modal', function () {
            $(this).removeData('bs.modal');
        });

        $("#datatable").dataTable({
            "aoColumnDefs": [
                {'bSortable': false, 'aTargets': [0, 8]}
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
                "url": "<?php echo site_url("payments/data") ?>"
            },
            "initComplete": function (settings, json) {
                $("#datatable_filter").find("input[type='search']").attr("placeholder", "<?= $this->lang->line("common_search"); ?>");
                init_delete_buttons();
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

    function init_delete_buttons() {
      var mensaje = '¿Está seguro que desea borrar este pago?'
      $('.btn-delete').each(function(i,e) {
        var url = 'payments/delete_payment/'+e.id;
        $(this).click(function(event) {
//          event.preventDefault();
          if (confirm(mensaje)) {
            $.post(url, {}, function (response) {
              //delete was successful, remove checkbox rows
              if (response.success) {
                init_delete_buttons();
                set_feedback(response.message, 'success_message', false);
                window.location.reload();
              }
              else {
                set_feedback(response.message, 'error_message', true);
              }
            }, "json");
          }
        });
      });
    }

    function post_payment_form_submit(response)
    {
        if (!response.success)
        {
            set_feedback(response.message, 'error_message', true);
        }
        else
        {
            set_feedback(response.message, 'success_message', false);
            $('#datatable').dataTable()._fnAjaxUpdate();
            $('#payment_modal').modal("hide");
        }
    }
</script>
