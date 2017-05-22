<html>
  <head>
    <title>Print Preview</title>
    <link rel="stylesheet" rev="stylesheet" href="<?php echo base_url(); ?>bootstrap3/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>font-awesome-4.3.0/css/font-awesome.min.css" />
    <style>
      table#tabla1 td:nth-child(2),
      table#tabla1 td:nth-child(4) {
        width: 3em;
        text-align: center;
      }
      table#tabla1 td:nth-child(1) {
        white-space: nowrap;
      }
      ul.checkbox-grid li {
        display: block;
        float: left;
        width: 40%;
        text-decoration: none;
      }
      .loans_pdf_company_name, .loans_pdf_title {
        text-align: center;
      }
      .tabla1 {
        font-size:14px !important;
      }
    </style>
  </head>
  <body>
    <table width="70%">
      <tr>
        <td align="right">
          <img id="img-pic" src="<?= (trim($this->config->item("logo")) !== "") ? site_url("/uploads/logo/" . $this->config->item('logo')) : site_url("/uploads/common/no_img.png"); ?>" style="height:70px" />
        </td>
        <td style="font-size:10px;padding-left:10px;" align="left">
          <?=ucwords($this->config->item('company'));?><br/>
          <?=ucwords($this->config->item('address'));?><br/>
          <?=$this->config->item('phone')." ".$this->config->item('rnc');?>
        </td>
      </tr>
    </table>

    <table width="100%" id="tabla2">
      <tr> <td colspan="2" style="padding:-10px;"><hr></td></tr>

      <tr>
        <td style="font-size:15px">Desde:</td>
        <td align="right"><?= $desde; ?></td>
      </tr>
      <tr>
        <td style="font-size:15px">Hasta:</td>
        <td align="right"><?= $hasta; ?></td>
      </tr>
      <tr>
        <td style="font-size:15px">Cliente:</td>
        <td align="right"><?= empty($cliente)?'Todos':$cliente; ?></td>
      </tr>

      <tr> <td colspan="2" style="padding:-10px;"><hr></td></tr>
    </table>

    <div class="row table-body">
      <div class="col-md-12">
        <table id="resultados" class="table table-hover table-bordered" cellspacing="0" width="100%">
          <tr>
            <td style="text-align: center">Pagos</td>
            <td style="text-align: center" class="resultado"><?= $totales['pagos'] ?></td>
            <td style="text-align: center">Pagado</td>
            <td style="text-align: center" class="resultado"><?= $totales['pagado'] ?></td>
            <td style="text-align: center">Capital</td>
            <td style="text-align: center" class="resultado"><?= $totales['capital'] ?></td>
            <td style="text-align: center">Interés</td>
            <td style="text-align: center" class="resultado"><?= $totales['interes'] ?></td>
            <td style="text-align: center">Multas</td>
            <td style="text-align: center" class="resultado"><?= $totales['multa'] ?></td>
          </tr>
        </table>
      </div>
    </div>

    <div class="row table-body">
      <div class="col-md-12">
        <table id="tabla1" class="table table-hover table-bordered" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th style="text-align: center"><?= $this->lang->line('loans_customer') ?></th>
              <th style="text-align: center"><?= 'Préstamo N°' ?></th>
              <th style="text-align: center"><?= 'Saldo' ?></th>
              <th style="text-align: center"><?= 'Cuota N°' ?></th>
              <th style="text-align: center"><?= $this->lang->line('payments_amount') ?></th>
              <th style="text-align: center"><?= 'Capital' ?></th>
              <th style="text-align: center"><?= 'Interés' ?></th>
              <th style="text-align: center"><?= 'Multa' ?></th>
              <th style="text-align: center"><?= 'Fecha de Pago' ?></th>
            </tr>
          </thead>
          <tbody>
          <?php
          foreach($data as $line) {
            echo '<tr>';
            foreach($line as $campo) {
              echo '<td>'.$campo.'</td>';
            }
            echo '</tr>';
          }
          ?>
          </tbody>
        </table>
      </div>
    </div>

  </body>
</html>
