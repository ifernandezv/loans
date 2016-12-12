<?php $this->load->view("partial/header"); ?>
<div id="receipt_wrapper">
	<div id="receipt_header">
   		<?php if($this->config->item('company_logo')) {?>
		<div id="company_logo_pdp"><?php echo img(array('src' => $this->Appconfig->get_logo_image())); ?></div>
		<?php } ?>      
        <div id="company_info">
		<div id="company_name_pdp"><?php echo $this->config->item('company'); ?></div>
		
		<div id="company_address_pdp"><?php echo nl2br($this->Location->get_info_for_key('address')); ?></div>
		<div id="company_phone_pdp"><?php echo $this->Location->get_info_for_key('phone'); ?></div>
		<?php if($this->config->item('website')) { ?>
			<div id="website_pdp"><?php echo $this->config->item('website'); ?></div>
		<?php } ?>
		<div id="sale_time_pdp"><?php echo $transaction_time ?></div>

    </div>
	</div>
    
    <br />
    <?php // print_r($sales_items); 
	
	//echo $fecha_pago."<br>";
	
	/**
	foreach($sales_items as $item)
		{
	
		echo "ITEM ID ".$item['item_id']."<br>";
		echo "PRECIO ".$item['item_cost_price']."<br>";
		echo "DESCUENTO ".$item['discount_percent']."<br>";
		echo "PLAZO ".$item['plazo']."<br>";
		echo "TASA ".$item['tasa']."<br>";
		echo "FRECUENCIA ".$item['frecuencia']."<br>";
		echo "CUOTA ".$item['cuotamensual']."<br>";
		echo "NAME ".$item['name']."<br>";
		echo "CATEGORIA ".$item['category']."<br>";
		echo "NOMBRE DEL ITEM ".$item['name']."<br>";
	
		}
	**/
	
	?>
    
    
    
    
	<div id="receipt_general_info_pdp">
		<?php if(isset($customer))
		{
		?>
			<div id="customer"><?php echo lang('customers_customer').": ".$customer; ?></div>
			<?php if(!empty($customer_address_1)){ ?><div><?php echo lang('common_address'); ?> : <?php echo $customer_address_1. ' '.$customer_address_2; ?></div><?php } ?>
			<?php if (!empty($customer_city)) { echo $customer_city.' '.$customer_state.', '.$customer_zip;} ?>
			<?php if (!empty($customer_country)) { echo '<div>'.$customer_country.'</div>';} ?>			
			<?php if(!empty($customer_phone)){ ?><div><?php echo lang('common_phone_number'); ?> : <?php echo $customer_phone; ?></div><?php } ?>
			<?php if(!empty($customer_email)){ ?><div><?php echo lang('common_email'); ?> : <?php echo $customer_email; ?></div><?php } ?>
		<?php
		}
		?>
		<div id="sale_id"><?php echo lang('sales_id').": ".$sale_id; ?></div>
		<div id="employee"><?php echo lang('employees_employee').": ".$employee; ?></div>
		<?php 
		if($this->Location->get_info_for_key('enable_credit_card_processing'))
		{
			echo '<div id="mercahnt_id">'.lang('config_merchant_id').': '.$this->Location->get_info_for_key('merchant_id').'</div>';
		}
		?>
		
	</div>
    <div id="sale_receipt_pdp"><h3><?php echo lang('common_plandepagos'); ?></h3></div>
	<table id="receipt_items">
	<tr>
    <th style="width:<?php echo $discount_exists ? "3%" : "5%"; ?>;text-align:left;"><?php echo lang('items_num'); ?></th>
	<th style="width:<?php echo $discount_exists ? "12%" : "15%"; ?>;text-align:left;"><?php echo lang('items_payment_date'); ?></th>
	<th style="width:20%;text-align:left;" ><?php echo lang('common_capital'); ?></th>
	<th style="width:15%;text-align:left;"><?php echo lang('common_interes'); ?></th>
    <th style="width:15%;text-align:left;"><?php echo lang('common_cuota_total'); ?></th>
	<?php if($discount_exists) 
    {
	?>
	<th style="width:16%;text-align:left;"><?php echo lang('sales_discount'); ?></th>
	<?php
	}
	?>
	<th style="width:16%;text-align:right;"><?php echo lang('common_saldo'); ?></th>
	</tr>
	<?php
	if (count($sales_items) > 0)
	{
  //   print_r($payments); 

		?>			
		<?php
		$current_category = FALSE;
		
		$datetime1 = date_create(date(get_date_format().' '.get_time_format(), strtotime($transaction_time)));
		$datetime2 = date_create(date(get_date_format().' '.get_time_format(), strtotime($fecha_pago)));
	
		$intervalo = date_diff($datetime1, $datetime2);
		$dif_dias = $intervalo->format('%R%a days');
		$dif_dias_a = $dif_dias;
	
		if ($dif_dias<30)
		{
			$dias_faltantes = 30 - $dif_dias;
			$dif_dias = 30 - $dias_faltantes;
		}
		else 
		{
			$dif_dias = $dif_dias - 30;
		}
		
		echo "DIFERENCIA DE DIAS ".$dif_dias;
					
				
foreach($sales_items as $item)
{	
	$saldo = $item['item_unit_price'] - $item['cuotainicial'];
	$frecuencia = "+0 month"; 
	
	//CONVIRTIENDO LA DIFERENCIA DE DIAS EN MESES
	$dif_dias = $dif_dias/30;
	$interes_dif = $saldo*$item['tasa']/12/100*$item['frecuencia']*$dif_dias;
	
	if ($item['cuotainicial'] >0)
	{
		$contador = 1;	
		$limit = 2;
	}
	else 
	{
		$contador = 0;
		$limit = 1;	
	}
	//DECLARAMOS LA FECHA DEL PRIMER PAGO PARA VER SI EXISTE AMORTIZACIONES EN EL RANGO DE FECHAS
	
	$fecha_primer_pago = date(get_date_format(), strtotime($transaction_time));
	
	for ($i=$contador;$i<(($item['plazo']/$item['frecuencia'])+$limit);$i++)
   		{	
			//TIPO DE PAGO MENSUAL - BIMENSUAL - TRIMESTRAL 
			$frecuencia = "+".$item['frecuencia']." month";	
			
			if ($item['cuotainicial']>0 && $i==1)
					//CUOTA INICIAL 
			{
			?>
        		 <tr>
                        <td style="text-align:left;">PI</td>
                        <td style="text-align:left;"><?php echo date(get_date_format(),strtotime($fecha_primer_pago)); ?></td>
                        <td style="text-align:left;"><?php echo to_currency($item['cuotainicial']) ?></td>
                        <td style='text-align:left;'><?php echo to_currency(0); ?></td>
                        <td style='text-align:right;'><?php echo to_currency($item['cuotainicial']); ?></td>
                        <td style='text-align:right;'><?php echo to_currency($item['item_unit_price']); ?></td>
                  </tr>
				<?php
				$fecha_primer_pago = date(get_date_format(), strtotime($fecha_pago));
		    }
			else 
			{
				
				$fecha_siguiente_pago = date(get_date_format(), strtotime ($frecuencia, strtotime($fecha_primer_pago)));			
				//SACAMOS TODOS LOS PAGOS 
				foreach ($payments as $payment)
				{
										
					//PREGUNTAMOS SI EXISTE ARMOTIZACION 
					if ($payment['payment_type'] == lang('sales_amortizacion'))
						{
							//echo "S FA ".strtotime($fecha_pago_amortizacion);
							
								$fecha_pago_amortizacion =  date(get_date_format(), strtotime ($frecuencia,strtotime($payment['payment_date'])));
								/*
								echo "S FA ".strtotime($fecha_pago_amortizacion);
								echo "FILA ".$i;
								echo ":::: FA ".$fecha_pago_amortizacion;
								echo " :::: F1P ".$fecha_primer_pago;
								echo " :::: FSP ".$fecha_siguiente_pago."<br>";
								*/
								//VERIFICAMOS SI EL PAGO SE REALIZO ENTRE LA FECHA 1 y LA FECHA SIGUIENTE DE PAGO
								
							
								if (strtotime($fecha_pago_amortizacion) >= strtotime($fecha_primer_pago) && strtotime($fecha_pago_amortizacion) <= strtotime($fecha_siguiente_pago))
								{
	
							/*		echo '<script type="text/javascript">alert ("FECHA '.$fecha_pago_amortizacion.' ES MAYOR IGUAL A LA FECHA '.$fecha_1.' ::::: Y MENOR IGUAL A LA FECHA '.$fecha_siguiente_pago.'")</script>'; 	*/
										//RESTAMOS AL SALDO Y LO MOSTRAMOS SIN NUMERO i
											$saldo = $saldo-($payment['payment_amount']*-1);
											?>	
											<tr>
											<td style="text-align:left;"><?php // echo $i; ?></td>
											<td style="text-align:left;"><?php echo date(get_date_format(), strtotime ($payment['payment_date'])); ?></td>
											<td style="text-align:left;"><?php echo to_currency(($payment['payment_amount']*-1)) ?></td>
											<td style='text-align:left;'><?php echo to_currency(0); ?></td>
											<td style='text-align:right;'><?php echo to_currency(($payment['payment_amount']*-1)); ?></td>
											<td style='text-align:right;'><?php echo to_currency($saldo); ?></td>
											</tr>
											<?php  											
								}		
						}
		
				 }
				
					
								$cuotamensual = $item['cuotamensual']; 
								
								//CALCULANDO EL INTERES POR LA X DE DIAS					
								$interes_dif = $saldo*$item['tasa']/12/100*$item['frecuencia']*$dif_dias;
								
								//2da PASDA $interes_dif = 0;
								
								//CALCULANDO EL INTERES EN BASE AL SALDO * TASA /12/100*FRECUENCIADEPAGO + DIFERENCIA DE INTERES
								
								if ($dif_dias_a>=30)
								{
									$interes = $saldo*$item['tasa']/12/100*$item['frecuencia'] + $interes_dif;
									
									//CALCULANDO CAPITAL EN BASE A LA CUOTA MENSUAL				
									if ($interes_dif>0)
										{
											$cuotamensual = $cuotamensual + $interes_dif;
											echo "CUOTA MENSUAL <br> ";
										}
									
									$capital = $cuotamensual - $interes;	
										
								}
								elseif ($dif_dias_a < 30)
								{
									$interes = $interes_dif;
									$capital = $cuotamensual - $interes; //Capital de 1 MES 30 DIAS
									$capital = $capital/30*	$dif_dias_a;	//Capital de X dias menos a 30 
									$dif_dias_a = 30;				
									
								}
													
								
								//CUOTA TOTAL SUMA DE CAPITA + INTERES
								
								$cuota_total = $capital + $interes;
								$saldo = $saldo - $capital;
								$a = 0;
								if ($i == (($item['plazo']/$item['frecuencia'])+$contador) || $saldo <= 0)
								{
									$cuota_total = $cuota_total + $saldo;
									$saldo =  $cuota_total - $saldo - $capital - $interes;
									//break;
									$a = $i;
									$i = ($item['plazo']/$item['frecuencia'])+$contador;
								}
								$interes_dif=0;
								$dif_dias=0;
								
								if($a == 0)
								{
									$contador = $i;
								}
								else
								{
									$contador = $a;
								}
								
			 
			?>
								<tr>
								<td style="text-align:left;"><?php echo "N ".$contador; ?></td>
								<td style="text-align:left;"><?php echo $fecha_primer_pago; ?></td>
								<td style="text-align:left;"><?php echo to_currency($capital); ?></td>
								<td style='text-align:left;'><?php echo to_currency($interes); ?></td>
								<td style='text-align:right;'><?php echo to_currency($cuota_total); ?></td>
								<td style='text-align:right;'><?php echo to_currency($saldo); ?></td>
								</tr>
				
			  
							<?php
						//FECHA QUE SE REALIZARA EL PRIMER PAGO EN FORMATO (DD-MM-AAAA)
								$fecha_primer_pago = $fecha_siguiente_pago;						
						}	
			
			}
		}
	}
		?>	


	<?php
	if (count($sales_item_kits) > 0)
	{
		?>			
		<tr>
				<td colspan="<?php echo $discount_exists ? '5' : '4'; ?>">
					<h1><?php echo lang('module_item_kits'); ?></h1>
				</td>
			</tr>
		<?php
		$current_category = FALSE;
		foreach($sales_item_kits as $item)
		{
			if ($current_category != $item['category'])
			{
			?>
				<tr>
					<td colspan="<?php echo $discount_exists ? '5' : '4'; ?>">
						<h3><?php echo $item['category'];?></h3>
					</td>
				</tr>
			<?php
				$current_category = $item['category'];
			}
			?>
			<tr>
			<td style="text-align:left;"><?php echo $item['name']; ?></td>
			<td style="text-align:left;"><?php echo to_currency($item['item_kit_unit_price']); ?></td>
			<td style='text-align:left;'><?php echo to_quantity($item['quantity_purchased']); ?></td>
			<?php if($discount_exists) 
			{
			?>
			<td style='text-align:left;'><?php echo $item['discount_percent']; ?></td>
			<?php
			}
			?>
			<td style='text-align:right;'><?php echo to_currency($item['item_kit_unit_price']*$item['quantity_purchased']-$item['item_kit_unit_price']*$item['quantity_purchased']*$item['discount_percent']/100); ?></td>
			</tr>

		    <tr>
		    <td colspan="3" align="left"><?php echo $item['description']; ?></td>
		
			<?php if($discount_exists) {?>
			<td colspan="1"><?php echo '&nbsp;'; ?></td>
			<?php } ?>
		    </tr>

		<?php
		}
	}
		?>

	<tr>
		<td colspan="<?php echo $discount_exists ? '5' : '4'; ?>" align="right">
		<?php if($show_comment_on_receipt==1)
			{
				echo $comment ;
			}
		?>
		</td>
	</tr>
	</table>

	<div id="sale_return_policy">
	<?php echo nl2br($this->config->item('return_policy')); ?>
   <br />   

	</div>
	<div id='barcode'>
	<?php echo "<img src='".site_url('barcode')."?barcode=$sale_id&text=$sale_id' />"; ?>
	</div>
	
	
	
<button class="btn btn-primary text-white hidden-print" id="print_button" onclick="print_fulfillment()" > <?php echo lang('sales_print'); ?> </button>
<br />
	
</div>
<?php $this->load->view("partial/footer"); ?>

<?php if ($this->config->item('print_after_sale'))
{
?>
<script type="text/javascript">
$(window).bind("load", function() {
//	window.print();
});
</script>
<?php }  ?>

<script type="text/javascript">
function print_fulfillment()
 {
 //	window.print();
 }
 </script>
