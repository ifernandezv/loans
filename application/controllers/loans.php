<?php

require_once ("secure_area.php");
require_once ("interfaces/idata_controller.php");

class Loans extends Secure_area implements iData_controller {

    function __construct()
    {
        parent::__construct('loans');
    }

    function index() {
      $data['controller_name'] = strtolower(get_class());
      $data['form_width'] = $this->get_form_width();

      $data['count_overdues'] = $this->_count_overdues();
      $data['customer_id'] = $this->input->post('customer_id');
      $data['customer_name'] = $this->input->post('customer_name');
      $data['sale_id'] = $this->input->post('sale_id');
      $data['sale_id_raw'] = $this->input->post('sale_id_raw');
      $data['sale_type'] = $this->input->post('sale_type');
      $data['loan_amount'] = $this->input->post('loan_amount');
      $data['loan_id'] = $this->Loan->find_sale($data['sale_id_raw']);

      $this->load->view('loans/manage', $data);
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

    function view($loan_id = -1)
    {
        $data['loan_info'] = $this->Loan->get_info($loan_id);
    
        $data['guarantee_info'] = $this->Guarantee->get_info($loan_id);
        $loan_types = $this->Loan_type->get_multiple_loan_types();

        $tmp = array("" => $this->lang->line("common_please_select"));
        foreach ($loan_types as $loan_type):
            $tmp[$loan_type->loan_type_id] = $loan_type->name;
        endforeach;
    
    $info_l = array();
    
    foreach ($loan_types as $loan_type):
      $info_l['loan_type_id']= $loan_type->loan_type_id;
        $info_l['term']= $loan_type->term;
      $info_l['tasa']= $loan_type->percent_charge1;
      $info_l['schedule']= $loan_type->payment_schedule;
        
    $info_loans[$loan_type->loan_type_id] = $info_l;
    
    endforeach;
    
        $data['loan_types'] = $tmp;
    
    $data['info_loan'] = $info_loans;

        $data['misc_fees'] = array(
            array("", "")
        );

        $misc_fees = json_decode($data['loan_info']->misc_fees, true);

        if (is_array($misc_fees))
        {
            $tmp = array();
            foreach ($misc_fees as $fee => $charge):
                $tmp[] = array($fee, $charge);
            endforeach;
            $data['misc_fees'] = $tmp;
        }

        $attachments = $this->Loan->get_attachments($loan_id);

        $file = array();
        foreach ($attachments as $attachment)
        {
            $dFile = $this->_get_formatted_file($attachment->attachment_id, $attachment->filename, $attachment->descriptions);
            $file[$dFile["id"]] = $dFile;
        }

        $data['attachments'] = $file;

        $loan_status = (isset($data['loan_info']->loan_status) && trim($data['loan_info']->loan_status) !== "") ? $this->lang->line("common_".strtolower($data['loan_info']->loan_status)) : $this->lang->line("common_pending");
        if ($data['loan_info']->loan_balance <= 0 && $loan_id > -1)
        {
            $loan_status = "paid";
        }
        $data['loan_status'] = $loan_status;

        $employees = $this->Employee->get_all()->result();
        $emps =array();
        foreach ($employees as $employee)
        {
            $emps[$employee->person_id] = $employee->first_name . " " . $employee->last_name;
        }

        $data['employees'] = $emps;

        $proof_ids = json_decode($data['guarantee_info']->proof, TRUE);
        $pimage_ids = json_decode($data['guarantee_info']->images, TRUE);

        $data["proofs"] = $this->_get_files($proof_ids, $file);
        $data["pimages"] = $this->_get_files($pimage_ids, $file);

        $this->load->view("loans/form", $data);
    }

    private function _get_files($ids, $file)
    {
        $tmp =array();
        if (is_array($ids))
        {
            foreach ($ids as $id):
                $tmp[] = $file[$id];
            endforeach;
        }

        return $tmp;
    }

    private function _get_formatted_file($id, $filename, $desc)
    {
        $words = array("doc", "docx", "odt");
        $xls = array("xls", "xlsx", "csv");
        $ext = explode(".", $filename)[1];

        if (in_array(strtolower($ext), $words))
        {
            $tmp['icon'] = "images/word-filetype.jpg";
            $tmp['filename'] = $filename;
            $tmp['id'] = $id;
            $tmp['descriptions'] = $desc;
        }
        else if (strtolower($ext) === "pdf")
        {
            $tmp['icon'] = "images/pdf-filetype.jpg";
            $tmp['filename'] = $filename;
            $tmp['id'] = $id;
            $tmp['descriptions'] = $desc;
        }
        else if (in_array(strtolower($ext), $xls))
        {
            $tmp['icon'] = "images/xls-filetype.jpg";
            $tmp['filename'] = $filename;
            $tmp['id'] = $id;
            $tmp['descriptions'] = $desc;
        }
        else
        {
            $tmp['icon'] = "images/image-filetype.jpg";
            $tmp['filename'] = $filename;
            $tmp['id'] = $id;
            $tmp['descriptions'] = $desc;
        }

        return $tmp;
    }

    function save($loan_id = -1)
    {

        $fees = $this->input->post("fees");
        $amounts = $this->input->post("amounts");

        $misc_fees = array();
        for ($i = 0; $i < count($fees); $i++):
            $misc_fees[$fees[$i]] = $amounts[$i];
        endfor;


        $loan_data = array(
            'account' => $this->input->post('account'),
            'description' => $this->input->post('description'),
            'loan_type_id' => $this->input->post('loan_type_id'),
            'loan_amount' => $this->input->post('amount'),
            'cuota' => $this->input->post('cuota'),
            'pdv_id' => $this->input->post('pdv_id'),
            'customer_id' => $this->input->post('customer'),
            'loan_applied_date' => strtotime($this->input->post('apply_date')),
      'loan_payment_date' => strtotime($this->input->post('payment_date')),   //CONTROLAR ACA SI HAY PAGOS ANTERIORES 
            'remarks' => $this->input->post('remarks'),
            'loan_agent_id' => $this->input->post('agent'),
            'loan_approved_by_id' => $this->input->post('approver'),
            'loan_status' => ($this->input->post('approver') > 0) ? "approved" : $this->input->post("status"),
            'misc_fees' => json_encode($misc_fees)
        );

        $guarantee_data = array(
            'loan_id' => $loan_id,
            'name' => $this->input->post("guarantee_type"),
            'type' => $this->input->post("guarantee_name"),
            'brand' => $this->input->post("guarantee_brand"),
            'make' => $this->input->post("guarantee_make"),
            'serial' => $this->input->post("guarantee_serial"),
            'proof' => json_encode($this->input->post("proofs")),
            'images' => json_encode($this->input->post("images")),
            'price' => $this->input->post("guarantee_price"),
            'observations' => $this->input->post("guarantee_observations")
        );

        if ($this->Loan->save($loan_data, $loan_id))
        {
            //New Loan
            if ($loan_id == -1)
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line('loans_successful_adding') . ' ' .
                    $loan_data['account'], 'loan_id' => $loan_data['loan_id']));
                $loan_id = $loan_data['loan_id'];
            }
            else //previous loan
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line('loans_successful_updating') . ' ' .
                    $loan_data['account'], 'loan_id' => $loan_id));
            }
            $this->Guarantee->save($guarantee_data, $loan_id);
        }
        else//failure
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('loans_error_adding_updating') . ' ' .
                $loan_data['account'], 'loan_id' => -1));
        }
    }

    function delete()
    {
        $loans_to_delete = $this->input->post('ids');

        if ($this->Loan->delete_list($loans_to_delete))
        {
            echo json_encode(array('success' => true, 'message' => $this->lang->line('loans_successful_deleted') . ' ' .
                count($loans_to_delete) . ' ' . $this->lang->line('loans_one_or_multiple')));
        }
        else
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('loans_cannot_be_deleted')));
        }
    }

    /*
      get the width for the add/edit form
     */

    function get_form_width()
    {
        return 360;
    }

    function data($status = "")
    {
        $order = array("index" => $_GET['order'][0]['column'], "direction" => $_GET['order'][0]['dir']);
        $loans = $this->Loan->get_all($_GET['length'], $_GET['start'], $_GET['search']['value'], $order, $status);

        $format_result = array();

        foreach ($loans->result() as $loan)
        {
            $loan_status = $loan->loan_status;
            if ($loan->loan_balance <= 0)
            {
                $loan_status = "Paid";
            }

            $format_result[] = array(
                "<input type='checkbox' name='chk[]' id='loan_$loan->loan_id' value='" . $loan->loan_id . "'/>",
                $loan->loan_id,
                $loan->loan_type,
                $loan->account,
                $loan->description,
                to_currency($loan->loan_amount),
                to_currency($loan->loan_balance),
        to_currency($loan->cuota),
                ucwords($loan->customer_name),
                ucwords($loan->agent_name),
                ucwords($loan->approver_name),
                date("d-m-Y", $loan->loan_applied_date),
                date("d-m-Y", $loan->loan_payment_date),
                $this->lang->line("common_" . strtolower($loan_status)),
                anchor('loans/view/' . $loan->loan_id, $this->lang->line('common_view'), array('class' => 'modal_link btn btn-success', 'data-toggle' => 'modal', 'data-target' => '#loan_modal', "title" => "Update Loan"))
            );
        }

        $data = array(
            "recordsTotal" => $this->Loan->count_all(),
            "recordsFiltered" => $this->Loan->count_all(),
            "data" => $format_result
        );

        echo json_encode($data);
        exit;
    }

    function overdues()
    {
        $order = array("index" => $_REQUEST['order'][0]['column'], "direction" => $_REQUEST['order'][0]['dir']);

        $loans = $this->Loan->get_all($_REQUEST['length'], $_REQUEST['start'], $_REQUEST['search']['value'], $order, "overdue");

        $format_result = array();

        foreach ($loans->result() as $loan)
        {
            $loan_status = $loan->loan_status;
            if ($loan->loan_balance <= 0)
            {
                $loan_status = "Paid";
            }

            $format_result[] = array(
                "<input type='checkbox' name='chk[]' id='loan_$loan->loan_id' value='" . $loan->loan_id . "'/>",
                $loan->loan_id,
                $loan->loan_type,
                $loan->account,
                $loan->description,
                to_currency($loan->loan_amount),
                to_currency($loan->loan_balance),
                ucwords($loan->customer_name),
                ucwords($loan->agent_name),
                ucwords($loan->approver_name),
                date("d-m-Y", $loan->loan_applied_date),
                date("d-m-Y", $loan->loan_payment_date),
                $this->lang->line("common_" . strtolower($loan_status)),
                anchor('loans/view/' . $loan->loan_id, $this->lang->line('common_view'), array('class' => 'modal_link btn btn-success', 'data-toggle' => 'modal', 'data-target' => '#loan_modal', "title" => "Update Loan"))
            );
        }

        $data = array(
            "recordsTotal" => $this->Loan->count_all(),
            "recordsFiltered" => $this->Loan->count_all(),
            "data" => $format_result
        );

        echo json_encode($data);
        exit;
    }

    function generate_breakdown($loan_id)
    {
        $loan = $this->Loan->get_info($loan_id);
        $loan_type = $this->Loan_type->get_info($loan->loan_type_id);
        $customer = $this->Customer->get_info($loan->customer_id);

        if ($loan_type->term_period_type === "year")
        {
            $period = $this->_get_period($loan_type->payment_schedule);
        }
        else
        {
            $period = $this->_get_period($loan_type->payment_schedule, false);
        }

        $payable = $this->_calculate_mortgage($loan->loan_amount, $loan_type->percent_charge1, $loan_type->term, $period);

        $filename = "Plan_de_Pagos_".ucwords($customer->first_name ."_". $customer->last_name)."-Prestamo_N".$loan_id."__".time();
        // As PDF creation takes a bit of memory, we're saving the created file in /downloads/reports/
        $pdfFilePath = FCPATH . "/downloads/reports/$filename.pdf";

        $data['company_name'] = $this->config->item("company"); // company name
        $data['company_address'] = $this->config->item("address"); // company address
        $data['phone'] = $this->config->item("phone"); // company address
        $data['fax'] = $this->config->item("fax"); // company address
        $data['email'] = $this->config->item("email"); // company address

        $data['loan_amount'] = to_currency($loan->loan_amount); // loan amount
        $data['payable'] = to_currency($loan->loan_balance);
        $data['rate'] = $loan_type->percent_charge1; // interest rate
        $data['term'] = $loan_type->term;

        $data['loan'] = $loan;
        $data['loan_type'] = $loan_type;
        $data['period_type'] = $loan_type->payment_schedule;
        $data['schedules'] = $this->Payment_schedule->get_schedules();

        $data['misc_fees'] = array();

        $misc_fees = json_decode($loan->misc_fees, true);
        $total_deductions = 0;

        if (is_array($misc_fees))
        {
            $tmp = array();
            foreach ($misc_fees as $fee => $charge):
                if (trim($charge) !== "")
                {
                    $tmp[] = array($fee, to_currency($charge));
                }
                $total_deductions += $charge;
            endforeach;
            $data['misc_fees'] = $tmp;
        }

        $data['customer_name'] = ucwords($customer->first_name . " " . $customer->last_name);
        $data['customer_address'] = ucwords($customer->address_1);
        $data['total_deductions'] = to_currency($total_deductions);
        $data['net_loan'] = to_currency($loan->loan_amount - $total_deductions);
        $data['total_interest'] = $this->_calculate_total_interest($loan->loan_balance, $loan_type->term, $payable, $period); // pass data to the view

        if ($loan_type->term_period_type === "year")
        {
            $tmp = $this->_get_repayment_amount_year_term($loan_type, $loan->loan_amount);
        }
        else
        {
            $tmp = $this->_get_repayment_amount_month_term($loan_type, $loan->loan_amount);
        }

        $data['repayment_amount'] = to_currency($payable);
        $data['payment_sched'] = strtoupper($tmp['payment_sched']);
        $data['apr'] = $tmp['apr'];


        $data['breakdown_data'] = 
          $this->_calculate_breakdown($loan_type->term, 
                                      $period, 
                                      $loan_type->percent_charge1, 
                                      $payable, 
                                      $loan->loan_amount, 
                                      $loan->loan_applied_date, 
                                      $loan->loan_payment_date, 
                                      $loan_type->payment_schedule);

        ini_set('memory_limit', '64M'); // boost the memory limit if it's low <img src="https://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
        $html = $this->load->view('loans/payment_schedule', $data, true); // render the view into HTML

        $this->load->library('pdf2');
    //$param = array();
    
    
        $pdf = $this->pdf2->load();
    
        $pdf->SetFooter($_SERVER['HTTP_HOST'] . '|{PAGENO}|' . date(DATE_RFC822)); // Add a footer for good measure <img src="https://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
        $pdf->WriteHTML($html); // write the HTML into the PDF
        $pdf->Output($pdfFilePath, 'F'); // save to file because we can

        redirect("/downloads/reports/$filename.pdf");
    }

    function print_disclosure($loan_id)
    {
        $loan = $this->Loan->get_info($loan_id);
        $loan_type = $this->Loan_type->get_info($loan->loan_type_id);
        $customer = $this->Customer->get_info($loan->customer_id);

        if ($loan_type->term_period_type === "year")
        {
            $period = $this->_get_period($loan_type->payment_schedule);
        }
        else
        {
            $period = $this->_get_period($loan_type->payment_schedule, false);
        }


        $payable = $this->_calculate_mortgage($loan->loan_balance, $loan_type->percent_charge1, $loan_type->term, $period);

        $filename = "disclosure" . time();
        // As PDF creation takes a bit of memory, we're saving the created file in /downloads/reports/
        $pdfFilePath = FCPATH . "/downloads/reports/$filename.pdf";

        $data['company_name'] = $this->config->item("company"); // company name
        $data['company_address'] = $this->config->item("address"); // company address
        $data['phone'] = $this->config->item("phone"); // company address
        $data['fax'] = $this->config->item("fax"); // company address
        $data['email'] = $this->config->item("email"); // company address

        $data['loan_amount'] = to_currency($loan->loan_amount); // loan amount
        $data['payable'] = to_currency($loan->loan_balance);
        $data['rate'] = $loan_type->percent_charge1; // interest rate
        $data['term'] = $loan_type->term;

        $data['loan'] = $loan;
        $data['loan_type'] = $loan_type;
        $data['period_type'] = $loan_type->payment_schedule;
        $data['schedules'] = $this->Payment_schedule->get_schedules();

        $data['misc_fees'] = array();

        $misc_fees = json_decode($loan->misc_fees, true);
        $total_deductions = 0;

        if (is_array($misc_fees))
        {
            $tmp = array();
            foreach ($misc_fees as $fee => $charge):
                if (trim($charge) !== "")
                {
                    $tmp[] = array($fee, to_currency($charge));
                }
                $total_deductions += $charge;
            endforeach;
            $data['misc_fees'] = $tmp;
        }

        $data['customer_name'] = ucwords($customer->first_name . " " . $customer->last_name);
        $data['customer_address'] = ucwords($customer->address_1);
        $data['total_deductions'] = to_currency($total_deductions);
        $data['net_loan'] = to_currency($loan->loan_amount - $total_deductions);
        //$data['total_interest'] = $this->_calculate_total_interest($loan->loan_balance, $loan_type->term, $payable, $period); // pass data to the view

        if ($loan_type->term_period_type === "year")
        {
            $tmp = $this->_get_repayment_amount_year_term($loan_type, $loan->loan_amount);
        }
        else
        {
            $tmp = $this->_get_repayment_amount_month_term($loan_type, $loan->loan_amount);
        }

        $data['repayment_amount'] = to_currency($payable);
        $data['payment_sched'] = strtoupper($tmp['payment_sched']);
        $data['apr'] = $tmp['apr'];

        //$data['breakdown_data'] = $this->_calculate_breakdown($loan_type->term, $period, $loan_type->percent_charge1, $payable, $loan->loan_balance, $loan->loan_payment_date);
        //if (file_exists($pdfFilePath) == FALSE)
        //{
        ini_set('memory_limit', '64M'); // boost the memory limit if it's low <img src="https://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
        $html = $this->load->view('loans/pdf_report', $data, true); // render the view into HTML

        $this->load->library('pdf2');
        $pdf = $this->pdf2->load();
        $pdf->SetFooter($_SERVER['HTTP_HOST'] . '|{PAGENO}|' . date(DATE_RFC822)); // Add a footer for good measure <img src="https://davidsimpson.me/wp-includes/images/smilies/icon_wink.gif" alt=";)" class="wp-smiley">
        $pdf->WriteHTML($html); // write the HTML into the PDF
        $pdf->Output($pdfFilePath, 'F'); // save to file because we can
        //}

        redirect("/downloads/reports/$filename.pdf");
    }

    private function _get_repayment_amount_year_term($loan_type, $loan_balance_amount)
    {
        // get the term of payment
        $term = $loan_type->term; // 1yr
        // period_type1 means recurrence of interest
        // how to get the APR (Annual Percentage Rate) if 
        // im going to give an interest rate of 3% every 3 weeks
        // of course im going get how many time 3 weeks in a year
        // 52 weeks / 3 weeks = 17 weeks then multiply it by 3%
        // the answer is the APR, which is 51% in year.
        // interest rate is computed by APR / number times in a year

        switch ($loan_type->period_type1)
        {
            case "Week": // 52 weeks in 1yr
                $period = 52 * $term;
                $apr = (52 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                $interest_rate = $apr / 52;
                break;
            case "Month": // 12 months in 1yr
                $period = 12 * $term;
                $apr = (12 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                $interest_rate = $apr / 12;
                break;
            case "Year": // 1yr in 1yr
                $period = 1 * $term;
                $apr = (1 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                $interest_rate = $apr / 1;
                break;
        }

        switch ($loan_type->payment_schedule)
        {
            case "weekly": // 52 weeks in 1yr
                $factor = 52 * $term;
                $payment_sched = "Weekly payment";
                break;
            case "monthly": // 12 months in 1yr
                $factor = 12 * $term;
                $payment_sched = "Monthly payment";
                break;
            case "yearly": // 1yr in 1yr
                $factor = 1 * $term;
                $payment_sched = "Yearly payment";
                break;
            case "daily":
                $factor = 365 * $term;
                $payment_sched = "Daily payment";
                break;
        }

        if ($apr > 0)
        {
            $rate_per_payment = 1 / (1 + ($interest_rate / 100) );
            $payment = $loan_balance_amount * ( (1 - $rate_per_payment) / ( $rate_per_payment - (pow($rate_per_payment, $factor)) ) );

            return array("repayment_amount" => $payment, "apr" => $apr, "payment_sched" => $payment_sched);
        }
        else
        {
            $payment = $loan_balance_amount / $factor;
            return array("repayment_amount" => $payment, "apr" => $apr, "payment_sched" => $payment_sched);
        }
    }

    private function _get_repayment_amount_month_term($loan_type, $loan_balance_amount)
    {
        // get the term of payment
        $term = $loan_type->term; // 1month
        // period_type1 means recurrence of interest
        // how to get the APR (Annual Percentage Rate) if 
        // im going to give an interest rate of 3% every 3 weeks
        // of course im going get how many time 3 weeks in a year
        // 52 weeks / 3 weeks = 17 weeks then multiply it by 3%
        // the answer is the APR, which is 51% in year.
        // interest rate is computed by APR / number times in a year

        /*switch ($loan_type->period_type1)
        {
            case "Week": // 52 weeks in 1yr
                $period = 52 * $term;
                $amr = (52 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                $interest_rate = $amr / 52;
                break;
            case "Month": // 12 months in 1yr
                $period = 12 * $term;
                $amr = (12 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                $interest_rate = $amr / 12;
                break;
            case "Year": // 1yr in 1yr
                $period = 1 * $term;
                $amr = (1 / $loan_type->period_charge1) * $loan_type->percent_charge1;
                $interest_rate = $amr / 1;
                break;
        }*/

        switch ($loan_type->payment_schedule)
        {
            case "weekly": // 4 weeks in 1month
                $factor = 1/4 * $term;
                $payment_sched = "Weekly payment";
                break;
            case "biweekly": // 4 weeks in 1month
                $factor = 1/2 * $term;
                $payment_sched = "Bi-Weekly payment";
                break;
      
      case "quarterly": // 4 weeks in 1month
                $factor = 3 * $term;
                $payment_sched = "Quarterly payment";
            break;  
        
            case "monthly": // 1 month in 1month
                $factor = 1 * $term;
                $payment_sched = "Monthly payment";
                break;
      
      case "bimonthly": // 1 month in 1month
                $factor = 2 * $term;
                $payment_sched = "Bimonthly payment";
                break;  
        
        
      case "biannual": // 1 month in 1month
                $factor = 6* $term;
                $payment_sched = "Biannual payment";
                break;  
        
            case "daily":
                $factor = 1/30 * $term;
                $payment_sched = "Daily payment";
                break;
        }
        
        $interest_rate = $loan_type->percent_charge1;

        if ($interest_rate > 0)
        {
            $rate_per_payment = 1 / (1 + ($interest_rate / 100) );
            $repayment = $loan_balance_amount * ( (1 - $rate_per_payment) / ( $rate_per_payment - (pow($rate_per_payment, $factor)) ) );
            return array("repayment_amount" => $repayment, "apr" => $interest_rate, "payment_sched" => $payment_sched);
        }
        else
        {
            $payment = $loan_balance_amount / $factor;
            return array("repayment_amount" => $payment, "apr" => $amr, "payment_sched" => $payment_sched);
        }
    }

    private function _calculate_breakdown($term, $period, $rate, $pay, 
                                          $balance, $applied_date, $payment_date, 
                                          $payment_schedule) {
      $data = array();
      $saldo = $balance;      

      $days_to_add = '+1 month';

      switch ($payment_schedule) {
        case "daily":
          $days_to_add = '+1 day';
          break;
        case "weekly":
          $days_to_add = '+7 day';
          break;
        case "biweekly":
          $days_to_add = '+14 day';
          break;
        default:
        case "monthly":
          $days_to_add = '+1 month';
          break;
        case "bimonthly":
          $days_to_add = '+2 month';
          break;
        case "quarterly":
          $days_to_add = '+3 month';
          break;  
        case "biannual":
          $days_to_add = '+6 month';
          break;   
      }

      $days = ($payment_date - $applied_date)/(3600*24);

      $interes = $balance*((($rate/100)/365)*$days);

      $capital = $pay - $interes;

      $data[0]['month'] = date("d M Y", $payment_date);

      $payment_date = strtotime($days_to_add, $payment_date);

      $data[0]['balance'] = to_currency($balance);
      $data[0]['interest'] = to_currency($interes);
      $data[0]['pay'] = to_currency($pay);
      $data[0]['capital'] = to_currency($capital);
      $data[0]['balance2'] = to_currency($balance - $capital);
      $balance = $balance - $capital;

      for ($i = 1; $i < ($term/$period)-1; $i++) {

        $interes = $balance*((($rate/100)/12)*$period);
        $capital = $pay - $interes;

        $data[$i]['month'] = date("d M Y", $payment_date);

        $payment_date = strtotime($days_to_add, $payment_date);

        //$balance = $balance - $capital;
        $data[$i]['balance'] = to_currency($balance);
        $data[$i]['interest'] = to_currency($interes);
        $data[$i]['pay'] = to_currency($pay);
        $data[$i]['capital'] = to_currency($capital);
        $data[$i]['balance2'] = to_currency($balance - $capital);
        $balance = $balance - $capital;
      }
	   
	 	$interes = $balance*((($rate/100)/12)*$period);
		
		$cuota = $balance + $interes;
        $data[$i]['month'] = date("d M Y", $payment_date);

        $payment_date = strtotime($days_to_add, $payment_date);

        //$balance = $balance - $capital;
        $data[$i]['balance'] = to_currency($balance);
        $data[$i]['interest'] = to_currency($interes);
        $data[$i]['pay'] = to_currency($cuota);
        $data[$i]['capital'] = to_currency($balance);
        $data[$i]['balance2'] = to_currency(0);
      //  $balance = $balance - $capital;
 

	  
	  

      return $data;
    }

    private function _get_period($period_type, $is_yearly = true) {

      switch ($period_type) {
        case "weekly":
            $period = 1/4;
            break;
        case "biweekly":
            $period = 1/2;
            break;
        default:
        case "monthly":
            $period = 1;
            break;
        case "bimonthly":
            $period = 2;
            break;
        case "quarterly":
            $period = 3;
            break;
        case "biannual":
            $period = 6;
            break;  
        }

        return $period;
    }

    private function _calculate_mortgage($balance, $rate, $term, $period) {
      $numpagos = $term/$period ;
      $rate = $rate/100/12*$period;
      $result = 0;
      $power = pow(1+$rate,$numpagos);

      if ($rate != 0) {
        $result = $rate *(-$balance)*$power/(1-$power);
      }
      else {
        $result = $balance / $numpagos;
      }

      return $result;
    }

    private function _calculate_total_interest($balance, $term, $pay, $period)
    {
        return (($term * $pay * $period) - $balance);
    }

    private function _count_overdues()
    {
        return $this->Loan->count_overdues();
    }

    function customer_search() {
        $suggestions = $this->Customer->get_customer_search_suggestions($this->input->get('query'), 30);
        $data = $tmp = array();

        foreach ($suggestions as $suggestion):
            $t = explode("|", $suggestion);
            $tmp = array("value" => $t[1], "data" => $t[0]);
            $data[] = $tmp;
        endforeach;

        echo json_encode(array("suggestions" => $data));
        exit;
    }

    function select_customer()
    {
        $customer_id = $this->input->post("customer");
        $this->sale_lib->set_customer($customer_id);
        $this->_reload();
    }

    function upload()
    {
        $directory = FCPATH . 'uploads/loan-' . $_REQUEST["loan_id"] . "/";
        $this->load->library('uploader');
        $data = $this->uploader->upload($directory);

        $this->Loan->save_attachments($data['params']['loan_id'], $data);

        $file = $this->_get_formatted_file($data['attachment_id'], $data['filename'], "");
        $file['loan_id'] = $data['params']['loan_id'];
        $file['id'] = $data["attachment_id"];

        echo json_encode($file);
        exit;
    }

    function remove_file()
    {
        $file_id = $this->input->post("file_id");
        echo json_encode(array("status" => $this->Loan->remove_file($file_id)));
        exit;
    }

    function attach_desc()
    {
        $id = $this->input->post("attach_id");
        $desc = $this->input->post("desc");
        $this->Loan->save_attach_desc($id, $desc);
        echo json_encode(array("success" => TRUE));
        exit;
    }

    function attachments($loan_id, $select_type)
    {
        $data['loan_info'] = $this->Loan->get_info($loan_id);
        $attachments = $this->Loan->get_attachments($loan_id);

        $file =array();
        foreach ($attachments as $attachment)
        {
            $file[] = $this->_get_formatted_file($attachment->attachment_id, $attachment->filename, $attachment->descriptions);
        }

        $data["select_type"] = $select_type;
        $data['attachments'] = $file;
        $this->load->view("loans/attachments", $data);
    }

}

?>
