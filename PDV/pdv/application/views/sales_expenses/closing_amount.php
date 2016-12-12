<?php $this->load->view("partial/header"); ?>
<div id="content-header" class="hidden-print salezz-head">
	<h1> <i class="fa fa-upload"></i>  <?php echo lang('sales_closing_amount')?></h1>
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
				<h5 class="hidden-print"><?php echo lang('sales_closing_amount_desc'); ?></h5>
                <h5 class="print"><?php echo $close_register_name;?> </h5>
			</div>
			<div class="widget-content nopadding">
				<ul class="text-error" id="error_message_box"></ul><?php
				echo form_open('sales_expenses/closeregister' . $continue, array('id'=>'closing_amount_form','class'=>'form-horizontal'));
				?>

				<h3 class="text-left text-success text-center"><?php echo sprintf(lang('sales_closing_amount_approx'), to_currency($closeout)); ?></h3>
				 <h5 class="text-left text-center"><?php echo lang('sales_closing_user_open').'</h5><h4 class="text-left text-center"> '.$employee_open; ?></h4>
                 <h5 class="text-left text-success text-center">Inicio de Caja: <?php echo $shift_start;?></h5>
                 <hr>
                 
                 <h5 class="text-left text-center"><?php echo lang('sales_closing_user_close').' </h5><h4 class="text-left text-center"> '.$employee_close; ?></h4>
                 <h5 class="text-left text-success text-center">Corte de Caja: <?php echo $shift_close;?></h5>		
				<div class="widget-content">
					<div class="row">
						<div  style=" margin: 5px auto; width: 50%; text-align: center;">
							
							<div style=" margin: 10px auto; width: 50%; text-align: center;">
								<?php echo form_label(lang('sales_closing_amount').':', 'closing_amount',array('class'=>'control-label')); ?>
								<?php echo form_input(array(
									'name'=>'closing_amount',
									'id'=>'closing_amount',
									'value'=>'')
									);?>
							</div>
								<div style=" margin: 0 auto; width: 50%; text-align: center;">
									<input type="button" id="close_submit" class="btn btn-primary hidden-print" value="<?php echo lang('common_submit'); ?>">

								</div>
								<div style="clear:both;"></div>
								
								<div style="text-align: center;" class="hidden-print">
									<h2><?php echo lang('common_or'); ?></h2>					
									<input type="button" id="logout_without_closing" class="btn btn-primary hidden-print" value="<?php echo lang('sales_logout_without_closing_register'); ?>">
									<br /><br />
								</div>
							</div></div>
							<?php
							echo form_close();
							?>
						</div>
					</div>
			</div>
			<?php $this->load->view('partial/footer.php'); ?>
			<script type='text/javascript'>

//validation and submit handling
$(document).ready(function(e)
{
	$("#closing_amount").focus();
	
	
	$("#closing_amount").keypress(function (e) {
	    if (e.keyCode == 13) {
	    	e.preventDefault();
	       	check_amount();
	    }
	 });

	$('#close_submit').click(function(){
		check_amount();
	});
	var submitting = false;

	$('#closing_amount_form').validate({
		rules:
		{
			closing_amount: {
				required: true,
				number: true
			}
		},
		messages:
		{
			closing_amount: {
				required: <?php echo json_encode(lang('sales_amount_required')); ?>,
				number: <?php echo json_encode(lang('sales_amount_number')); ?>
			}
		}
	});
	
	$("#logout_without_closing").click(function()
	{
		window.location = '<?php echo site_url('home/logout'); ?>';
	});
	
});

function check_amount()
{

	if($('#closing_amount').val()=='<?php echo $closeout; ?>' || $('#closing_amount').val()=='<?php echo to_currency_no_money($closeout); ?>')
		{
			$('#closing_amount_form').submit();	
			window.print();
		}
		else
		{
			if(confirm(<?php echo json_encode(lang('closing_amount_not_equal')); ?>))
			{
				$('#closing_amount_form').submit();
				window.print();			
			}
			
		}
}
</script>