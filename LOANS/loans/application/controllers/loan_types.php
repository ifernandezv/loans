<?php

require_once ("secure_area.php");
require_once ("interfaces/idata_controller.php");

class Loan_types extends Secure_area implements iData_controller {

    function __construct()
    {
        parent::__construct('loan_types');
    }

    function index()
    {
        $data['controller_name'] = strtolower(get_class());
        $data['form_width'] = $this->get_form_width();
        $this->load->view('loan_types/manage', $data);
    }

    function view($loan_type_id = -1)
    {
        $data['loan_type_info'] = $this->Loan_type->get_info($loan_type_id);

        $tmp = array ();
        $schedules = $this->Payment_schedule->get_schedules();
        foreach ($schedules as $schedule):
            $tmp[$schedule->name] = $this->lang->line("common_" . strtolower($schedule->name));
        endforeach;
        $data['period'] = $tmp;

        $data['terms'] = array(
      "Day" => $this->lang->line("common_day"),
            "Week" => $this->lang->line("common_week"),
            "Month" => $this->lang->line("common_month"),
            "Year" => $this->lang->line("common_year")
        );

        $data['term_period'] = array(
            "Month" => $this->lang->line("common_month"),
            "Year" => $this->lang->line("common_year")
        );

        $this->load->view("loan_types/form", $data);
    }

    function save($loan_type_id = -1)
    {
        $loan_type_data = array(
            'name' => $this->input->post('name'),
            'description' => $this->input->post('description'),
            'term' => $this->input->post('term'),
            'term_period_type' => $this->input->post('term_period_type'),
            'payment_schedule' => $this->input->post('payment_schedule'),
            'percent_charge1' => $this->input->post('percent_charge1'),
            'period_charge1' => $this->input->post('period_charge1'),
            'period_type1' => $this->input->post('period_type1'),
            'percent_charge2' => $this->input->post('percent_charge2'),
            'period_charge2' => $this->input->post('period_charge2'),
            'period_type2' => $this->input->post('period_type2'),
            'percent_charge3' => $this->input->post('percent_charge3'),
            'period_charge3' => $this->input->post('period_charge3'),
            'period_type3' => $this->input->post('period_type3'),
            'percent_charge4' => $this->input->post('percent_charge4'),
            'period_charge4' => $this->input->post('period_charge4'),
            'period_type4' => $this->input->post('period_type4'),
            'percent_charge5' => $this->input->post('percent_charge5'),
            'period_charge5' => $this->input->post('period_charge5'),
            'period_type5' => $this->input->post('period_type5'),
            'percent_charge6' => $this->input->post('percent_charge6'),
            'period_charge6' => $this->input->post('period_charge6'),
            'period_type6' => $this->input->post('period_type6'),
            'percent_charge7' => $this->input->post('percent_charge7'),
            'period_charge7' => $this->input->post('period_charge7'),
            'period_type7' => $this->input->post('period_type7'),
            'percent_charge8' => $this->input->post('percent_charge8'),
            'period_charge8' => $this->input->post('period_charge8'),
            'period_type8' => $this->input->post('period_type8'),
            'percent_charge9' => $this->input->post('percent_charge9'),
            'period_charge9' => $this->input->post('period_charge9'),
            'period_type9' => $this->input->post('period_type9'),
            'percent_charge10' => $this->input->post('percent_charge10'),
            'period_charge10' => $this->input->post('period_charge10'),
            'period_type10' => $this->input->post('period_type10')
        );

        if ($this->Loan_type->save($loan_type_data, $loan_type_id))
        {
            //New Loan Type
            if ($loan_type_id == -1)
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line('loan_type_successful_adding') . ' ' .
                    $loan_type_data['name'], 'loan_type_id' => $loan_type_data['loan_type_id']));
                $loan_type_id = $loan_type_data['loan_type_id'];
            }
            else //previous item
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line('loan_type_successful_updating') . ' ' .
                    $loan_type_data['name'], 'loan_type_id' => $loan_type_id));
            }
        }
        else//failure
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('loan_type_error_adding_updating') . ' ' .
                $loan_type_data['name'], 'loan_type_id' => -1));
        }
    }

    function delete()
    {
        $loan_types_to_delete = $this->input->post('ids');

        if ($this->Loan_type->delete_list($loan_types_to_delete))
        {
            echo json_encode(array('success' => true, 'message' => $this->lang->line('loan_type_successful_deleted') . ' ' .
                count($loan_types_to_delete) . ' ' . $this->lang->line('loan_type_one_or_multiple')));
        }
        else
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('loan_type_cannot_be_deleted')));
        }
    }

    function get_form_width()
    {
        return 360;
    }

    function data()
    {
        $index = isset($_GET['order'][0]['column']) ? $_GET['order'][0]['column'] : 1;
        $dir = isset($_GET['order'][0]['dir']) ? $_GET['order'][0]['dir'] : "asc";
        $order = array("index" => $index, "direction" => $dir);
        $length = isset($_GET['length'])?$_GET['length']:50;
        $start = isset($_GET['start'])?$_GET['start']:0;
        $key = isset($_GET['search']['value'])?$_GET['search']['value']:"";

        $loan_types = $this->Loan_type->get_all($length, $start, $key, $order);

        $format_result = array();

        foreach ($loan_types->result() as $loan_type)
        {
            $interest_rate = ($loan_type->term_period_type === "year") ? ($loan_type->percent_charge1 . "% x " . $loan_type->period_charge1 . " " . $loan_type->period_type1) : $loan_type->percent_charge1 . "% ".$this->lang->line('loan_fixed')."";
    
              $format_result[] = array(
                "<input type='checkbox' name='chk[]' class='select_' id='loan_type_$loan_type->loan_type_id' value='" . $loan_type->loan_type_id . "'/>",
                $loan_type->loan_type_id,
                $loan_type->name,
                $loan_type->description,
                $interest_rate,
                $loan_type->term . " " . $this->lang->line('common_'.strtolower($loan_type->term_period_type)),
                ucwords($this->lang->line('common_'.strtolower($loan_type->payment_schedule))), 
                $loan_type->percent_charge2 .  $this->config->item('currency_symbol') . " x " . $this->lang->line('common_'.strtolower($loan_type->period_charge2)) . " " . $this->lang->line('common_'.strtolower($loan_type->period_type2)),
                anchor('loan_types/view/' . $loan_type->loan_type_id, $this->lang->line('common_edit'), array('class' => 'modal_link btn btn-success', 'data-toggle' => 'modal', 'data-target' => '#loan_type_modal', "title" => "Update Loan Type"))
            );
        }

        $data = array(
            "recordsTotal" => $this->Loan_type->count_all(),
            "recordsFiltered" => $this->Loan_type->count_all(),
            "data" => $format_result
        );

        echo json_encode($data);
        exit;
    }

    public function get_row()
    {
        
    }

    public function search()
    {
        
    }

    public function suggest()
    {
        
    }

}

?>