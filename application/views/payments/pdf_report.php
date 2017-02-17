<html>
  <head>
    <title>Print Preview</title>
    <link rel="stylesheet" rev="stylesheet" href="<?php echo base_url(); ?>bootstrap3/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>font-awesome-4.3.0/css/font-awesome.min.css" />
    <style>
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
    <div>
      <table width="70%">
        <tr>
          <td align="right">
            <img id="img-pic" src="<?= (trim($this->config->item("logo")) !== "") ? site_url("/uploads/logo/" . $this->config->item('logo')) : site_url("/uploads/common/no_img.png"); ?>" style="height:70px" />
          </td>
          <td style="font-size:20px;padding-left:10px;" align="left">
            <?=ucwords($this->config->item('company'));?><br/>
            <?=ucwords($this->config->item('address'));?><br/>
            <?=$this->config->item('phone')." ".$this->config->item('rnc');?>
          </td>
        </tr>
      </table>

      <table width="100%" id="tabla1">
        <tr>
          <td style="font-size:15px">Fecha:</td>
          <td align="right"><?= $trans_date; ?></td>
        </tr>
        <tr>
          <td style="font-size:15px">Cliente:</td>
          <td align="right"><?= $client; ?></td>
        </tr>

        <tr> <td colspan="2" style="padding:-10px;"><hr></td></tr>

        <tr>
          <td style="font-size:15px">Préstamo N°:</td>
          <td align="right"><?= $loan_id; ?></td>
        </tr>
        <tr>
          <td style="font-size:16px">Monto del Préstamo:</td>
          <td align="right"><?= $loan; ?></td>
        </tr>
        <tr>
          <td style="font-size:16px">Cuota Número:</td>
          <td align="right"><?= $numero_cuota; ?></td>
        </tr>
        <tr>
          <td style="font-size:16px">Cuota:</td>
          <td align="right"><?= $paid; ?></td>
        </tr>
        <tr>
          <td style="font-size:16px">Multa:</td>
          <td align="right"><?= $multa; ?></td>
        </tr>
        <tr>
          <td style="font-size:16px">Pago Total:</td>
          <td align="right"><?= $pago_total; ?></td>
        </tr>
        <tr>
          <td style="font-size:16px">Son:</td>
          <td align="right" style="font-size:14px"><?= $literal; ?> Bolivianos.</td>
        </tr>
        <tr>
          <td align="center" style="font-size:10px;padding-top:50px;">
            ..........................................................
            <br/>
            Recibí conforme
          </td>
          <td align="center" style="font-size:10px;padding-top:50px;">
            ..........................................................
            <br/>
            Entregué conforme
          </td>
        </tr>
        <tr>
          <td style="font-size:10px;padding:10px;">Deuda Restante: <?= $balance; ?></td>
          <td style="font-size:10px;padding:10px;" align="right">Transacción No.: <?= $count; ?></td>
        </tr>
        <tr>
          <td colspan="2" align="center">
              <h4>¡Gracias por Preferirnos!</h4>
          </td>
        </tr>
      </table>
    </div>
  </body>
</html>
