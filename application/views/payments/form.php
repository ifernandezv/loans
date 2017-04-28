<?php echo form_open('payments/save/' . $payment_info->loan_payment_id, array('id' => 'payment_form')); ?>

<input type="hidden" id="loan_payment_id" name="loan_payment_id" value="<?= $payment_info->loan_payment_id; ?>" />
<input type="hidden" id="multa_por_dia" name="multa_por_dia" value="<?= $multa_por_dia; ?>" />

<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h4 class="modal-title"><?php echo $this->lang->line("payments_info"); ?></h4>
</div>

<div class="modal-body">
  <div style="overflow-y: auto;" id="div-form">
    <div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
    <ul id="error_message_box"></ul>
    <div class="field_row clearfix">
      <?php
        echo  form_label($this->lang->line('payments_account') . ':', 
                        'inp-customer-id',
                        array('class' => 'wide')
              );
      ?>
      <div class='form_field'>
        <?php
          echo form_input(
            array(
              'name' => 'account',
              'id' => 'account',
              'value' => $payment_info->account,
              'class' => 'form-control',
              'style' => 'width: 30%'
            )
          );
        ?>
      </div>
    </div>

    <div class="field_row clearfix">
      <?php
        echo  form_label($this->lang->line('payments_customer_account') . ':',
                        'inp-customer-id',
                        array('class' => 'wide')
              );
      ?>
      <div class='form_field'>
        <?php
          echo  form_input(
                  array(
                    'name' => 'inp-customer-id',
                    'id' => 'inp-customer-id',
                    'value' => $payment_info->customer_id,
                    'class' => 'form-control',
                    'style' => 'width: 30%; display:' . ($payment_info->customer_id <= 0 ? '' : 'none'),
                  )
                );
        ?>
        <span id="sp-customer-id" style="display: <?= ($payment_info->customer_id > 0 ? '' : 'none') ?>">
          <?= strval($payment_info->customer_id); ?>
        </span>
      </div>
    </div>

    <div class="field_row clearfix">
      <?php 
        echo  form_label($this->lang->line('loans_customer') . ':',
                        'inp-customer',
                        array('class' => 'wide required')
              );
      ?>
      <div class='form_field'>
        <?php
          echo form_input(
                  array(
                    'name' => 'inp-customer',
                    'id' => 'inp-customer',
                    'value' => $payment_info->customer_name,
                    'class' => 'form-control',
                    'placeholder' => $this->lang->line("common_start_typing"),
                    'style' => 'display:' . ($payment_info->customer_id <= 0 ? '' : 'none')
                  )
                );
        ?>

        <span id="sp-customer" style="display: <?= ($payment_info->customer_id > 0 ? '' : 'none') ?>">
          <?= $payment_info->customer_name; ?>
        </span>
        <input type="hidden" id="customer" name="customer" value="<?= $payment_info->customer_id; ?>" />

      </div>
    </div>

    <div class="field_row clearfix">
      <?php 
        echo form_label($this->lang->line('payments_loan') . ':',
                      'loan', 
                       array('class' => 'wide required')
             );
      ?>
      <div class='form_field'>
        <select id="loan_id" name="loan_id" class="form-control">
          <?php 
            $balance_amount = '';
            $loan_cuota = '';
            $numero_cuota = '';
            $loan_interes = '';
            $fecha_ultimo_pago = '';
            $fecha_pago_teorica = '';

            foreach ($loans as $loan) {
              $selected = '';
              if ($loan->loan_id === $payment_info->loan_id) {
                $selected = 'selected="selected"';
                $balance_amount = $payment_info->balance_amount;
                $loan_cuota = $loan->cuota;
                $numero_cuota = $payment_info->numero_cuota;
                $loan_interes = $loan->interes;
                $fecha_ultimo_pago = $loan->loan_pago;
                $fecha_pago_teorica = $loan->fecha_pago_teorica;
              }
            ?>
            <option value="<?= $loan->loan_id; ?>" <?= $selected; ?>  data-loan_balance="<?= $payment_info->balance_amount; ?>"  data-cuota="<?= $loan->cuota; ?>" data-numero_cuota="<?= $payment_info->numero_cuota; ?>" data-interes="<?= $loan->interes; ?>" data-fecha_ultimo_pago="<?= $loan->loan_pago; ?>" data-fecha_pago_teorica="<?= $loan->fecha_pago_teorica; ?>"><?= $loan->text; ?> </option>
          <?php } ?>
        </select>
        <input type="hidden" name="balance_amount" id="balance_amount" value="<?= $balance_amount; ?>" />
        <input type="hidden" name="old_balance_amount" id="old_balance_amount" value="<?= $balance_amount; ?>" />
        <input type="hidden" name="cuota" id="cuota" value="<?= $loan_cuota; ?>" />
        <input type="hidden" name="numero_cuota" id="numero_cuota" value="<?= $numero_cuota; ?>" />
        <input type="hidden" name="interes" id="interes" value="<?= $loan_interes; ?>" />
        <input type="hidden" name="interes_pagado" id="interes_pagado" value="" />
        <input type="hidden" name="fecha_ultimo_pago" id="fecha_ultimo_pago" value="<?= $fecha_ultimo_pago; ?>" />
        <input type="hidden" name="fecha_pago_teorica" id="fecha_pago_teorica" value="<?= $fecha_pago_teorica; ?>" />
            
            </div>
        </div>

        <div class="field_row clearfix">
          <?php
            echo form_label('Fecha de Último Pago:',
                            'ultimo_pago',
                            array('class' => 'wide')
                  );
          ?>
          <div class='form_field'>
            <span name="ultimo_pago" id="ultimo_pago"></span>
          </div>
        </div>

        <div class="field_row clearfix">
          <?php
            echo form_label('Número de cuota:',
                            'n_cuota',
                            array('class' => 'wide')
                  );
          ?>
          <div class='form_field'>
            <span name="n_cuota" id="n_cuota"><?= $payment_info->numero_cuota ?></span>
          </div>
        </div>

       <div class="field_row clearfix">
          <?php 
            echo form_label($this->lang->line('payments_date') . ':',
                            'date_paid',
                            array('class' => 'wide required')
                  );
          ?>
          <div class='form_field'>
            <div class='input-group date' id='paiddate' style="width: 30%">
              <?php
                echo form_input(
                        array(
                          'name' => 'date_paid',
                          'id' => 'date_paid',
                          'value' => (isset($payment_info->date_paid) && $payment_info->date_paid > 0) ? date("d-m-Y", $payment_info->date_paid) : date("d-m-Y"),
                          'class' => 'form-control',
                          'type' => 'datetime'
                        )
                      );
                ?>
                <span class="input-group-addon">
                  <span class="glyphicon glyphicon-calendar"></span>
                </span>
                <script type="text/javascript">
                  $(function () {
                      $('#paiddate').datetimepicker({
                        format: 'DD-MM-YYYY'
                      });
                  });
                </script>
              </div>
            </div>
        </div>

        <div class="field_row clearfix">
          <?php echo form_label('Monto a Pagar:', 'teller', array('class' => 'wide')); ?>
          <div class='form_field'>
            <?php
              echo form_input(
                      array(
                        'name' => 'paid_amount',
                        'id' => 'paid_amount',
                        'value' => $payment_info->paid_amount,
                        'class' => 'form-control',
                        'type' => 'number',
                        'step' => 'any',
                        'style' => 'width: 30%'
                      )
                    );
            ?>
            <input type="hidden" name="original_pay_amount" value="<?= $payment_info->paid_amount; ?>" />
          </div>
        </div>

        <div class="field_row clearfix">
          <?php
            echo form_label('Capital / Interés:',
                            'capital_interes',
                            array('class' => 'wide')
                  );
          ?>
          <div class='form_field'>
            <span name="capital_interes" id="capital_interes"> </span>
          </div>
        </div>

        <div class="field_row clearfix">
          <?php
            echo form_label('Balance:',
                            'balance_info',
                            array('class' => 'wide')
                  );
          ?>
          <div class='form_field'>
            <span name="balance_info" id="balance_info"> </span>
          </div>
        </div>

        <div class="field_row clearfix">
            <?php echo form_label('Multa:', 'multa', array('class' => 'wide')); ?>
            <div class='form_field'>
                <?php
                echo form_input(
                        array(
                            'name' => 'multa',
                            'id' => 'multa',
                            'value' => $payment_info->multa,
                            'class' => 'form-control',
                            'type' => 'number',
                            'step' => 'any',
                            'style' => 'width: 30%'
                        )
                );
                ?>
            </div>
        </div>

        <div class="field_row clearfix">
            <?php echo form_label($this->lang->line('payments_teller') . ':', 'teller', array('class' => 'wide')); ?>
            <div class='form_field'>
                <?php echo isset($payment_info->teller_name) ? ucwords($payment_info->teller_name) : ucwords($user_info->first_name . " " . $user_info->last_name); ?>
                <input type="hidden" id="teller" name="teller" value="<?= $payment_info->teller_id; ?>" />
            </div>
        </div>        

        <div class="field_row clearfix">
            <?php echo form_label($this->lang->line('common_remarks') . ':', 'remarks', array('class' => 'wide')); ?>
            <div class='form_field'>
                <?php
                echo form_textarea(
                        array(
                            'name' => 'remarks',
                            'id' => 'remarks',
                            'value' => $payment_info->remarks,
                            'rows' => '5',
                            'cols' => '17',
                            'class' => 'form-control'
                        )
                );
                ?>
            </div>
        </div>

        <input type="hidden" id="modified_by" name="modified_by" value="<?= $payment_info->modified_by; ?>" />
        <input type="hidden" id="user_info" value="<?= $user_info->person_id; ?>" />

    </div>
