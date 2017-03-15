<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_photo') . ':', 'photo_url'); ?>
  <div class='form_field'>
    <img id="img-pic" src="<?= (trim($person_info->photo_url) !== '') ? site_url('/uploads/profile-' . $person_info->person_id . '/' . $person_info->photo_url) : site_url('/uploads/common/images.jpg'); ?>" style="height:99px" />
    <div id="filelist"></div>
    <div id="progress" class="overlay"></div>

    <div class="progress progress-task" style="height: 4px; width: 15%; margin-bottom: 2px; display: none">
      <div style="width: 0%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-info">
      </div>                                    
    </div>

    <div id="container">
      <a id="pickfiles" href="javascript:;" class="btn btn-default" data-person-id="<?= $person_info->person_id; ?>"><?=$this->lang->line("common_browse");?></a> 
    </div>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_first_name') . ':', 'first_name', array('class' => 'required')); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'first_name',
            'id' => 'first_name',
            'value' => $person_info->first_name,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_last_name') . ':', 'last_name', array('class' => 'required')); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'last_name',
            'id' => 'last_name',
            'value' => $person_info->last_name,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_email') . ':', 'email'); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'email',
            'id' => 'email',
            'value' => $person_info->email,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_phone_number') . ':', 'phone_number'); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'phone_number',
            'id' => 'phone_number',
            'value' => $person_info->phone_number,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_address_1') . ':', 'address_1'); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'address_1',
            'id' => 'address_1',
            'value' => $person_info->address_1,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_address_2') . ':', 'address_2'); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'address_2',
            'id' => 'address_2',
            'value' => $person_info->address_2,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_city') . ':', 'city'); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'city',
            'id' => 'city',
            'value' => $person_info->city,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_state') . ':', 'state'); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'state',
            'id' => 'state',
            'value' => $person_info->state,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_zip') . ':', 'zip'); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'zip',
            'id' => 'zip',
            'value' => $person_info->zip,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_country') . ':', 'country'); ?>
  <div class='form_field'>
    <?php
    echo form_input(
          array(
            'name' => 'country',
            'id' => 'country',
            'value' => $person_info->country,
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>

<div class="field_row clearfix">  
  <?php echo form_label($this->lang->line('common_comments') . ':', 'comments'); ?>
  <div class='form_field'>
    <?php
    echo form_textarea(
          array(
            'name' => 'comments',
            'id' => 'comments',
            'value' => $person_info->comments,
            'rows' => '5',
            'cols' => '17',
            'class' => 'form-control'
          )
    );
    ?>
  </div>
</div>
