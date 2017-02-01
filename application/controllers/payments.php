<?php

require_once ("secure_area.php");
require_once ("interfaces/idata_controller.php");

class Payments extends Secure_area implements iData_controller {

    function __construct()
    {
        parent::__construct('payments');
    }

    function index()
    {
        $data['controller_name'] = strtolower(get_class());
        $data['form_width'] = $this->get_form_width();
        $this->load->view('payments/manage', $data);
    }

    function search()
    {
        
    }

    /*
      Gives search suggestions based on what is being searched for
     */

    function suggest()
    {
        
    }

    function get_row()
    {
        
    }

    function view($payment_id = -1) {
      $data['multa_por_dia'] = $this->Appconfig->get('multa_por_dia');
      $data['payment_info'] = $this->Payment->get_info($payment_id);
      $data['date_paid'] = 0;
      $data['loans'] = $this->_get_loans_aux($data['payment_info']->customer_id);

      $this->load->view("payments/form", $data);
    }

    function printIt($payment_id = -1)
    {
        $payment = $this->Payment->get_info($payment_id);
        $loan = $this->Loan->get_info($payment->loan_id);
        $loan_type = $this->Loan_type->get_info($loan->loan_type_id);
        $person = $this->Person->get_info($payment->teller_id);
        $customer = $this->Person->get_info($payment->customer_id);


        // pdf viewer 
        $data['count'] = $payment->loan_payment_id;
        $data['client'] = ucwords($customer->first_name." ".$customer->last_name);
        $data['account'] = $loan->account;
        $data['loan'] = to_currency($loan->loan_amount);
        $data['balance'] = to_currency($loan->loan_balance);
        $data['paid'] = to_currency($payment->paid_amount);
//        $data['multa'] = to_currency($payment->multa);
//        $data['pago_total'] = to_currency(($payment->multa)+ ($payment->paid_amount));
        $data['multa'] = to_currency($payment->multa);
        $data['pago_total'] = to_currency(($payment->multa)+ ($payment->paid_amount));
        $data['trans_date'] = date("d/m/Y", $payment->date_paid);
        $data['teller'] = $person->first_name . " " . $person->last_name;

        $filename = "payments_".date("ymdhis");
        // As PDF creation takes a bit of memory, we're saving the created file in /downloads/reports/
        $pdfFilePath = FCPATH . "/downloads/reports/$filename.pdf";

        ini_set('memory_limit', '32M'); // boost the memory limit if it's low <img src="https://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
        $html = $this->load->view('payments/pdf_report', $data, true); // render the view into HTML

        $this->load->library('pdf');
    
        $params = '"en-GB-x","Letter","","",10,10,10,10,6,3';
    
        $pdf = $this->pdf->load($params);
    
        $pdf->SetFooter($_SERVER['HTTP_HOST'] . '|{PAGENO}|' . date(DATE_RFC822)); // Add a footer for good measure <img src="https://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
        $pdf->WriteHTML($html); // write the HTML into the PDF
        $pdf->Output($pdfFilePath, 'F'); // save to file because we can
        // end of pdf viewer


        $data['pdf_file'] = "/loans/downloads/reports/$filename.pdf";


        $this->load->view("payments/print", $data);
    }

    function save($payment_id = -1) {
      $payment_data = array(
        'account' => $this->input->post('account'),
        'loan_id' => $this->input->post('loan_id'),
        'customer_id' => $this->input->post('customer'),
        'paid_amount' => $this->input->post('paid_amount'),
        'balance_amount' => $this->input->post('balance_amount'),
        'date_paid' => strtotime($this->input->post('date_paid')),
        'remarks' => $this->input->post('remarks'),
        'teller_id' => $this->input->post('teller'),
        'modified_by' => $this->input->post('modified_by'),
        'multa' => $this->input->post('multa')
      );

      if ($this->input->post("loan_payment_id") > 0) {
        $payment_data['loan_payment_id'] = $this->input->post('loan_payment_id');
      }

      // transactional to make sure that everything is working well
      $this->db->trans_start();
    
      if ($this->Payment->save($payment_data, $payment_id)) {
        //New Payment
        if ($payment_id == -1) {
          // deduct the loan amount            
          $this->Loan->update_balance($payment_data['paid_amount'], 
                                      $payment_data['loan_id'], 
                                      $payment_data['date_paid']);
          echo json_encode(array(
            'success' => true, 
            'message' => $this->lang->line('loans_successful_adding').' '.$payment_data['loan_payment_id'], 
            'loan_payment_id' => $payment_data['loan_payment_id']
          ));
          $payment_id = $payment_data['loan_payment_id'];
        }
        else { //previous payment
          $update_amount = $payment_data['paid_amount'] - $this->input->post("original_pay_amount");
          // deduct the loan amount            
          $this->Loan->update_balance($update_amount, $payment_data['loan_id'],$payment_data['date_paid']);
          echo json_encode(array(
            'success' => true,
            'message' => $this->lang->line('loans_successful_updating').' '.$payment_data['loan_payment_id'], 
            'loan_payment_id' => $payment_id));
        }
      }
      else {//failure
        echo json_encode(array(
          'success' => false, 
          'message' => $this->lang->line('loans_error_adding_updating').' '.$payment_data['loan_payment_id'], 
          'loan_payment_id' => -1
        ));
      }
      $this->db->trans_complete();
    }

