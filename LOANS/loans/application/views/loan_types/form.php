<?php echo form_open('loan_types/save/' . $loan_type_info->loan_type_id, array('id' => 'loan_type_form')); ?>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title"><?php echo $this->lang->line("loan_type_info"); ?></h4>

</div>
<div class="modal-body">

    <div style="overflow-y: auto" id="div-form">

        <div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
        <ul id="error_message_box"></ul>
        <div class="field_row clearfix">
            <?php echo form_label($this->lang->line('loan_type_name') . ':', 'name', array('class' => 'wide required')); ?>
            <div class='form_field'>
                <?php
                echo form_input(
                        array(
                            'name' => 'name',
                            'id' => 'name',
                            'value' => $loan_type_info->name,
                            'class' => 'form-control'
                        )
                );
                ?>
            </div>
        </div>

        <div class="field_row clearfix">
            <?php echo form_label($this->lang->line('loan_type_description') . ':', 'description', array('class' => 'wide')); ?>
            <div class='form_field'>
                <?php
                echo form_textarea(
                        array(
                            'name' => 'description',
                            'id' => 'description',
                            'value' => $loan_type_info->description,
                            'rows' => '5',
                            'cols' => '17',
                            'class' => 'form-control'
                        )
                );
                ?>
            </div>
        </div>

        <div class="field_row clearfix">
            <?php echo form_label($this->lang->line('loan_type_term') . ':', 'term', array('class' => 'wide required')); ?>
            <div class='form_field'>
                <?php
                echo form_input(
                        array(
                            'name' => 'term',
                            'id' => 'term',
                            'value' => $loan_type_info->term,
                            'class' => 'form-control',
                            'style' => 'width: 20%; display: inline',
                        )
                );
                ?>       
                <?php echo form_dropdown('term_period_type', $term_period, $loan_type_info->term_period_type, 'class="form-control" id="term_period_type" style="width:20%; display: inline"'); ?>
            </div>
        </div>

        <div class="field_row clearfix">
            <?php echo form_label($this->lang->line('loan_type_period') . ':', 'term', array('class' => 'wide required')); ?>
            <div class='form_field'>
                <?php echo form_dropdown('payment_schedule', $period, $loan_type_info->payment_schedule, 'class="form-control" style="width:20%; display: inline"'); ?>
            </div>
        </div>

        <?php for ($i = 1; $i <= 1; $i++) : ?>

            <div class="field_row clearfix">
                <?php echo form_label($this->lang->line('loan_type_percent_charge' . $i) . ':', 'percent_charge' . $i, array('class' => 'wide')); ?>
                <div class='form_field' style="white-space: nowrap;">                
                    <?php
                    $percent_charge = "percent_charge" . $i;
                    $period_charge = "period_charge" . $i;
                    $period_type = "period_type" . $i;
                    echo form_input(
                            array(
                                'name' => 'percent_charge' . $i,
                                'id' => 'percent_charge' . $i,
                                'value' => $loan_type_info->$percent_charge,
                                'type' => "number",
                                'step' => "any",
                                'class' => "form-control",
                                'style' => "width: 20%; display: inline",
                            )
                    );

                    echo " % ";
                    echo "<span class='per_condition'>";
                    echo " " . $this->lang->line("loan_type_per") . " ";
                    echo form_input(
                            array(
                                'name' => 'period_charge' . $i,
                                'id' => 'period_charge' . $i,
                                'value' => $loan_type_info->$period_charge,
                                'type' => "number",
                                'step' => "any",
                                'class' => "form-control",
                                'style' => "width: 20%; display: inline",
                            )
                    );
                    ?>
                    <?php echo form_dropdown('period_type' . $i, $terms, $loan_type_info->$period_type, 'class="form-control" style="width:20%; display: inline"'); ?>
                    <?php echo "</span>"; ?>
                </div>
            </div>

        <?php endfor; ?>
        
                    <div class="field_row clearfix">
                <?php echo form_label($this->lang->line('loan_type_percent_charge' . $i) . ':', 'percent_charge' . $i, array('class' => 'wide')); ?>
                <div class='form_field' style="white-space: nowrap;">                
                    <?php
                    $percent_charge = "percent_charge2";
                    $period_charge = "period_charge2";
                    $period_type = "period_type2";
                    echo form_input(
                            array(
                                'name' => 'percent_charge' . $i,
                                'id' => 'percent_charge' . $i,
                                'value' => $loan_type_info->$percent_charge,
                                'type' => "number",
                                'step' => "any",
                                'class' => "form-control",
                                'style' => "width: 20%; display: inline",
                            )
                    );

                    echo $this->config->item('currency_symbol') ;
                    echo "<span class='per_condition'>";
                    echo " " . $this->lang->line("loan_type_per") . " ";
                    echo form_input(
                            array(
                                'name' => 'period_charge2',
                                'id' => 'period_charge2',
                                'value' => $loan_type_info->$period_charge,
                                'type' => "number",
                                'step' => "any",
                                'class' => "form-control",
                                'style' => "width: 20%; display: inline",
                            )
                    );
                    ?>
                    <?php echo form_dropdown('period_type' . 2, $terms, $loan_type_info->$period_type, 'class="form-control" style="width:20%; display: inline"'); ?>
                    <?php echo "</span>"; ?>
                </div>
            </div>

    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close"><?= $this->lang->line("common_close"); ?></button>
    <?php
    echo form_submit(
            array(
                'name' => 'submit',
                'id' => 'submit',
                'value' => $this->lang->line('common_submit'),
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
    $(document).ready(function ()
    {
        $("#div-form").height($(window).height() - 250);

        $('#loan_type_form').validate({
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    success: function (response)
                    {
                        post_loan_type_form_submit(response);
                    },
                    dataType: 'json'
                });

            },
            errorLabelContainer: "#error_message_box",
            wrapper: "li",
            rules: {
                name: "required",
                term: "required"
            },
            messages: {
                name: "<?php echo $this->lang->line('loan_type_name_required'); ?>",
                term: "<?php echo $this->lang->line('loan_type_term_required'); ?>"
            }
        });

        if ($("#term_period_type").val() === "month")
        {
            $(".per_condition").hide();
        }
        else
        {
            $(".per_condition").show();
        }

        $(document).on("change", "#term_period_type", function () {
            if ($(this).val() === "month")
            {
                $(".per_condition").hide();
            }
            else
            {
                $(".per_condition").show();
            }
        });
    });
</script>