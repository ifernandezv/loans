<?php echo form_open('payments/save/' . $payment_info->loan_payment_id, array('id' => 'payment_form')); ?>

<input type="hidden" id="loan_payment_id" name="loan_payment_id" value="<?= $payment_info->loan_payment_id; ?>" />

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
            $loancuota = '';

            foreach ($loans as $loan) {
              $selected = ''; 
              $loancuota = $loan['cuota'];
              if ($loan['loan_id'] === $payment_info->loan_id) {
                $selected = 'selected="selected"';
                $balance_amount = $loan['balance'];
              }
            ?>
              <option value="<?= $loan['loan_id'] ?>" <?= $selected; ?>  data-balance="<?= $loan['balance']; ?>"  data-cuota="<?= $loan['cuota']; ?>" data-multa="<?= $payment_info->multa; ?>" data-fecha_pago="<?= $loan['fecha_pago']; ?>"><?= $loan['text']; ?> </option>                 
          <?php } ?>
        </select>
        <input type="hidden" name="balance_amount" id="balance_amount" value="<?= $balance_amount; ?>" />
        <input type="hidden" name="cuota" id="cuota" value="<?= $loancuota; ?>" />
            
            </div>
        </div>
        
        <div class="field_row clearfix">
          <?php 
            echo form_label('Interés Actual a la Fecha:', 
                            'interes_act', 
                            array('class' => 'wide required')
                  );
          ?>
          <div class='form_field'>
            <input name="interes_actual" readonly id="interes_actual" value="0" />
          </div>
        </div>

       <div class="field_row clearfix">
          <?php 
            echo form_label($this->lang->line('payments_date') . ':',
                            'payment_date',
                            array('class' => 'wide required')
                  );
          ?>
          <div class='form_field'>
            <div class='input-group date' id='applydate' style="width: 30%">
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
              </div>
              <script type="text/javascript">
                $(function () {
                    $('#applydate, #fecha_ultimo_pago').datetimepicker({
                        format: 'DD-MM-YYYY'
                    });
                });
              </script>
            </div>
        </div>
        <div class="field_row clearfix">
          <?php
            echo form_label('Fecha de Último Pago:',
                            'fecha_pago',
                            array('class' => 'wide required')
                  );
          ?>
          <div class='form_field'>
            <div class='input-group date' id='fecha_ultimo_pago' style="width: 30%">
              <?php
                echo form_input(
                      array(
                        'name' => 'fecha_pago',
                        'id' => 'fecha_pago',
                        'value' =>(isset($payment_info->fecha_pago) && $payment_info->fecha_pago > 0) ? date("d-m-Y", $payment_info->fecha_pago) : date("d-m-Y"),
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

        <div class="field_row clearfix">
          <?php echo form_label('Monto a Pagar:', 'teller', array('class' => 'wide')); ?>
          
          <?php
           //    $payable = $CI->loans->_calculate_mortgage($balance_amount, 13, 3, 60);
          ?>
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
            <?php echo form_label('Multa:', 'multa', array('class' => 'wide')); ?>
            
           <?php  
     //    $payable = $CI->loans->_calculate_mortgage($balance_amount, 13, 3, 60);
       ?> 
           
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

  //validation and submit handling
  $(document).ready(function () {
    $("#div-form").height($(window).height() - 250);
    
    $("#inp-customer-id").change(function () {
      get_customer_by_id($(this).val());
    });

    if ($("#teller").val() <= 0) {
      $("#teller").val($("#user_info").val());
    }

    $(document).on("change", "#loan_id", function () {
      var balance = $('#loan_id option:selected').data('balance');
      $("#balance_amount").val(balance.replace(/[^\d.]/g, ''));
    });

    //INTERES_ACTUAL 
    $(document).on("change", "#loan_id", function () {
            var interes_actual = $('#loan_id option:selected').data('interes_actual');
            $("#interes_actual").val(interes_actual.replace(/[^\d.]/g, ''));
        });
    
    //-----///
    
    
    $(document).on("change", "#loan_id", function () {
            var cuota = $('#loan_id option:selected').data('cuota');
            $("#paid_amount").val(cuota.replace(/[^\d.]/g, ''));
        });
    
    $(document).on("change", "#loan_id", function () {
            var multa = $('#loan_id option:selected').data('multa');
            $("#multa").val(multa.replace(/[^\d.]/g, ''));
        });
    
    $(document).on("change", "#loan_id", function () {
            var fecha_pago = $('#loan_id option:selected').data('fecha_pago');
            $("#fecha_pago").val(fecha_pago);  ///aca
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
          serviceUrl: '<?php echo site_url("loans/customer_search"); ?>',
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
        if ((parseFloat(value) > 0) && parseFloat(value) <= parseFloat($("#balance_amount").val())) {
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
              $.each(data, function () {
                  options.append($("<option />").val(this.loan_id).attr("data-balance", this.loan_balance).attr("data-cuota", this.cuota).attr("data-interes_actual", this.interes_actual).attr("data-multa", this.multa).attr("data-fecha_pago", this.fecha_pago).text(this.loan_type + " (" + this.loan_amount + ") - " + this.loan_balance));
              });

              var balance = $('#loan_id option:selected').data('balance');
              $("#balance_amount").val(balance.replace(/[^\d.]/g, ''));
      
              var cuota = $('#loan_id option:selected').data('cuota');
              $("#paid_amount").val(cuota.replace(/[^\d.]/g, ''));
      
              var interes_actual = $('#loan_id option:selected').data('interes_actual');
              $("#interes_actual").val(interes_actual.replace(/[^\d.]/g, ''));
      
              var multa = $('#loan_id option:selected').data('multa');
              $("#multa").val(multa.replace(/[^\d.]/g, ''));

              var fecha_pago = $('#loan_id option:selected').data('fecha_pago');
              $("#fecha_pago").val(fecha_pago);
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