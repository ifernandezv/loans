<?php $this->load->view("partial/header"); ?>
<div id="content-header">
	<h1><i class="fa fa-beaker"></i>  <?php echo lang('reports_report_input'); ?></h1> 
</div>

<div id="breadcrumb" class="hidden-print">
	<?php echo create_breadcrumb(); ?>
</div>
<div class="clear"></div>
<div class="row">
	<div class="col-md-12">
		<div class="widget-box">
			<div class="widget-title">
				<span class="icon">
					<i class="fa fa-align-justify"></i>									
				</span>
				<h5><?php echo form_label('Seleccione el Tipo de Clientes', array('class'=>'required')); ?>
				</h5>
			</div>
			<div class="widget-content nopadding">
				<?php
				if(isset($error))
				{
					echo "<div class='error_message'>".$error."</div>";
				}
				?>
				<form  class="form-horizontal form-horizontal-mobiles">
					
					<div class="form-group">
						<?php echo form_label(lang('reports_customer_type').' :', 'reports_customer_type_label', array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label  ')); ?> 
						<div class="col-sm-9 col-md-9 col-lg-10">
							<?php echo form_dropdown('customer_type',array('0' => 'Todos', '1' => lang('reports_deudores'), '2' => lang('reports_cerodeuda')), 'all', 'id="customer_type" class="input-medium"'); ?>
						</div>
					</div>

					<div class="form-group" style="display:none">
						<?php echo form_label(lang('reports_export_to_excel').' :', 'reports_export_to_excel', array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label  ')); ?> 
						<div class="col-sm-9 col-md-9 col-lg-10">
							<input type="radio" name="export_excel" id="export_excel_yes" value='1' /> <?php echo lang('common_yes'); ?>  &nbsp;&nbsp;
							<input type="radio" name="export_excel" id="export_excel_no" value='0' checked='checked' /> <?php echo lang('common_no'); ?>
						</div>
					</div>

					<div class="form-actions">
						<?php
						echo form_button(array(
							'name'=>'generate_report',
							'id'=>'generate_report',
							'content'=>lang('common_submit'),
							'class'=>'btn btn-primary submit_button btn-large')
						);
						?>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</div>

<?php $this->load->view("partial/footer"); ?>

<script type="text/javascript" language="javascript">
	$(document).ready(function()
	{
		$("#generate_report").click(function()
		{
			var customer_type = $("#customer_type").val();
			var export_excel = 0;
			if ($("#export_excel_yes").prop('checked'))
			{
				export_excel = 1;
			}

			if ($("#simple_radio").prop('checked'))
			{
				window.location = window.location+'/'+customer_type+'/'+export_excel;
			}
			else
			{
				var start_date = $("#start_year").val()+'-'+$("#start_month").val()+'-'+$('#start_day').val()+' '+$('#start_hour').val()+':'+$('#start_minute').val()+':00';
				var end_date = $("#end_year").val()+'-'+$("#end_month").val()+'-'+$('#end_day').val()+' '+$('#end_hour').val()+':'+$('#end_minute').val()+':00';

				window.location = window.location+'/'+customer_type+'/'+ export_excel;
			}
		});

		$("#start_month, #start_day, #start_year, #end_month, #end_day, #end_year").change(function()
		{
			$("#complex_radio").prop('checked', true);
		});

		$("#report_date_range_simple").change(function()
		{
			$("#simple_radio").prop('checked', true);
		});

	});
</script>