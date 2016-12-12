<?php $this->load->view("partial/header"); ?>
<style type="text/css" >
      #gmaps_resultado {
           width:80%;
           height:768px;
		   margin:0 auto;
     }
</style>	
<?php  // print_r($report_data);?>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpBrwfPXuOM5feoW74ha3OaklCT_tLPxE"></script>
<script type="text/javascript" language="javascript">
$(document).ready(function() {
    initialize();
});
function initialize() {
        var myOptions = {
			<?php $t=0; foreach ($report_data as $gmaps) {?>
			<?php if($gmaps['latsale']!=0 && $t==0){ ?>
          	center: new google.maps.LatLng(<?php echo $gmaps['latsale'].",".$gmaps['longsale']; $t=1;?>),
		 	<?php } }?>
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("gmaps_resultado"), myOptions);  
<?php $i=0; foreach ($report_data as $gmaps) {?>
		<?php if($gmaps['latsale']!=0){
			$i++;	
			
			if( $gmaps['type']=0)
			{
				$tipo = 'MALO';
			}
			else 
			{
				$tipo = 'BUENO'; 
			}
		?>
	 		gozilla<?php echo $gmaps['personid']?> = new google.maps.Marker({ position: new google.maps.LatLng(<?php echo $gmaps['latsale'].",".$gmaps['longsale']?>),   
      		animation: google.maps.Animation.DROP,
			map: map,         
      		title: 'Click para Ver Detalles'}); 
		
 			infoWindow<?php echo $gmaps['personid']?> = new google.maps.InfoWindow();
			google.maps.event.addListener(gozilla<?php echo $gmaps['personid']?>, 'click', function(){ openInfoWindow<?php echo $gmaps['personid']?>(gozilla<?php echo $gmaps['personid']?>); });
		
			function openInfoWindow<?php echo $gmaps['personid']?>(marker) {
				var markerLatLng = marker.getPosition();
				infoWindow<?php echo $gmaps['personid']?>.setContent([
					'<b>Cliente: <?php echo $gmaps['customer']?></b><br>',
					'Empresa :<br>',
					'<b><?php echo $gmaps['company_name']?></b><br>',
					'Deuda :<br> ',
					'<b><?php echo to_currency($gmaps['balance']) ;?></b><br>',
					'Tipo :<br> ',
					'<b><?php echo $tipo ;?></b>'
				].join(''));
				infoWindow<?php echo $gmaps['personid']?>.open(map, marker);
			}
			
		<?php
			}
		} ?>
 
   }
  
</script>
<div id="content-header">
	<h1 > <i class="fa fa-bar-chart"> </i><?php echo lang('reports_reports'); ?> - <?php echo $title ." - ".$location_title; ?> 	</h1>
</div>

<div id="breadcrumb" class="hidden-print">
	<?php echo create_breadcrumb(); ?>
</div>
<div class="clear"></div>
	<div class="row">
		<div class="col-md-12">
			<div class="widget-box">
				<div class="widget-title">
					<h5><?php echo $subtitle ?> Clientes en Total - <?php echo $location_title; ?></h5>
				</div>
				<div class="widget-content nopadding">
					<div id="gmaps_resultado">
                    
                 	</div>
				</div>
			</div>
		</div>
	</div>

<?php $this->load->view("partial/footer"); ?>
