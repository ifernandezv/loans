
<?php $this->load->view("partial/header"); ?>

<header>
    <div class="col-lg-10 col-lg-offset-1">
        <?php echo anchor("home/logout", $this->lang->line("common_logout"), array("class" => "btn btn-danger pull-right", 'style' => 'margin-right: 10px', "id" => "logout_button")); ?>
    </div>
</header>

<div class="section">
    <div class="col-lg-10 col-lg-offset-1">
        <h3 class="admin-title"><?php echo $this->lang->line('common_welcome_message'); ?></h3>


        <div style="clear: both"></div>
        <div class="container-fluid">
            <div class="row">

                <?php
                foreach ($allowed_modules->result() as $module)
                {
                    //if (sizeof(explode('_', $module->module_id)) == 1)
                    //{
                    ?>
                <div class="col-lg-3 col-md-4 col-sm-4 admin-menu-item" style="height: 200px">
                        <div class="col-lg-8 col-lg-offset-2 col-md-12 col-sm-12">
                            <?php if ($module->module_id === "config") : ?>
                                <a href="<?php echo site_url("$module->module_id"); ?>" data-toggle="modal" data-target="#config_modal">
                                    <?= $module->icons; ?>
                                </a>
                                <br/>
                                <a class="admin-menu-link" href="<?php echo site_url("$module->module_id"); ?>" data-toggle="modal" data-target="#config_modal">
                                    <?php echo $this->lang->line("module_" . $module->module_id) ?>
                                </a>
                                <br/>
                            <?php else: ?>
                                <a href="<?php echo site_url("$module->module_id"); ?>">
                                    <?= $module->icons; ?>
                                </a>
                                <br/>
                                <a class="admin-menu-link" href="<?php echo site_url("$module->module_id"); ?>">
                                    <?php echo $this->lang->line("module_" . $module->module_id) ?>
                                </a>
                                <br/>
                            <?php endif; ?>

                            <?php echo $this->lang->line('module_' . $module->module_id . '_desc'); ?>
                        </div>
                    </div>

                    <?php
                    //}
                }
                ?>


            </div>

        </div>



        <div id="home_module_list">

        </div>

        <!-- Modal -->
        <div class="modal fade" id="config_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

        <div id="feedback_bar"></div>




    </div>    
</div><!--end section-->
<?php $this->load->view("partial/footer"); ?>