    function delete()
    {
        $payments_to_delete = $this->input->post('ids');

        if ($this->Payment->delete_list($payments_to_delete))
        {
            echo json_encode(array('success' => true, 'message' => $this->lang->line('loans_successful_deleted') . ' ' .
                count($payments_to_delete) . ' ' . $this->lang->line('payments_one_or_multiple')));
        }
        else
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('payments_cannot_be_deleted')));
        }
    }

    /*
      get the width for the add/edit form
     */

    function get_form_width()
    {
        return 360;
    }

    function data()
    {
//        $index = isset($_REQUEST['order'][0]['column']) ? $_REQUEST['order'][0]['column'] : 1;
        $index = isset($_GET['order'][0]['column']) ? $_GET['order'][0]['column'] : 1;
        $dir = isset($_GET['order'][0]['dir']) ? $_GET['order'][0]['dir'] : "asc";
        $order = array("index" => $index, "direction" => $dir);
        $length = isset($_GET['length'])?$_GET['length']:50;
        $start = isset($_GET['start'])?$_GET['start']:0;
        $key = isset($_GET['search']['value'])?$_GET['search']['value']:"";

        $payments = $this->Payment->get_all($length, $start, $key, $order);

        $format_result = array();

        foreach ($payments->result() as $payment)
        {
            $format_result[] = array(
                "<input type='checkbox' name='chk[]' id='payment_$payment->loan_payment_id' value='" . $payment->loan_payment_id . "'/>",
                $payment->loan_payment_id,
                ucwords($payment->customer_name),
                $payment->loan_type . " (" . to_currency($payment->loan_amount) . ")",
                to_currency($payment->balance_amount),
                to_currency($payment->paid_amount),
                date("d/m/Y", $payment->date_paid),
                ucwords($payment->teller_name),
                anchor('payments/view/' . $payment->loan_payment_id, $this->lang->line('common_view'), array('class' => 'modal_link btn btn-success', 'data-toggle' => 'modal', 'data-target' => '#payment_modal', "title" => $this->lang->line('payments_update'))) . " " .
                anchor('payments/printIt/' . $payment->loan_payment_id, $this->lang->line('common_print'), array('class' => 'modal_link btn btn-default', 'data-toggle' => 'modal', 'data-target' => '#print_modal', "title" => $this->lang->line('payments_print')))
            );
        }

        $data = array(
            "recordsTotal" => $this->Payment->count_all(),
            "recordsFiltered" => $this->Payment->count_all(),
            "data" => $format_result
        );

        echo json_encode($data);
        exit;
    }

    private function _get_loans_aux($customer_id) {
      $loans = $this->Payment->get_loans($customer_id);
      $fecha_pago = time();
      $data['date_paid'] = 0;

      foreach ($loans as $loan) {
      
        $loan_type_info = $this->Loan_type->get_info($loan->loan_type_id);

        $loan->numero_cuota = $this->Payment->count_payments($loan->loan_id) + 1;
        $loan->first_payment = $this->Payment->first_payment($loan->loan_id);
        $factor = 1;

        switch ($loan_type_info->payment_schedule) {
          default:
          case "monthly":
            $factor = 1;
            break;
          case "bimonthly":
            $factor = 2;
            break;
          case "quarterly":
            $factor = 3;
            break;  
          case "biannual":
            $factor = 6;
            break;   
        }

        if ($loan->numero_cuota > 1) {
          $factor *= $loan->numero_cuota;
          $fecha_pago_teorica = strtotime("+$factor month", $loan->first_payment);
        }
        else {
          $fecha_pago_teorica = strtotime('now');
        }

        $fecha_cobro = $loan->loan_payment_date;    //FECHA Q SE DEBE COBRAR 
        $ultima_fecha_pago = $loan->loan_pago;
        $interes = $loan_type_info->percent_charge1; 

        $interes_actual = 0;
        
        $loan->multa = $loan_type_info->percent_charge2;
        $loan->fecha_pago_teorica = $fecha_pago_teorica;
        $loan->fecha_pago = date('d-m-Y', $ultima_fecha_pago);
        $loan->loan_amount = to_currency($loan->loan_amount);
        $loan->loan_balance = to_currency($loan->loan_balance);
        $loan->interes_actual = to_currency($interes_actual);
        $loan->interes = $loan_type_info->percent_charge1;
        $loan->text = $loan->loan_type . " (" . $loan->loan_amount . ' - ' .
                       date("d/m/Y", $loan->loan_applied_date) .
                        ") - Saldo: " . $loan->loan_balance;

      }
      return $loans;
    }

    function get_loans($customer_id) {
      $loans = $this->_get_loans_aux($customer_id);
      echo json_encode($loans);
      exit;
    }

    function get_customer($customer_id)
    {
        $customer = $this->Customer->get_info($customer_id);
        $suggestion['data'] = $customer->person_id;
        $suggestion['value'] = $customer->first_name . " " . $customer->last_name;

        echo json_encode($suggestion);
        exit;
    }

}

?>
