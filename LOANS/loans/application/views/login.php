<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" rev="stylesheet" href="<?php echo base_url(); ?>bootstrap3/css/bootstrap.css" />
        <link rel="stylesheet" rev="stylesheet" href="<?php echo base_url(); ?>css/signin.css" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title><?php echo $this->lang->line('login_login'); ?></title>
        <script src="<?php echo base_url(); ?>js/jquery-1.2.6.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script type="text/javascript">
            $(document).ready(function ()
            {
                $("#login_form input:first").focus();
            });
        </script>
    </head>
    <body>
        <div class="container">
            <?php echo form_open('login', array('class' => 'form-signin')) ?>
            <?php echo validation_errors(); ?>
            <h2 class="form-signin-heading">SISTEMA DE GESTION DE PRESTAMOS<?php echo $this->config->item('application_version'); ?></h2>
            <?php echo $this->lang->line('login_welcome_message'); ?>
            <label for="inputEmail" class="sr-only"><?php echo $this->lang->line('login_username'); ?>:</label>
            <?php
            echo form_input(
                    array(
                        'name' => 'username',
                        'size' => '20',
                        'class' => 'form-control',
                        'value' => ''
                    )
            );
            ?>
            <label for="inputPassword" class="sr-only"><?php echo $this->lang->line('login_password'); ?>:</label>
            <?php
            echo form_password(
                    array(
                        'name' => 'password',
                        'size' => '20',
                        'class' => 'form-control',
                        'value' => ''
                    )
            );
            ?>
            <div class="checkbox">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <?php echo form_submit('loginButton', 'Login', 'class="btn btn-lg btn-primary btn-block"'); ?>
            <?php echo form_close(); ?>
        </div> <!-- /container -->
    </body>
</html>
