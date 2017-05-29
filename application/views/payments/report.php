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
  table#resultados td {
    font-weight: bold;
    font-size: 30px;
  }
  table#resultados td.resultado {
    color: #000088;
  }
</style>

<div id="title_bar">
    <div id="title" class="float_left"><i class="fa fa-paypal" style="font-size: 40px; color:#2B9EC4"></i> Reporte de pagos</div>
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
                  'value' => empty($desde)?date("d-m-Y",mktime(0,0,0,date("m")-1,date("d"),date("Y"))):$desde,
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
    echo  form_label('Préstamo:',
                    'inp-customer',
                    array('class' => 'wide')
          );
  ?>
  <div class='form_field'>
    <?php
      echo form_input(
              array(
                'name' => 'inp_customer',
                'id' => 'inp_customer',
                'value' => '',
                'class' => 'form-control',
                'placeholder' => $this->lang->line("common_start_typing"),
                'style' => 'display:' . (empty($customer) ? '' : 'none')
              )
            );
    ?>

    <span id="sp-customer" style="display: <?= (empty($customer) ? 'none' : '') ?>">
      <?= $inp_customer; ?>
      <span>
        <a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row">
          <i class="fa fa-times"></i>
        </a>
      </span>
    </span>
    <input type="hidden" id="customer" name="customer" value="<?= $customer ?>" />
    <input type="hidden" id="customer_name" name="customer_name" value="<?= $customer_name ?>" />
  </div>
</div>
<input type="hidden" id="get_values" name="get_values" value="" />

<?php 
  echo form_submit(
          array(
              'name' => 'submit',
              'id' => 'btn-save',
              'value' => 'Cambiar',
              'class' => 'btn btn-primary'
          )
        );
  echo anchor(
        'payments/imprimir_reporte',
        'Imprimir',
        array(
          'id' => 'imprimir',
          'class' => 'modal_link btn btn-default',
          'data-toggle' => 'modal',
          'data-target' => '#print_modal',
          "title" => 'Reporte'
        )
      );
  echo form_close();
?>
<div class="row table-body">
  <div class="col-md-12">
    <table id="resultados" class="table table-hover table-bordered" cellspacing="0" width="100%">
      <tr>
        <td style="text-align: center">Pagos</td>
        <td style="text-align: center" class="resultado"><?= $totales['pagos'] ?></td>
        <td style="text-align: center">Pagado</td>
        <td style="text-align: center" class="resultado"><?= $totales['pagado'] ?></td>
        <td style="text-align: center">Capital</td>
        <td style="text-align: center" class="resultado"><?= $totales['capital'] ?></td>
        <td style="text-align: center">Interés</td>
        <td style="text-align: center" class="resultado"><?= $totales['interes'] ?></td>
        <td style="text-align: center">Multas</td>
        <td style="text-align: center" class="resultado"><?= $totales['multa'] ?></td>
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
    update_get_string();
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
        "url": "<?php echo site_url('payments/data_reporte') ?>?"+$('#get_values').val()
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

  function update_get_string() {
    var parameters = '';
    
    parameters = 'submit=Cambiar';
    parameters += '&desde='+$('#desde').val();
    parameters += '&hasta='+$('#hasta').val();
    parameters += '&customer='+$('#customer').val();
    parameters += '&customer_name='+encodeURI($('#customer_name').val());

    $('#get_values').val(parameters);
    $('#imprimir').attr('href','payments/imprimir_reporte?'+parameters);
  }

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

  $('#inp_customer').autocomplete({
    serviceUrl: '<?php echo site_url("loans/customer_search/true"); ?>',
    onSelect: function (suggestion) {
      $("#inp_customer_id").val(suggestion.data);
      $("#customer").val(suggestion.data);
      $("#customer_name").val(suggestion.value);
      $("#sp-customer").html(suggestion.value + ' <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>');
      $("#sp-customer").show();
      $("#inp_customer").hide();
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
          $("#customer_name").val(suggestion.value);
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

  $(document).on("click", ".btn-remove-row", function () {
      clear_customer();
  });

  function clear_customer() {
      $("#sp-customer").hide();
      $("#sp-customer").html("");
      $("#inp_customer").val("");
      $("#inp_customer").show();
      $("#customer").val("");
      $("#customer_name").val('');
      var options = $("#loan_id");
      options.empty();
      $("#inp-customer-id").val("");
  }

</script>
