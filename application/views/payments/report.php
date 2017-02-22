<?php $this->load->view("partial/header"); ?>
<style>
    table#datatable td:nth-child(5), 
    td:nth-child(6) {
        text-align: right
    }
    table#datatable td:nth-child(2),
    td:nth-child(7), 
    td:nth-child(10) {
        white-space: nowrap;
        text-align: center;
    }
</style>

<div id="title_bar">
    <div id="title" class="float_left"><i class="fa fa-paypal" style="font-size: 40px; color:#2B9EC4"></i> Reporte de pagos</div>
</div>

<?php echo form_open('payments/report'); ?>

<div class="field_row clearfix">
  <?php 
    echo form_label('Desde:',
                    'desde',
                    array('class' => 'wide')
          );
  ?>
  <div class='form_field'>
    <div class='input-group date' id='fecha_desde' style="width: 30%">
      <?php
        echo form_input(
                array(
                  'name' => 'desde',
                  'id' => 'desde',
                  'value' => empty($desde)?date("d-m-Y"):$desde,
                  'class' => 'form-control',
                  'type' => 'datetime'
                )
              );
      ?>
      <span class="input-group-addon">
        <span class="glyphicon glyphicon-calendar"></span>
      </span>
    </div>
  </div>
  <?php 
    echo form_label('Hasta:',
                    'hasta',
                    array('class' => 'wide')
          );
  ?>
  <div class='form_field'>
    <div class='input-group date' id='fecha_hasta' style="width: 30%">
      <?php
        echo form_input(
                array(
                  'name' => 'hasta',
                  'id' => 'hasta',
                  'value' => empty($hasta)?date("d-m-Y"):$hasta,
                  'class' => 'form-control',
                  'type' => 'datetime'
                )
              );
      ?>
      <span class="input-group-addon">
        <span class="glyphicon glyphicon-calendar"></span>
      </span>
    </div>
  </div>
</div>
<input type="hidden" id="ts_desde" name="ts_desde" value="" />
<input type="hidden" id="ts_hasta" name="ts_hasta" value="" />

<script type="text/javascript">
  $(function () {
      $('#fecha_desde, #fecha_hasta').datetimepicker({
        format: 'DD-MM-YYYY'
      });
  });
</script>

<div class="field_row clearfix">
  <?php 
    echo  form_label($this->lang->line('loans_customer') . ':',
                    'inp-customer',
                    array('class' => 'wide')
          );
  ?>
  <div class='form_field'>
    <?php
      echo form_input(
              array(
                'name' => 'inp-customer',
                'id' => 'inp-customer',
                'value' => '',
                'class' => 'form-control',
                'placeholder' => $this->lang->line("common_start_typing"),
                'style' => 'display:""'
              )
            );
    ?>

    <span id="sp-customer" style="display: ''"></span>
    <input type="hidden" id="customer" name="customer" value="<?= $customer ?>" />
  </div>
</div>

<?php 
  echo form_submit(
          array(
              'name' => 'submit',
              'id' => 'btn-save',
              'value' => 'Cambiar',
              'class' => 'btn btn-primary'
          )
        );
  echo form_close();
?>
<div class="row table-body">
  <div class="col-md-12">
    <table id="resultados" class="table table-hover table-bordered" cellspacing="0" width="100%">
      <tr>
        <td style="text-align: center">Pagado</td>
        <td style="text-align: center"><?= $totales['pagado'] ?></td>
        <td style="text-align: center">Capital</td>
        <td style="text-align: center"><?= $totales['capital'] ?></td>
        <td style="text-align: center">Interés</td>
        <td style="text-align: center"><?= $totales['interes'] ?></td>
        <td style="text-align: center">Multas</td>
        <td style="text-align: center"><?= $totales['multa'] ?></td>
      </tr>
    </table>
  </div>
</div>

