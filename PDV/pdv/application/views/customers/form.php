<?php $this->load->view("partial/header"); ?>
<div id="content-header" class="hidden-print">
	<h1 > <i class="fa fa-pencil"></i>  <?php  if(!$person_info->person_id) { echo lang($controller_name.'_new'); } else { echo lang($controller_name.'_update'); }    ?>	</h1>
</div>

<div id="breadcrumb" class="hidden-print">
	<?php echo create_breadcrumb(); ?>
</div>
<div class="clear"></div>
<div class="row" id="form">
	<div class="col-md-12">
		<?php echo lang('common_fields_required_message'); ?>
		<div class="widget-box">
			<div class="widget-title">
				<span class="icon">
					<i class="fa fa-align-justify"></i>									
				</span>
				<h5><?php echo lang("customers_basic_information"); ?></h5>
			</div>
			<div class="widget-content ">
				<?php echo form_open_multipart('customers/save/'.$person_info->person_id,array('id'=>'customer_form','class'=>'form-horizontal')); 	?>
				<?php $this->load->view("people/form_basic_info"); ?>
				
				
<div class="form-group">	
					<?php echo form_label(lang('customers_gmaps'), 'gmaps',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
<style type="text/css" >
      #map_canvas {
           width:80%;
           height:400px;
		   margin:0 auto;
     }
</style>					
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDpBrwfPXuOM5feoW74ha3OaklCT_tLPxE"></script>
<?php if($person_info->long == NULL) {?>
<script type="text/javascript">
var map = null;
var infoWindow = null;
var lat1 = null;
var lng1 = null;
function openInfoWindow(marker) {
    var markerLatLng = marker.getPosition();
    infoWindow.setContent([
        'La posici&oacute;n del marcador es:<br> Lat. :',
        markerLatLng.lat(),
        '<br> Long. :',
        markerLatLng.lng(),
        '<br>Arrastrame para actualizar'
    ].join(''));
    infoWindow.open(map, marker);
}

function updateInfo (marker) {
	var markerLatLng = marker.getPosition();
	 document.getElementById('lat').setAttribute("value", markerLatLng.lat());
	 document.getElementById('long').setAttribute("value",markerLatLng.lng()); 
}

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}	