</div>

<div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close"><?=$this->lang->line("common_close");?></button>
  <button id="btn-edit" class="btn btn-danger" type="button"><?= $this->lang->line('common_edit'); ?></button>

  <?php 
    echo form_submit(
            array(
                'name' => 'submit',
                'id' => 'btn-save',
                'value' => $this->lang->line('common_save'),
                'class' => 'btn btn-primary'
            )
          );
  ?>
</div>

<?php
  echo form_close();
?>

<script type='text/javascript'>

  function format_date(date) {
    var d = date.getDate();
    var m = date.getMonth() + 1;
    var y = date.getFullYear();
    return (d <= 9 ? '0' + d : d) + '-' + (m<=9 ? '0' + m : m) + '-' + y;
  }

  function ajustar_campos() {
    var multa = 0;
    var multa_por_dia = parseFloat($('#multa_por_dia').val());
    var rate = parseFloat($('#interes').val());
    var balance = parseFloat($('#old_balance_amount').val());
    var cuota = parseFloat($('#paid_amount').val());
    var ultimo_pago = new Date(parseInt($('#fecha_ultimo_pago').val())*1000);
    var fecha_pago_teorica = new Date(parseInt($('#fecha_pago_teorica').val())*1000);

    var fp_arr = ($('#date_paid').val()).split('-');
    var fecha_pago = new Date(fp_arr[2],fp_arr[1]-1,fp_arr[0]);

    if (fecha_pago > fecha_pago_teorica) {
      var dias_multa = parseInt(fecha_pago / (24 * 3600 * 1000)) 
                     - parseInt(fecha_pago_teorica / (24 * 3600 * 1000));
      multa = multa_por_dia * dias_multa;
    }
    $("#multa").val(multa.toFixed(2));

    var dias = parseInt(fecha_pago / (24 * 3600 * 1000)) 
             - parseInt(ultimo_pago / (24 * 3600 * 1000));

    $("#ultimo_pago").html(format_date(ultimo_pago));
    $("#n_cuota").html($('#numero_cuota').val());

    if ( cuota > balance) {
      cuota = balance;
    }

    var interes = balance*(((rate/100)/365)*dias);

    if ( interes > cuota ) {
      cuota = interes;
    }

    $("#paid_amount").val(cuota.toFixed(2));

    var capital = cuota - interes;
    var capital_interes = capital.toFixed(2) + ' / ' + interes.toFixed(2);
    $("#capital_interes").html(capital_interes);
    $('#balance_amount').val(balance - capital);
    var balance_info = balance - capital;
    $("#balance_info").html(balance_info.toFixed(2));
    $('#interes_pagado').val(interes.toFixed(2));

  }

  $(document).keydown(function(event) {
    var mycode = event.keyCode;

    console.log('mycode: ',mycode);

    if (mycode == 13) {
      event.preventDefault();
      event.originalEvent.keyCode = 0;
    }

    //F4
    if (mycode == 115)
    {
      event.preventDefault();
      $("#finish_sale_button").focus();
      event.originalEvent.keyCode = 0;
    }

    //F7
    if (mycode == 118)
    {
      event.preventDefault();
      $("#payment_types").focus();
      event.originalEvent.keyCode = 0;
    }

    //ESC
    if (mycode == 27)
    {
        $("#cancel_sale_button").focus();
    }  
  });

  //validation and submit handling
  $(document).ready(function () {
    $("#div-form").height($(window).height() - 250);

    ajustar_campos();

    $("#btn-save").click(function () {
      $(this).prop("disabled", true);
      $("#payment_form").submit();
    });

    $("#inp-customer-id").change(function () {
      get_customer_by_id($(this).val());
    });

    if ($("#teller").val() <= 0) {
      $("#teller").val($("#user_info").val());
    }

    $(document).on("change", "#loan_id", function () {
      var balance = $('#loan_id option:selected').data('loan_balance')+'';
      $("#balance_amount").val(balance.replace(/[^\d.]/g, ''));
      $("#old_balance_amount").val(balance.replace(/[^\d.]/g, ''));
    });

    //-----///
    
    
    $(document).on("change", "#loan_id", function () {
      var cuota = $('#loan_id option:selected').data('cuota')+'';
      $("#paid_amount").val(cuota.replace(/[^\d.]/g, ''));
    });
    
    $(document).on("change", "#loan_id", function () {
      var interes = $('#loan_id option:selected').data('interes')+'';
      $("#interes").val(interes.replace(/[^\d.]/g, ''));
    });

    $(document).on("change", "#loan_id", function () {
      var numero_cuota = $('#loan_id option:selected').data('numero_cuota')+'';
      $("#numero_cuota").val(numero_cuota);
      $("#n_cuota").html(numero_cuota);
    });

    $(document).on("change", "#loan_id", function () {
      var fecha_pago = $('#loan_id option:selected').data('fecha_pago');
      $("#fecha_pago").val(fecha_pago);
    });
    
    $(document).on("change", "#loan_id", function () {
      var fecha_ultimo_pago = $('#loan_id option:selected').data('fecha_ultimo_pago');
      $("#ultimo_pago").html(format_date(new Date(parseInt(fecha_ultimo_pago)*1000)));
      $('#fecha_ultimo_pago').val(fecha_ultimo_pago);
    });
    
    $(document).on("change", "#loan_id", function () {
      var fecha_pago_teorica = $('#loan_id option:selected').data('fecha_pago_teorica');
      $('#fecha_pago_teorica').val(fecha_pago_teorica);
    });

    $(document).on("change", "#loan_id,#paid_amount", function () {
      ajustar_campos();
    });

    $(document).on("dp.change", "#paiddate", function () {
      ajustar_campos();
    });

      if ($("#loan_payment_id").val() > -1) {
        $("#modified_by").val($("#user_info").val());
        $("#payment_form input, textarea").prop("readonly", true);
        $("#payment_form select").prop("disabled", true);
        $("#btn-save").hide();

        $("#btn-edit").show();

        $("#btn-edit").click(function () {
          $("#btn-save").show();
          $(this).hide();
          $("#payment_form input, textarea").prop("readonly", false);
          $("#payment_form select").prop("disabled", false);
        });
      }
      else {
        $("#btn-edit").hide();
      }

      $(document).on("click", ".btn-remove-row", function () {
          clear_customer();
      });

      $('#inp-customer').autocomplete({
          serviceUrl: '<?php echo site_url("loans/customer_search/true"); ?>',
          onSelect: function (suggestion) {
              $("#inp-customer-id").val(suggestion.data);
              $("#customer").val(suggestion.data);
              $("#sp-customer").html(suggestion.value + ' <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>');
              $("#sp-customer").show();
              $("#inp-customer").hide();

              populate_loans(suggestion.data);
          }
      });

      $('#payment_form').validate({
        submitHandler: function (form) {
          $(form).ajaxSubmit({
            success: function (response) {
              post_payment_form_submit(response);
            },
            dataType: 'json'
          });

        },
        errorLabelContainer: "#error_message_box",
        wrapper: "li",
        rules:
          {
            customer: "required",
            loan_id: "required",                        
            paid_amount : { greaterThanZero : true }
          },
        messages:
          {
            customer: "<?php echo $this->lang->line('payment_customer_required'); ?>",
            loan_id: "<?php echo $this->lang->line('payment_loan_required'); ?>",
          }
        });
    });

    $.validator.addMethod("greaterThanZero", function (value, element) {    
        if ((parseFloat(value) > 0) && parseFloat(value) <= parseFloat($("#old_balance_amount").val())) {
            return true;
        }
        return false;
        //return this.optional(element) || (parseFloat(value) > 0);
    }, "<?php echo $this->lang->line('payment_paid_amount_required')?>");

    function populate_loans(customer_id) {
        $.ajax({
            url: "<?= site_url("payments/get_loans") ?>/" + customer_id,
            type: "get",
            dataType: 'json',
            success: function (data) {
              var options = $("#loan_id");
              options.empty();
              console.log('data: ',data);
              $.each(data, function () {
                  options.append($("<option />").val(this.loan_id).attr("data-loan_balance", this.loan_balance).attr("data-cuota", this.cuota).attr("data-numero_cuota", this.numero_cuota).attr("data-interes", this.interes).attr("data-fecha_pago", this.fecha_pago).attr("data-fecha_pago_teorica", this.fecha_pago_teorica).attr("data-fecha_ultimo_pago", this.loan_pago).text('Préstamo N° '+this.loan_id+' --- '+this.loan_type + " (" + this.loan_amount + ") - " + this.loan_balance));
              });

              var balance = $('#loan_id option:selected').data('loan_balance')+'';
              $("#balance_amount").val(balance.replace(/[^\d.]/g, ''));
              $("#old_balance_amount").val(balance.replace(/[^\d.]/g, ''));

              var cuota = $('#loan_id option:selected').data('cuota')+'';
              $("#paid_amount").val(cuota.replace(/[^\d.]/g, ''));

              var numero_cuota = $('#loan_id option:selected').data('numero_cuota')+'';
              $("#numero_cuota").val(numero_cuota);
              $("#n_cuota").html(numero_cuota);

              var interes = $('#loan_id option:selected').data('interes')+'';
              $("#interes").val(interes.replace(/[^\d.]/g, ''));

              var multa = $('#loan_id option:selected').data('multa')+'';
              $("#multa").val(multa.replace(/[^\d.]/g, ''));

              var fecha_pago = $('#loan_id option:selected').data('fecha_pago');
              $("#fecha_pago").val(fecha_pago);

              var fecha_ultimo_pago = $('#loan_id option:selected').data('fecha_ultimo_pago');
              $("#fecha_ultimo_pago").val(fecha_ultimo_pago);

              var fecha_pago_teorica = $('#loan_id option:selected').data('fecha_pago_teorica');
              $("#fecha_pago_teorica").val(fecha_pago_teorica);

              ajustar_campos();

            },
            error: function () {
                ;
            }
        });

    }

    function get_customer_by_id(customer_id)
    {
        $.ajax({
            url: "<?= site_url("payments/get_customer") ?>/" + customer_id,
            type: "get",
            dataType: 'json',
            success: function (suggestion) {
                if ($.trim(suggestion.value) !== "")
                {
                    $("#customer").val(suggestion.data);
                    $("#sp-customer").html(suggestion.value + ' <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>');
                    $("#sp-customer").show();
                    $("#inp-customer").hide();
                    populate_loans(suggestion.data);
                }
                else
                {
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
