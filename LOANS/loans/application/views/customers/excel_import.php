<?php
echo form_open_multipart('customers/do_excel_import/', array('id' => 'item_form'));
?>


<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title"><?php echo $this->lang->line("customers_basic_information"); ?></h4>

</div>
<div class="modal-body">

    <div id="required_fields_message">Importar Clientes desde Excel</div>
    <ul id="error_message_box"></ul>
    <b><a href="<?php echo site_url('customers/excel'); ?>">Descargar archivo modelo de Excel (CSV)</a></b>
    <fieldset id="item_basic_info">
        <legend>Importar</legend>

        <div class="field_row clearfix">  
            <?php echo form_label('Archivo:', 'name', array('class' => 'wide')); ?>
            <div class='form_field'>
                <?php
                echo form_upload(array(
                    'name' => 'file_path',
                    'id' => 'file_path',
                    'value' => '')
                );
                ?>
            </div>
        </div>


    </fieldset>
</div>


<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close"><?= $this->lang->line("common_close"); ?></button>


    <?php
    echo form_submit(array(
        'name' => 'submitf',
        'id' => 'submitf',
        'value' => $this->lang->line('common_submit'),
        'class' => 'btn btn-primary')
    );
    ?>

</div>
<?php echo form_close(); ?>


<script type='text/javascript'>

//validation and submit handling
    $(document).ready(function ()
    {
        $('#item_form').validate({
            submitHandler: function (form)
            {
                $(form).ajaxSubmit({
                    success: function (response)
                    {
                        post_person_form_submit(response);
                    },
                    dataType: 'json',
                    type: 'post'
                });

            },
            errorLabelContainer: "#error_message_box",
            wrapper: "li",
            rules: {
                file_path: "required"
            },
            messages: {
                file_path: "Full path to excel file required"
            }
        });
    });
</script>