function initialize() {
	navigator.geolocation.getCurrentPosition(function(position) { 
	 	lat1 = position.coords.latitude;
		lng1 = position.coords.longitude;
    var myLatlng = new google.maps.LatLng(lat1,lng1);
    var myOptions = {
      zoom: 16,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map($('#map_canvas').get(0), myOptions);
    infoWindow = new google.maps.InfoWindow();
	
    var marker = new google.maps.Marker({
        position: myLatlng,
		animation: google.maps.Animation.DROP,
		
<?php
if($this->config->item('customers_store_accounts') && $this->Employee->has_module_action_permission('customers', 'edit_store_account_balance', $this->Employee->get_logged_in_employee_info()->person_id)) 
{?>   
		draggable: true,
<?php } else {  ?>
        draggable: false,
<?php } ?>
       
		
        map: map,
        title:'Ejemplo marcador arrastrable'
    });
	google.maps.event.addListener(marker, 'dragend', function(){ openInfoWindow(marker)});
	google.maps.event.addListener(marker, 'click', function(){ openInfoWindow(marker)});
	google.maps.event.addListener(marker, 'dragend', function(){ updateInfo(marker)});
	updateInfo(marker);
 });	
} 
$(document).ready(function() {
    initialize();
});
</script>
<?php } else {?>
<script type="text/javascript">
var map = null;
var infoWindow = null;
var lat1 = null;
var lng1 = null;
function openInfoWindow(marker) {
    var markerLatLng = marker.getPosition();
    infoWindow.setContent([
        'La posici&oacute;n del marcador es:<br> Lat. :',
        markerLatLng.lat(),
        '<br> Long. :',
        markerLatLng.lng(),
        '<br>Arrastrame para actualizar'
    ].join(''));
    infoWindow.open(map, marker);
}

function updateInfo (marker) {
	var markerLatLng = marker.getPosition();
	 document.getElementById('lat').setAttribute("value", markerLatLng.lat());
	 document.getElementById('long').setAttribute("value",markerLatLng.lng()); 
	// ddversdms();
}

function ddversdms() {
    var lat, lng,lat1, lng1, latdeg, latmin, latsec, lngdeg, lngmin, lngsec,latnordsud,lngestouest,gmaps;
	lat1=parseFloat(document.getElementById("lat").value) || 0;	
    lng1=parseFloat(document.getElementById("long").value) || 0;
	lat=parseFloat(document.getElementById("lat").value) || 0;	
    lng=parseFloat(document.getElementById("long").value) || 0;
	if (lat>=0) document.getElementById("nord").checked=true, latnordsud='N' ;
    if (lat<0) document.getElementById("sud").checked=true, latnordsud='S' ;
    if (lng>=0) document.getElementById("est").checked=true, lngestouest='E';
    if (lng<0) document.getElementById("ouest").checked=true; lngestouest='W';
    lat=Math.abs(lat);	
    lng=Math.abs(lng);
    latdeg=Math.floor(lat);
    latmin=Math.floor((lat-latdeg)*60);
    latsec=Math.round((lat-latdeg-latmin/60)*1000*3600)/1000;
    lngdeg=Math.floor(lng);
    lngmin=Math.floor((lng-lngdeg)*60);
    lngsec=Math.floor((lng-lngdeg-lngmin/60)*1000*3600)/1000;
    document.getElementById("latitude_degres").value=latdeg;
    document.getElementById("latitude_minutes").value=latmin;
    document.getElementById("latitude_secondes").value=latsec;
    document.getElementById("longitude_degres").value=lngdeg;
    document.getElementById("longitude_minutes").value=lngmin;
    document.getElementById("longitude_secondes").value=lngsec;
	gmaps =latdeg+'\u00B0'+latmin+'\''+latsec+'\"'+latnordsud+'\+'+lngdeg+'\u00B0'+lngmin+'\''+lngsec+'\"'+lngestouest;
	
	var linkgmaps = $("<img>", {
							id: "linkgm",
							css: { "padding": "2px", "cursor": "pointer" },
							title: 'Ver la ubucaci\u00f3n en Google Maps',
							alt: "GMaps",
							src: '<?php  echo str_replace('/index.php', '', site_url("img/icons/32/web.png"));?> ',
							click: function (e) {
								window.open('https://www.google.com/maps/place/'+gmaps+'/@'+lat1+','+lng1,'_blank');
							}
	});
	$("#linkgmaps").html(linkgmaps);
	
}

function initialize() {
	lat1 = <?php echo $person_info->lat; ?>;
	lng1 = <?php echo $person_info->long; ?>;
    var myLatlng = new google.maps.LatLng(lat1,lng1);
    var myOptions = {
      zoom: 16,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
	}
    map = new google.maps.Map($('#map_canvas').get(0), myOptions);
    infoWindow = new google.maps.InfoWindow();
	ddversdms();
    var marker = new google.maps.Marker({
        position: myLatlng,
		animation: google.maps.Animation.DROP,
<?php
if($this->config->item('customers_store_accounts') && $this->Employee->has_module_action_permission('customers', 'edit_store_account_balance', $this->Employee->get_logged_in_employee_info()->person_id)) 
{?>   
		draggable: true,
<?php } else {  ?>
        draggable: false,
<?php } ?>
       
	    map: map,
        title:'Ejemplo marcador arrastrable'
    });
	google.maps.event.addListener(marker, 'dragend', function(){ openInfoWindow(marker); });
	google.maps.event.addListener(marker, 'click', function(){ openInfoWindow(marker); });
	google.maps.event.addListener(marker, 'dragend', function(){ updateInfo(marker)});
	google.maps.event.addListener(marker, 'click', function(){ updateInfo(marker)});
	google.maps.event.addListener(marker, 'dragend', function(){ ddversdms()});
	google.maps.event.addListener(marker, 'click', function(){ ddversdms()});
		
} 

$(document).ready(function() {
    initialize();
});
</script>

<?php }?>
       <div id="map_canvas"></div>   
  
						<div>
						<?php echo form_input(array(
							'name'=>'lat',
							'id'=>'lat',
							'class'=>'lat',
							'type'=>'hidden',
							'value'=>$person_info->lat)
							);?>
						</div>
                        <div>
						<?php echo form_input(array(
							'name'=>'long',
							'id'=>'long',
							'class'=>'long',
							'type'=>'hidden',
							'value'=>$person_info->long)
							);?>
						</div>
                        
 <div>
						<?php echo form_radio(array(
							'name'=>'latnordsud',
							'id'=>'nord',
							'style'=>'display:none',
							'class'=>'latnordsud')
							);?>
					
						<?php echo form_radio(array(
							'name'=>'latnordsud',
							'id'=>'sud',
							'style'=>'display:none',
							'class'=>'sud')
							);?>

						<?php echo form_radio(array(
							'name'=>'lngestouest',
							'id'=>'est',
							'style'=>'display:none',
							'class'=>'longitude_secondes')
							);?>
                       <?php echo form_radio(array(
							'name'=>'lngestouest',
							'id'=>'ouest',
							'style'=>'display:none',
							'class'=>'longitude_secondes')
							);?>
