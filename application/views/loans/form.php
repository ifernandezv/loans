<?php echo form_open('loans/save/' . $loan_info->loan_id, array('id' => 'loan_form')); ?>

<style>
    #drop-target {
        border: 10px dashed #999;
        text-align: center;
        color: #999;
        font-size: 20px;
        width: 600px;
        height: 300px;
        line-height: 300px;
        cursor: pointer;
    }

    #drop-target.dragover {
        background: rgba(255, 255, 255, 0.4);
        border-color: green;
    }
    .attach-desc {
        margin-top: 5px;
    }
    #attachment_modal{
        top: 30%;
    }
    ul.sel-proof, ul.sel-images{
        list-style: none;
        display: inline-flex;
    }
    ul.sel-proof li, ul.sel-images li {
        margin-right: 5px;
        border: 1px solid #ddd;
        padding: 0px 8px 0px 8px;
    }
</style>

<input type="hidden" id="loan_id" name="loan_id" value="<?= $loan_info->loan_id; ?>" />

<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h4 class="modal-title"><?php echo $this->lang->line("loans_info"); ?></h4>
</div>

<div class="modal-body">
  <div style="overflow-y: auto" id="div-form">
    <div class="info-container">
      <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#sectionA"><?= $this->lang->line("loans_information"); ?></a></li>
        <li><a data-toggle="tab" href="#sectionB"><?= $this->lang->line("loans_misc_fees"); ?></a></li>
        <li><a data-toggle="tab" href="#sectionC"><?= $this->lang->line('loans_attachments') ?></a></li>
        <li><a data-toggle="tab" href="#sectionE"><?= $this->lang->line('guarantee') ?></a></li>
      </ul>
      <div class="tab-content">
        <div id="sectionA" class="tab-pane fade in active">
          <h3><?= $this->lang->line("loans_information"); ?></h3>
          <div id="required_fields_message">
            <?php echo $this->lang->line('common_fields_required_message'); ?>
          </div>
          <ul id="error_message_box"></ul>

        <div class="field_row clearfix">
          <?php
            echo form_label(
              $this->lang->line('loans_amount') . ':', 
              'amount', 
              array('class' => 'wide required')
            );
          ?>
          <div class='form_field'>
            <?php
              echo form_input(
                array(
                  'name' => 'amount',
                  'id' => 'amount',
                  'value' => $loan_info->loan_amount,
                  'class' => 'form-control',
                  'style' => 'width: 30%',
                )
              );
            ?>
          </div>
        </div>

        <div class="field_row clearfix">
          <?php
            echo form_label(
              $this->lang->line('loans_type') . ':',
              'loan_type', 
              array('class' => 'wide required')
            );
          ?>
          <div class='form_field'>
            <?php
              echo form_dropdown(
                "loan_type", 
                $loan_types, 
                $loan_info->loan_type_id, 
                "id='loan_type' class='form-control'"
              );
            ?>
            <input type="hidden" id="loan_type_id" name="loan_type_id" value="<?= $loan_info->loan_type_id; ?>" />
          </div>
        </div>

        <div class="field_row clearfix">
          <?php echo form_label('Cuota Sugerida :', 'cuota', array('class' => 'wide required')); ?>
          <div class='form_field'>
              <?php
                echo form_input(
                  array(
                    'name' => 'cuota',
                    'id' => 'cuota',
                    'value' => $loan_info->cuota,
                    'class' => 'form-control'
                  )
                );
              ?>
          </div>
        </div>
                                  
        <div class="field_row clearfix">
          <?php 
            echo form_label(
              $this->lang->line('customers_customer') . ':',
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
                  'value' => $loan_info->customer_name,
                  'class' => 'form-control',
                  'placeholder' => $this->lang->line('common_start_typing'),
                  'style' => 'display:' . ($loan_info->customer_id <= 0 ? "" : "none")
                )
              );
            ?>

            <span id="sp-customer" style="display: <?= ($loan_info->customer_id > 0 ? '' : 'none') ?>">
              <?= $loan_info->customer_name; ?>
              <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>
            </span>
            <input type="hidden" id="customer" name="customer" value="<?= $loan_info->customer_id; ?>" />

          </div>
        </div>

        <div class="field_row clearfix">
          <?php echo form_label($this->lang->line('loans_account') . ':', 'account', array('class' => 'wide required')); ?>
          <div class='form_field'>
            <?php
              echo form_input(
                array(
                  'name' => 'account',
                  'id' => 'account',
                  'value' => $loan_info->account,
                  'class' => 'form-control'
                )
              );
            ?>
          </div>
        </div>

        <div class="field_row clearfix" id="pdv-info" style="display: none'">
          <?php
            echo form_label(
              'Venta:', 
              'pdv-link', 
              array('class' => 'wide')
            );
          ?>
          <div class='form_field'>
            <a href="" target="_blank" id="pdv-link"> </a>
            <input type="hidden" id="pdv_id" name="pdv_id" value="<?= $loan_info->pdv_id; ?>" />
          </div>
        </div>

        <div class="field_row clearfix">
          <?php 
            echo form_label(
              $this->lang->line('loans_description') . ':', 
              'description', 
              array('class' => 'wide')
            );
          ?>
          <div class='form_field'>
            <?php
              echo form_textarea(
                array(
                  'name' => 'description',
                  'id' => 'description',
                  'value' => $loan_info->description,
                  'rows' => '5',
                  'cols' => '17',
                  'class' => 'form-control'
                )
              );
            ?>
          </div>
        </div>

        <?php
          foreach ($info_loan as $info_loans) {
            echo form_input(
              array(
                'name' => 'term_'.$info_loans['loan_type_id'],
                'id' => 'term_'.$info_loans['loan_type_id'],
                'value' => $info_loans['term'],
                'class' => 'form-control',
                'style' => 'width: 30%',
                'type' => 'hidden',
              )
            );
            echo form_input(
              array(
                'name' => 'tasa_'.$info_loans['loan_type_id'],
                'id' => 'tasa_'.$info_loans['loan_type_id'],
                'value' => $info_loans['tasa'],
                'class' => 'form-control',
                'style' => 'width: 30%',
                'type' => 'hidden',
              )
            );

            switch ($info_loans['schedule']) {
              case "weekly": // 4 weeks in 1month
                $factor = 1/4;
                break;
              case "biweekly": // 4 weeks in 1month
                $factor = 1/2;
                break;
              case "quarterly": // 4 weeks in 1month
                $factor = 3;
              break;  
              case "monthly": // 1 month in 1month
                $factor = 1;
                break;
              case "biannual":
                $factor = 6;
                break;
            }

            echo form_input(
              array(
                'name' => 'schedule_'.$info_loans['loan_type_id'],
                'id' => 'schedule_'.$info_loans['loan_type_id'],
                'value' => $factor,
                'class' => 'form-control',
                'style' => 'width: 30%',
                'type' => 'hidden',
              )
            );                
          }          
        ?>

        <div class="field_row clearfix">
          <?php 
            echo form_label(
              $this->lang->line('loans_apply_date') . ':',
              'apply_date',
              array('class' => 'wide required')
            );
          ?>
          <div class='form_field'>
            <div class='input-group date' id='applydate' style="width: 30%">
              <?php
                echo form_input(
                  array(
                    'name' => 'apply_date',
                    'id' => 'apply_date',
                    'value' => 
                      (isset($loan_info->loan_applied_date) && $loan_info->loan_applied_date > 0) 
                        ? date("d-m-Y", $loan_info->loan_applied_date)
                        : date("d-m-Y"),
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
                $('#applydate, #paymentdate').datetimepicker({
                  format: 'DD-MM-YYYY'
                });
              });
            </script>
          </div>
        </div>

        <div class="field_row clearfix">
          <?php 
            echo form_label(
              $this->lang->line('loans_payment_date') . ':',
              'payment_date',
              array('class' => 'wide required')
            );
          ?>
          <div class='form_field'>
            <div class='input-group date' id='paymentdate' style="width: 30%">
              <?php
                $un_mes = date_create();
                date_add($un_mes, date_interval_create_from_date_string('1 month'));
                echo form_input(
                  array(
                    'name' => 'payment_date',
                    'id' => 'payment_date',
                    'value' => 
                      (isset($loan_info->loan_payment_date) && $loan_info->loan_payment_date > 0)
                        ? date("d-m-Y", $loan_info->loan_payment_date)
                        : date_format($un_mes, "d-m-Y"),
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
          <?php echo form_label($this->lang->line('loans_agent') . ':', 'agent', array('class' => 'wide')); ?>
          <div class='form_field'>
            <?php 
              if ($user_info->person_id === '1') {
                echo form_dropdown(
                  "sel_agent", 
                  $employees, 
                  ($loan_info->loan_agent_id > 0 ? $loan_info->loan_agent_id : $user_info->person_id),
                  "id='sel_agent' class='form-control'"
                );
              }
              else {
                 ucwords($user_info->first_name . ' ' . $user_info->last_name);
              }
            ?>
            <!--
            <?php echo isset($loan_info->agent_name) ? ucwords($loan_info->agent_name) : ucwords($user_info->first_name . " " . $user_info->last_name); ?>
            -->
            <?php
                echo form_input(
                  array(
                    'name' => 'fechas_bien',
                    'id' => 'fechas_bien',
                    'value' => '',
                    'class' => 'form-control',
                    'type' => 'hidden',
                  )
                );
            ?>
            <input type="hidden" id="agent" name="agent" value="<?= ($loan_info->loan_agent_id > 0 ? $loan_info->loan_agent_id : $user_info->person_id) ?>" />
            <input type="hidden" id="approver" name="approver" value="<?= $loan_info->loan_approved_by_id; ?>" />
          </div>
        </div>

        <div class="field_row clearfix">
          <?php echo form_label($this->lang->line('loans_status') . ':', 'status', array('class' => 'wide')); ?>
          <div class='form_field'>
            <?= $loan_status; ?>
            <input type="hidden" id="status" name="status" value="<?= $loan_info->loan_status; ?>" />
          </div>
        </div>

        <div class="field_row clearfix">
          <?php 
            echo form_label(
              $this->lang->line('loans_remarks') . ':',
              'remarks',
              array('class' => 'wide')
            );
          ?>
          <div class='form_field'>
            <?php
              echo form_textarea(
                array(
                  'name' => 'remarks',
                  'id' => 'remarks',
                  'value' => $loan_info->remarks,
                  'rows' => '5',
                  'cols' => '17',
                  'class' => 'form-control'
                )
              );
            ?>
          </div>
        </div>
      </div>

      <div id="sectionB" class="tab-pane fade">
        <h3><?= $this->lang->line("loans_misc_fees"); ?></h3>

        <table class="table table-bordered" id="tbl-income-sources">
          <thead>
            <tr>
              <th style="text-align: center; width: 1%">
                <input type="checkbox" class="select_all_" />
              </th>
              <th style="text-align: center; width: 80%"><?= $this->lang->line("loans_fee"); ?></th>
              <th style="text-align: center; width: 20%"><?= $this->lang->line("loans_amount"); ?></th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($misc_fees as $misc_fee): ?>
              <tr>
                <td>
                  <input type="checkbox" class="select_" />
                </td>
                <td>
                  <input type="text" class="form-control" name="fees[]" value="<?= $misc_fee[0]; ?>" />
                </td>
                <td>
                  <input type="number" class="form-control" step="any" name="amounts[]" value="<?= $misc_fee[1]; ?>" />
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>

        <button class="btn btn-primary" type="button" id="btn-add-row"><?= $this->lang->line("common_add_row"); ?></button>
        <button class="btn btn-danger" type="button" id="btn-del-row"><?= $this->lang->line("common_delete_row"); ?></button>
      </div>

      <div id="sectionC" class="tab-pane fade">
        <h3><?= $this->lang->line('loans_attachments') ?></h3>
        <div id="required_fields_message"><?php echo $this->lang->line('loans_attachments_message'); ?></div>

        <div>
          <ul class="list-inline" id="filelist">
            <?php foreach ($attachments as $attachment): ?>
              <li>
                <div style="text-align: center">
                  <a href="uploads/loan-<?= $loan_info->loan_id; ?>/<?= $attachment['filename']; ?>" target="_blank" title="<?= $attachment['filename']; ?>"><img src="<?= $attachment['icon']; ?>" /></a>
                  <span class="close remove-file" data-file-id="<?= $attachment['id']; ?>" title="Remove this file"><i class="fa fa-times-circle"></i></span>
                </div>

                <div><input type="text" placeholder="descriptions" class="attach-desc" data-id="<?= $attachment['id']; ?>" title="Description of this file is automatically saved." value="<?= $attachment['descriptions']; ?>" /></div>
              </li>
            <?php endforeach; ?>
          </ul>
        </div>

        <div id="progress" class="overlay"></div>

        <div class="progress progress-task" style="height: 4px; width: 15%; margin-bottom: 2px; display: none">
          <div style="width: 0%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-info">
          </div>
        </div>

        <div id="container">
          <a id="pickfiles" href="javascript:;" class="btn btn-default" data-loan-id="<?= $loan_info->loan_id; ?>"><?= $this->lang->line("common_browse"); ?></a> 
        </div>
      </div>

      <div id="sectionE" class="tab-pane fade in">
          <h3><?= $this->lang->line("guarantee"); ?></h3>
          <div id="required_fields_message">
            <?php echo $this->lang->line('common_fields_required_message'); ?>
          </div>
          <ul id="error_message_box"></ul>

          <div class="field_row clearfix">
            <?php
              echo form_label(
                $this->lang->line('guarantee_name') . ':',
                'guarantee_name',
                array('class' => 'wide required')
              );
            ?>
            <div class='form_field'>
              <?php
                echo form_input(
                  array(
                    'name' => 'guarantee_name',
                    'id' => 'guarantee_name',
                    'value' => $guarantee_info->name,
                    'class' => 'form-control'
                  )
                );
              ?>
            </div>
          </div>

          <div class="field_row clearfix">
            <?php 
              echo form_label(
                $this->lang->line('guarantee_type') . ':',
                'guarantee_type',
                array('class' => 'wide required')
              );
            ?>
            <div class='form_field'>
              <?php
                echo form_input(
                  array(
                    'name' => 'guarantee_type',
                    'id' => 'guarantee_type',
                    'value' => $guarantee_info->type,
                    'class' => 'form-control'
                  )
                );
              ?>
            </div>
          </div>

          <div class="field_row clearfix">
            <?php 
              echo form_label(
                $this->lang->line('guarantee_brand') . ':',
                'guarantee_brand',
                array('class' => 'wide required')
              );
            ?>
            <div class='form_field'>
              <?php
                echo form_input(
                  array(
                    'name' => 'guarantee_brand',
                    'id' => 'guarantee_brand',
                    'value' => $guarantee_info->brand,
                    'class' => 'form-control'
                  )
                );
              ?>
            </div>
          </div>

          <div class="field_row clearfix">
            <?php
              echo form_label(
                $this->lang->line('guarantee_make') . ':',
                'guarantee_make', 
                array('class' => 'wide required')
              );
            ?>
            <div class='form_field'>
              <?php
                echo form_input(
                  array(
                    'name' => 'guarantee_make',
                    'id' => 'guarantee_make',
                    'value' => $guarantee_info->make,
                    'class' => 'form-control'
                  )
                );
              ?>
            </div>
          </div>

          <div class="field_row clearfix">
            <?php 
              echo form_label(
                $this->lang->line('guarantee_serial') . ':',
                'guarantee_serial',
                array('class' => 'wide required')
              );
            ?>
            <div class='form_field'>
              <?php
                echo form_input(
                  array(
                    'name' => 'guarantee_serial',
                    'id' => 'guarantee_serial',
                    'value' => $guarantee_info->serial,
                    'class' => 'form-control'
                  )
                );
              ?>
            </div>
          </div>

          <div class="field_row clearfix">
            <?php
              echo form_label(
                $this->lang->line('guarantee_price') . ':',
                'guarantee_price',
                array('class' => 'wide required')
              );
            ?>
            <div class='form_field'>
              <?php
                echo form_input(
                  array(
                    'name' => 'guarantee_price',
                    'id' => 'guarantee_price',
                    'value' => $guarantee_info->price,
                    'class' => 'form-control'
                  )
                );
              ?>
            </div>
          </div>

          <div class="field_row clearfix">
            <?php
              echo form_label(
                $this->lang->line('guarantee_proof') . ':',
                'guarantee_proof',
                array('class' => 'wide')
              );
            ?>
            <div class='form_field'>
              <ul class="sel-proof">   
                <?php if (is_array($proofs)): ?>
                  <?php foreach ($proofs as $proof): ?>
                    <li><input type="hidden" name="proofs[]" value="<?= $proof["id"]; ?>" /><a href="<?= site_url(); ?>uploads/loan-<?= $loan_info->loan_id; ?>/<?= $proof["filename"]; ?>" target="_blank"><?= $proof["descriptions"]; ?></a></li>
                  <?php endforeach; ?>
                <?php endif; ?>
              </ul>
              <a href="loans/attachments/<?= $loan_info->loan_id; ?>/proof" data-toggle='modal' data-target='#attachment_modal' >Select from attachment</a>
            </div>
          </div>

          <div class="field_row clearfix">
            <?php
              echo form_label(
                $this->lang->line('guarantee_images') . ':',
                'guarantee_images',
                array('class' => 'wide')
              );
            ?>
            <div class="form_field">
              <ul class="sel-images">  
                <?php if (is_array($pimages)): ?>
                  <?php foreach ($pimages as $pimage): ?>
                    <li><input type="hidden" name="images[]" value="<?= $pimage["id"]; ?>" /><a href="<?= site_url(); ?>uploads/loan-<?= $loan_info->loan_id; ?>/<?= $pimage["filename"]; ?>" target="_blank"><?= $pimage["descriptions"]; ?></a></li>
                  <?php endforeach; ?>
                <?php endif; ?>
              </ul>
              <a href="loans/attachments/<?= $loan_info->loan_id; ?>/images" data-toggle='modal' data-target='#attachment_modal'>Select from attachment</a>
            </div>
          </div>

          <div class="field_row clearfix">
            <?php
              echo form_label(
                $this->lang->line('guarantee_observations') . ':',
                'guarantee_observations',
                array('class' => 'wide')
              );
            ?>
            <div class='form_field'>
             <?php
                echo form_textarea(
                  array(
                    'name' => 'guarantee_observations',
                    'id' => 'guarantee_observations',
                    'value' => $guarantee_info->observations,
                    'class' => 'form-control'
                  )
                );
              ?>
            </div>
          </div>
        </div>
      </div>
    </div>

    <input type="hidden" id="user_info" value="<?= $user_info->person_id; ?>" />
    <input type="hidden" id="linker" value="<?= random_string('alnum', 16); ?>" />

  </div>
</div>

<div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close"><?= $this->lang->line("common_close"); ?></button>
  <button id="btn-approve" class="btn btn-success" type="button"><?= $this->lang->line('loans_approve'); ?></button>
  <a href="<?= site_url("loans/generate_breakdown/$loan_info->loan_id"); ?>" target="_blank" id="btn-sched" class="btn btn-warning"><?= $this->lang->line('loans_breakdown'); ?></a>
  <a href="<?= site_url("loans/print_disclosure/$loan_info->loan_id"); ?>" target="_blank" id="btn-break-gen" class="btn btn-primary" type="button"><?= $this->lang->line('loans_disclosure'); ?></a>
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

    $("#pdv-info").hide();

    var pdv_texto = '';
    var pdv_id = '';

    if ($('#sale_id_raw').val() && $('#sale_id_raw').val() != '') {
      pdv_id = $('#sale_id_raw').val();
      pdv_texto = $('#sale_id').val();
      $('#pdv_id').val($('#sale_id_raw').val());
    }
    else if ($('#pdv_id').val() && $('#pdv_id').val() != '') {
      pdv_id = $('#pdv_id').val();
      pdv_texto = 'PDV - ' + $('#pdv_id').val();
    }

    if($('#customer_id').val() != '') {
      if (pdv_id != '') {
        var pdv_link = 'http://localhost/pdv/index.php/sales/receipt/' + pdv_id;
        pdv_texto = 'Nota de remisión ' + pdv_texto;
        $("#pdv-link").attr("href", pdv_link);
        $("#pdv-link").html(pdv_texto);
        $("#pdv-info").show();
      }

      $('#customer').val($('#customer_id').val());
      $('#amount').val($('#loan_amount').val());
      $("#sp-customer").html($('#customer_name').val() + ' <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>');
      $("#sp-customer").show();
      $("#inp-customer").hide();
//      $('#inp-customer').val($('#customer_name').val());
      $('#account').val($('#customer_id').val());
      var description = 'Préstamo generado por la venta ' + $('#sale_id').val() + '.';
      $('#description').val(description);

    }

    $(document).on("click", ".remove-file", function () {
      var el = $(this);
      $.ajax({
        url: '<?= site_url('loans/remove_file'); ?>',
        data: {file_id: el.data("file-id"), softtoken: $("#token_hash").val()},
        type: 'post',
        dataType: 'json',
        success: function (data) {
          el.parent().parent().remove();
        },
        error: function () {
          ;
        }
      });
    });

    $(document).on("change", ".attach-desc", function () {
      var el = $(this);
      el.prop("disabled", true);
      $.ajax({
        url: '<?= site_url('loans/attach_desc'); ?>',
        data: {attach_id: el.data("id"), softtoken: $("#token_hash").val(), desc: el.val()},
        type: 'post',
        dataType: 'json',
        success: function (data) {
          el.prop("disabled", false);
        },
        error: function () {
          ;
        }
      });
    });

    $("#btn-add-row").click(function () {
      $(".select_all_").prop("checked", false);

      var rowCount = $('#tbl-misc-fees tr').length;
      if (rowCount > 1) {
        $("#tbl-misc-fees tbody").append("<tr>" + $('#tbl-income-sources tr:last').html() + "</tr>");
      }
      else {
        $("#tbl-misc-fees tbody").append('<tr><td><input type="checkbox" class="select_" /></td><td><input type="text" class="form-control" name="sources[]" /></td><td><input type="number" class="form-control" name="values[]" /></td></tr>');
      }
    });

    $("#btn-del-row").click(function () {
      $('.select_').each(function () {
        if ($(this).is(":checked")) {
          $(this).parent().parent().remove();
        }
      });
    });

    $("#btn-add-row").click(function () {
      $(".select_all_").prop("checked", false);

      var rowCount = $('#tbl-income-sources tr').length;
      if (rowCount > 1) {
        $("#tbl-income-sources tbody").append("<tr>" + $('#tbl-income-sources tr:last').html() + "</tr>");
      }
      else {
        $("#tbl-income-sources tbody").append("<tr><td><input type='checkbox' class='select_' /></td><td><input type='text' class='form-control' name='sources[]' /></td><td><input type='number' class='form-control' name='values[]' /></td></tr>");
      }
    });

    $("#btn-del-row").click(function () {
      $('.select_').each(function () {
        if ($(this).is(":checked")) {
          $(this).parent().parent().remove();
        }
      });
    });

    $("#loan_type").change(function () {
      var id = $(this).val();

      $("#loan_type_id").val($(this).val());
      var numpagos = 0;
      var cuota =0;
      var meses  = $("#term_"+id).val();
      var tasa = $("#tasa_"+id).val();      
      var frecuencia = $("#schedule_"+id).val();
      var monto = $("#amount").val();

      tasa = tasa/100/12*frecuencia;
      numpagos = meses/frecuencia;
      var power = Math.pow(1+tasa,numpagos);

      if (tasa != 0) {
        cuota = tasa *(-monto)*power/(1-power);
      }
      else {
        cuota = monto / numpagos;
      }

      $("#cuota").val( (cuota).toFixed(2));

    });
    
    $("#amount").change(function () {

      var id = $("#loan_type_id").val();
      var numpagos = 0;
      var cuota =0;
      var meses  = $("#term_"+id).val();
      var tasa = $("#tasa_"+id).val();      
      var frecuencia = $("#schedule_"+id).val();
      var monto = $("#amount").val();
      
      tasa = tasa/100/12*frecuencia;
      numpagos = meses/frecuencia;
      var power = Math.pow(1+tasa,numpagos);

      if (tasa != 0) {
        cuota = tasa *(-monto)*power/(1-power);
      }
      else {
        cuota = monto / numpagos;
      }
      
      $("#cuota").val( (cuota).toFixed(2));
      
    });

    $("#sel_agent").change(function () {
      $("#agent").val($(this).val());
    });

    $("#btn-approve").click(function () {
      $("#approver").val($("#user_info").val());
      $("#loan_form").submit();
    });

    if ($("#agent").val() <= 0) {
      $("#agent").val($("#user_info").val());
    }


    if ($("#loan_id").val() > -1) {
      $("#loan_form input, textarea").prop("readonly", true);
      $("#loan_form select").prop("disabled", true);
      $("#btn-add-row").prop("disabled", true);
      $("#btn-del-row").prop("disabled", true);
      $("#btn-save").hide();

      if ($("#status").val() !== "approved") {
        $("#btn-approve").show();
      }
      else {
        $("#btn-approve").hide();
      }

      $("#btn-break-gen").show();
      $("#btn-sched").show();
      $("#btn-edit").show();

      $("#btn-edit").click(function () {
        $("#btn-save").show();
        $(this).hide();
        $("#loan_form input, textarea").prop("readonly", false);
        $("#loan_form select").prop("disabled", false);
        $("#btn-add-row").prop("disabled", false);
        $("#btn-del-row").prop("disabled", false);
        $("#btn-save").show();
      });
    }
    else {
      $("#btn-approve").hide();
      $("#btn-break-gen").hide();
      $("#btn-sched").hide();
      $("#btn-edit").hide();
    }

    $(document).on("click", ".btn-remove-row", function () {
      $("#sp-customer").hide();
      $("#sp-customer").html("");
      $("#inp-customer").val("");
      $("#inp-customer").show();
      $("#customer").val("");
      $("#account").val('');
    });

    $('#inp-customer').autocomplete({
      serviceUrl: '<?php echo site_url("loans/customer_search"); ?>',
      onSelect: function (suggestion) {
        $("#account").val(suggestion.data);
        $("#customer").val(suggestion.data);
        $("#sp-customer").html(suggestion.value + ' <span><a href="javascript:void(0)" title="Remove Customer" class="btn-remove-row"><i class="fa fa-times"></i></a></span>');
        $("#sp-customer").show();
        $("#inp-customer").hide();
      }
    });

    $('#loan_form').validate({
      submitHandler: function (form) {
        $(form).ajaxSubmit({
          success: function (response) {
            post_loan_form_submit(response);
          },
          dataType: 'json'
        });
      },
      errorLabelContainer: "#error_message_box",
      wrapper: "li",
      ignore: [],
      rules: {
        fechas_bien: "required",
        loan_type: "required",
        account: "required",
        amount: "required",
        "inp-customer": "required"
      },
      messages: {
        fechas_bien: "<?php echo 'La fecha de pago no puede ser anterior a la fecha del préstamo.'; ?>",
        loan_type: "<?php echo $this->lang->line('loans_type_required'); ?>",
        account: "<?php echo $this->lang->line('loans_account_required'); ?>",
        amount: "<?php echo $this->lang->line('loans_amount_required'); ?>",
        "inp-customer": "<?php echo $this->lang->line('loans_customer_required'); ?>"
      }
    });

    $("#btn-save").click(function () {
      var ad_arr = ($('#apply_date').val()).split('-');
      var pd_arr = ($('#payment_date').val()).split('-');

      var ad = new Date(ad_arr[2],ad_arr[1]-1,ad_arr[0]);
      var pd = new Date(pd_arr[2],pd_arr[1]-1,pd_arr[0]);
      if ( ad > pd ) {
        $('#fechas_bien').val('');
      }
      else {
        $('#fechas_bien').val('bien');
      }
    });
  });
</script>