<hr/>
<?php echo $this->pagination->create_links(); ?>
<div class="row table-body">
  <div class="col-md-12">
    <table id="datatable" class="table table-hover table-bordered" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th style="text-align: center"><?= $this->lang->line('loans_customer') ?></th>
          <th style="text-align: center"><?= 'Préstamo N°' ?></th>
          <th style="text-align: center"><?= $this->lang->line('payments_loan') ?></th>
          <th style="text-align: center"><?= 'Cuota N°' ?></th>
          <th style="text-align: center"><?= $this->lang->line('payments_amount') ?></th>
          <th style="text-align: center"><?= 'Capital' ?></th>
          <th style="text-align: center"><?= 'Interés' ?></th>
          <th style="text-align: center"><?= 'Multa' ?></th>
          <th style="text-align: center"><?= 'Fecha de Pago' ?></th>
          <th style="text-align: center; width: 2%"><?=$this->lang->line("common_action");?></th>
        </tr>
      </thead>
    </table>
  </div>
</div>

<div id="feedback_bar"></div>
<?php $this->load->view("partial/footer"); ?>

<script type="text/javascript">
  function format_dates() {
    var desde_arr = ($('#desde').val()).split('-');
    var fecha_desde = new Date(desde_arr[2],desde_arr[1]-1,desde_arr[0]);
    $('#ts_desde').val(fecha_desde.getTime()/1000);

    var hasta_arr = ($('#hasta').val()).split('-');
    var fecha_hasta = new Date(hasta_arr[2],hasta_arr[1]-1,hasta_arr[0]);
    $('#ts_hasta').val(fecha_hasta.getTime()/1000);

  }
  $(document).ready(function () {

    $("#datatable").dataTable({
      "aoColumnDefs": [
        {'bSortable': false, 'aTargets': [0, 7]}
      ],
      "language": {
        "url": "<?php echo site_url($this->config->item('language').".json"); ?>"
      },
      "processing": true,
      "serverSide": true,
      "aLengthMenu": [[10, 20, 50, 100000], [10, 20, 50, "<?=$this->lang->line("common_all")?>"]],
      "iDisplayLength": 20,
      "order": [1, "desc"],
      "ajax": {
        "url": "<?php echo site_url("payments/data_reporte") ?>"
      },
      "initComplete": function (settings, json) {
        $("#datatable_filter").find("input[type='search']").attr("placeholder", "<?= $this->lang->line("common_search"); ?>");
      }
    });

    $(document).on("dp.change", "#fecha_desde", function () {
      format_dates();
    });

    $(document).on("dp.change", "#fecha_hasta", function () {
      format_dates();
    });
  });

  function post_payment_form_submit(response) {
    if (!response.success) {
      set_feedback(response.message, 'error_message', true);
    }
    else {
      set_feedback(response.message, 'success_message', false);
      $('#datatable').dataTable()._fnAjaxUpdate();
      $('#payment_modal').modal("hide");
    }
  }

  $('#inp-customer').autocomplete({
    serviceUrl: '<?php echo site_url("loans/customer_search"); ?>',
    onSelect: function (suggestion) {
      $("#inp-customer-id").val(suggestion.data);
      $("#customer").val(suggestion.data);
      $("#sp-customer").html(suggestion.value + ' <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>');
      $("#sp-customer").show();
      $("#inp-customer").hide();
    }
  });

  function get_customer_by_id(customer_id) {
    $.ajax({
      url: "<?= site_url("payments/get_customer") ?>/" + customer_id,
      type: "get",
      dataType: 'json',
      success: function (suggestion) {
        if ($.trim(suggestion.value) !== "") {
          $("#customer").val(suggestion.data);
          $("#sp-customer").html(suggestion.value + ' <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>');
          $("#sp-customer").show();
          $("#inp-customer").hide();
          populate_loans(suggestion.data);
        }
        else {
          clear_customer();
        }
      },
      error: function () {
        ;
      }
    });
  }

  function clear_customer() {
      $("#sp-customer").hide();
      $("#sp-customer").html("");
      $("#inp-customer").val("");
      $("#inp-customer").show();
      $("#customer").val("");
      var options = $("#loan_id");
      options.empty();
      $("#inp-customer-id").val("");
  }

</script>