</div>   
                        
                        
                     <div>
						<?php echo form_input(array(
							'name'=>'latitude_degres',
							'id'=>'latitude_degres',
							'type'=>'hidden',
							'class'=>'latitude_degres')
							);?>
					
						<?php echo form_input(array(
							'name'=>'latitude_minutes',
							'id'=>'latitude_minutes',
							'type'=>'hidden',
							'class'=>'latitude_minutes')
							);?>

						<?php echo form_input(array(
							'name'=>'latitude_secondes',
							'id'=>'latitude_secondes',
							'type'=>'hidden',
							'class'=>'latitude_secondes')
							);?>
						</div>
                        
                        <div>
						<?php echo form_input(array(
							'name'=>'longitude_degres',
							'id'=>'longitude_degres',
							'type'=>'hidden',
							'class'=>'longitude_degres')
							);?>
					
						<?php echo form_input(array(
							'name'=>'longitude_minutes',
							'id'=>'longitude_minutes',
							'type'=>'hidden',
							'class'=>'longitude_minutes')
							);?>

						<?php echo form_input(array(
							'name'=>'longitude_secondes',
							'id'=>'longitude_secondes',
							'type'=>'hidden',
							'class'=>'longitude_secondes')
							);?>
						</div>  
   <div id="linkgmaps" style="margin:0 auto"></div>  

                        
					</div>        


						<div class="form-group">	
							<?php echo form_label(lang('customers_location_id').':', 'tier_type',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
							<div class="col-sm-9 col-md-9 col-lg-10">
                            <?php $location_id=$this->Employee->get_logged_in_employee_current_location_id(); ?>
                           		<?php echo form_dropdown('location_id', $locations, $person_info->location_id ? $person_info->location_id : $location_id);?>
							</div>
						</div>

<?php					
				if($this->config->item('customers_store_accounts') && $this->Employee->has_module_action_permission('customers', 'edit_store_account_balance', $this->Employee->get_logged_in_employee_info()->person_id)) 
				{
				?>

				<div class="form-group">	
					<?php echo form_label(lang('customers_store_account_balance').':', 'balance',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
					<div class="col-sm-9 col-md-9 col-lg-10">
						<?php echo form_input(array(
							'name'=>'balance',
							'id'=>'balance',
							'class'=>'balance',
							'value'=>$person_info->balance ? to_currency_no_money($person_info->balance) : '0.00')
							);?>
						</div>
					</div>

				<div class="form-group">	
					<?php echo form_label(lang('customers_credit_limit').':', 'credit_limit',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
					<div class="col-sm-9 col-md-9 col-lg-10">
						<?php echo form_input(array(
							'name'=>'credit_limit',
							'id'=>'credit_limit',
							'class'=>'credit_limit',
							'value'=>$person_info->credit_limit ? to_currency_no_money($person_info->credit_limit) : '')
							);?>
						</div>
					</div>
				<?php
				}
				?>
                
<div class="form-group">	
					<?php echo form_label(lang('customers_type').':', 'type',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
					<div class="col-sm-9 col-md-9 col-lg-10">
                    
						<?php 
						$types = array();
						$types[1] = "Bueno";
						$types[0] = "Malo";
						echo form_dropdown('type', $types, $person_info->type ? $person_info->type : $person_info->type);?>
						</div>
					</div>
				<div class="form-group">	
					<?php echo form_label(lang('config_company').':', 'company_name',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
					<div class="col-sm-9 col-md-9 col-lg-10">
						<?php echo form_input(array(
							'name'=>'company_name',
							'id'=>'customer_company_name',
							'class'=>'company_names',
							'value'=>$person_info->company_name)
							);?>
						</div>
					</div>

					<div class="form-group">	
						<?php echo form_label(lang('customers_account_number').':', 'account_number',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
						<div class="col-sm-9 col-md-9 col-lg-10">
							<?php echo form_input(array(
								'name'=>'account_number',
								'id'=>'account_number',
								'class'=>'company_names',
								'value'=>$person_info->account_number)
								);?>
							</div>
						</div>

						<div class="form-group">	
							<?php echo form_label(lang('customers_taxable').':', 'taxable',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
							<div class="col-sm-9 col-md-9 col-lg-10">
								<?php echo form_checkbox('taxable', '1', $person_info->taxable == '' ? TRUE : (boolean)$person_info->taxable,'id="noreset"');?>
							</div>
						</div>

						<?php if (!empty($tiers)) { ?>
						<div class="form-group">	
							<?php echo form_label(lang('customers_tier_type').':', 'tier_type',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
							<div class="col-sm-9 col-md-9 col-lg-10">
								<?php echo form_dropdown('tier_id', $tiers, $person_info->tier_id);?>
							</div>
						</div>
						<?php } ?>

						<?php if($person_info->cc_token && $person_info->cc_preview) { ?>
						<div class="control-group">	
							<?php echo form_label(lang('customers_delete_cc_info').':', 'delete_cc_info',array('class'=>'col-sm-3 col-md-3 col-lg-2 control-label ')); ?>
							<div class="col-sm-9 col-md-9 col-lg-10">
								<?php echo form_checkbox('delete_cc_info', '1');?>
							</div>
						</div>
						<?php } ?>

						<?php echo form_hidden('redirect_code', $redirect_code); ?>

						<div class="form-actions">
							<?php
							if ($redirect_code == 1)
							{
								echo form_button(array(
							    'name' => 'cancel',
							    'id' => 'cancel',
								 'class' => 'btn btn-danger',
							    'value' => 'true',
							    'content' => lang('common_cancel')
								));
							
							}
							else {
							if ($redirect_code == 3)
							{
								echo form_button(array(
							    'name' => 'cancel',
							    'id' => 'cancel',
								 'class' => 'btn btn-danger',
							    'value' => 'true',
							    'content' => lang('common_cancel')
								));	
								}
								}
							?>
							
							<?php
							echo form_submit(array(
								'name'=>'submitf',
								'id'=>'submitf',
								'value'=>lang('common_submit'),
								'class'=>' btn btn-primary')
							);
							?>
						</div>
						<?php echo form_close(); ?>
					</div>
				</div>
			</div>
		</div>
<script type='text/javascript'>
$('#image_id').imagePreview({ selector : '#avatar' }); // Custom preview container
//validation and submit handling
$(document).ready(function()
{						
$("#cancel").click(cancelCustomerAddingFromSale);
							setTimeout(function(){$(":input:visible:first","#customer_form").focus();},100);
							var submitting = false;
						
							$('#customer_form').validate({
								submitHandler:function(form)
								{
									$.post('<?php echo site_url("customers/check_duplicate");?>', {term: $('#first_name').val()+' '+$('#last_name').val()},function(data) {
										<?php if(!$person_info->person_id) { ?>
											if(data.duplicate)
											{

												if(confirm(<?php echo json_encode(lang('customers_duplicate_exists'));?>))
												{
													doCustomerSubmit(form);
												}
												else 
												{
													return false;
												}
											}
											<?php } else ?>
											{
												doCustomerSubmit(form);
											}} , "json")
									.error(function() { 
									});
									
								},
								rules: 
								{
									<?php if(!$person_info->person_id) { ?>
										account_number:
										{
											remote: 
											{ 
												url: "<?php echo site_url('customers/account_number_exists');?>", 
												type: "post"

											} 
										},
										<?php } ?>
										first_name: "required"
									},
									errorClass: "text-danger",
									errorElement: "span",
										highlight:function(element, errorClass, validClass) {
											$(element).parents('.form-group').removeClass('has-success').addClass('has-error');
										},
										unhighlight: function(element, errorClass, validClass) {
											$(element).parents('.form-group').removeClass('has-error').addClass('has-success');
										},
									messages: 
									{
										<?php if(!$person_info->person_id) { ?>
											account_number:
											{
												remote: <?php echo json_encode(lang('common_account_number_exists')); ?>
											},
											<?php } ?>
											first_name: <?php echo json_encode(lang('common_first_name_required')); ?>,
											last_name: <?php echo json_encode(lang('common_last_name_required')); ?>
										}
									});
});

var submitting = false;

function doCustomerSubmit(form)
{
	$("#form").mask(<?php echo json_encode(lang('common_wait')); ?>);
	if (submitting) return;
	submitting = true;

	$(form).ajaxSubmit({
		success:function(response)
		{
			$("#form").unmask();
			submitting = false;
			gritter(response.success ? <?php echo json_encode(lang('common_success')); ?> +' #' + response.person_id : <?php echo json_encode(lang('common_error')); ?> ,response.message,response.success ? 'gritter-item-success' : 'gritter-item-error',false,false);
			if(response.redirect_code==1 && response.success)
			{ 
				$.post('<?php echo site_url("sales/select_customer");?>', {customer: response.person_id}, function()
				{
					window.location.href = '<?php echo site_url('sales'); ?>'
				});
			}
			else if(response.redirect_code==2 && response.success)
			{
				window.location.href = '<?php echo site_url('customers'); ?>'
			}
			else
			{ 
				$.post('<?php echo site_url("sales_expenses/select_customer");?>', {customer: response.person_id}, function()
				{
					window.location.href = '<?php echo site_url('sales_expenses'); ?>'
				});
			}
		},
		<?php if(!$person_info->person_id) { ?>
			resetForm: true,
			<?php } ?>
			dataType:'json'
		});
}

function cancelCustomerAddingFromSale()
{
	if (confirm(<?php echo json_encode(lang('customers_are_you_sure_cancel')); ?>))
	{
		window.location = <?php echo json_encode(site_url('sales')); ?>;
	}
}
</script>
<?php $this->load->view("partial/footer"); ?>
