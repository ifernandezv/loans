<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <base href="<?php echo base_url(); ?>" />
        <title><?php echo $this->config->item('company') . ' -- ' . $this->lang->line('common_powered_by'); ?></title>
        <link rel="stylesheet" rev="stylesheet" href="<?php echo base_url(); ?>css/app.css" />
        <link rel="stylesheet" rev="stylesheet" href="<?php echo base_url(); ?>css/menu.css" />
        <link rel="stylesheet" rev="stylesheet" href="<?php echo base_url(); ?>bootstrap3/css/bootstrap.css" />

        <script>BASE_URL = '<?php echo site_url(); ?>';</script>

        <script src="<?php echo base_url(); ?>js/jquery.min.js"></script>
        <script src="<?php echo base_url(); ?>bootstrap3/js/bootstrap.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.color.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.metadata.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.form.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.tablesorter.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.ajax_queue.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.bgiframe.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.autocomplete/dist/jquery.autocomplete.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.validate.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/common.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/manage_tables.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/swfobject.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.datatables/jquery.datatables.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.datatables/plugins/fnReloadAjax.js" type="text/javascript" language="javascript" charset="UTF-8"></script>
        <script src="<?php echo base_url(); ?>js/jquery.datatables/bootstrap-adapter/js/datatables.js" type="text/javascript" language="javascript" charset="UTF-8"></script>

        <script src="<?php echo base_url(); ?>js/plupload/plupload.full.min.js" type="text/javascript" language="javascript" charset="UTF-8"></script>

        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>js/jquery.datatables/bootstrap-adapter/css/datatables.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>js/jquery.niftymodals/css/component.custom.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>font-awesome-4.3.0/css/font-awesome.min.css" />

        <script src="<?php echo base_url(); ?>js/moment-with-locales.js"></script>
        <script src="<?php echo base_url(); ?>js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <link href="<?php echo base_url(); ?>css/bootstrap-datetimepicker.min.css" type="text/css" media="screen, projection" rel="stylesheet" />

        <style type="text/css">
            html {
                overflow: auto;
            }
        </style>

    </head>
    <body>

        <input type="hidden" id="token_hash" value="<?php echo $this->security->get_csrf_hash(); ?>" />
        <input type="hidden" id="site_url" value="<?php echo site_url() ?>" />

        <div id="content_area_wrapper">
            <div id="content_area">

                <?php if (current_url() != site_url("home")): ?>
                    <!-- Fixed navbar -->
                    <nav class="navbar navbar-default navbar-fixed-top">
                        <div class="container">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#"><?= $this->config->item("company"); ?></a>
                            </div>
                            <div id="navbar" class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="#"><?=$this->lang->line("common_home");?></a></li>
                                    <li><a href="javascript:void(0)"><?=$this->lang->line("common_help");?></a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><?=$this->lang->line("common_modules");?> <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <?php $i = 0; ?>
                                            <?php foreach ($allowed_modules->result() as $module) : ?>
                                                <?php if ((count($allowed_modules->result()) - 1) == $i) : ?>
                                                    <li class="divider"></li>
                                                <?php endif; ?>
                                                <?php if ($module->module_id === "config"): ?>
                                                    <li><a href="<?php echo site_url("$module->module_id"); ?>" data-toggle="modal" data-target="#config_modal" title="<?php echo $this->lang->line('module_' . $module->module_id . '_desc'); ?>"><span style="width: 30px; display: inline-block"><?= str_replace("font-size: 50px", "font-size: 20px", $module->icons); ?></span> &nbsp;<?php echo $this->lang->line("module_" . $module->module_id) ?></a></li>
                                                <?php else: ?>
                                                    <li><a href="<?php echo site_url("$module->module_id"); ?>" title="<?php echo $this->lang->line('module_' . $module->module_id . '_desc'); ?>"><span style="width: 30px; display: inline-block"><?= str_replace("font-size: 50px", "font-size: 20px", $module->icons); ?></span> &nbsp;<?php echo $this->lang->line("module_" . $module->module_id) ?></a></li>
                                                <?php endif; ?>
                                                <?php $i++; ?>
                                            <?php endforeach; ?>
                                        </ul>
                                    </li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="<?= site_url("home/logout"); ?>"> <?php echo $this->lang->line("common_logout");?><span class="sr-only">(current)</span></a></li>
                                </ul>
                            </div><!--/.nav-collapse -->
                        </div>
                    </nav>

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


                    <div style="clear: both; margin-bottom: 50px"></div>
                <?php endif; ?>
