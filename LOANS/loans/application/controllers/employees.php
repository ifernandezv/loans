<?php

require_once ("person_controller.php");

class Employees extends Person_controller {

    function __construct()
    {
        parent::__construct('employees');
    }

    function index()
    {
        $config['base_url'] = site_url('/employees/index');
        $config['total_rows'] = $this->Employee->count_all();
        $config['per_page'] = '20';
        $config['uri_segment'] = 3;
        $this->pagination->initialize($config);

        $data['controller_name'] = strtolower(get_class());
        $data['form_width'] = $this->get_form_width();
        $data['manage_table'] = get_people_manage_table($this->Employee->get_all($config['per_page'], $this->uri->segment($config['uri_segment'])), $this);
        $this->load->view('people/employee', $data);
    }

    /*
      Returns employee table data rows. This will be called with AJAX.
     */

    function search()
    {
        $search = $this->input->post('search');
        $data_rows = get_people_manage_table_data_rows($this->Employee->search($search), $this);
        echo $data_rows;
    }

    /*
      Gives search suggestions based on what is being searched for
     */

    function suggest()
    {
        $suggestions = $this->Employee->get_search_suggestions($this->input->post('q'), $this->input->post('limit'));
        echo implode("\n", $suggestions);
    }

    /*
      Loads the employee edit form
     */

    function view($employee_id = -1)
    {
        $data['person_info'] = $this->Employee->get_info($employee_id);
        $data['all_modules'] = $this->Module->get_all_modules();
        $data['all_subpermissions'] = $this->Module->get_all_subpermissions();
        $this->load->view("employees/form", $data);
    }

    /*
      Inserts/updates an employee
     */

    function save($employee_id = -1)
    {
        $person_data = array(
            'first_name' => $this->input->post('first_name'),
            'last_name' => $this->input->post('last_name'),
            'email' => $this->input->post('email'),
            'phone_number' => $this->input->post('phone_number'),
            'address_1' => $this->input->post('address_1'),
            'address_2' => $this->input->post('address_2'),
            'city' => $this->input->post('city'),
            'state' => $this->input->post('state'),
            'zip' => $this->input->post('zip'),
            'country' => $this->input->post('country'),
            'comments' => $this->input->post('comments')
        );
        $grants_data = $this->input->post("grants") != false ? $this->input->post("grants") : array();

        //Password has been changed OR first time password set
        if ($this->input->post('password') != '')
        {
            $employee_data = array(
                'username' => $this->input->post('username'),
                'password' => md5($this->input->post('password'))
            );
        }
        else //Password not changed
        {
            $employee_data = array('username' => $this->input->post('username'));
        }

        if ($this->Employee->save($person_data, $employee_data, $grants_data, $employee_id))
        {
            //New employee
            if ($employee_id == -1)
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line('employees_successful_adding') . ' ' .
                    $person_data['first_name'] . ' ' . $person_data['last_name'], 'person_id' => $employee_data['person_id']));
            }
            else //previous employee
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line('employees_successful_updating') . ' ' .
                    $person_data['first_name'] . ' ' . $person_data['last_name'], 'person_id' => $employee_id));
            }
        }
        else//failure
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('employees_error_adding_updating') . ' ' .
                $person_data['first_name'] . ' ' . $person_data['last_name'], 'person_id' => -1));
        }
    }

    /*
      This deletes employees from the employees table
     */

    function delete()
    {
        $employees_to_delete = $this->input->post('ids');

        if ($this->Employee->delete_list($employees_to_delete))
        {
            echo json_encode(array('success' => true, 'message' => $this->lang->line('employees_successful_deleted') . ' ' .
                count($employees_to_delete) . ' ' . $this->lang->line('employees_one_or_multiple')));
        }
        else
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('employees_cannot_be_deleted')));
        }
    }

    /*
      get the width for the add/edit form
     */

    function get_form_width()
    {
        return 650;
    }

    function data()
    {
        $index = isset($_GET['order'][0]['column']) ? $_GET['order'][0]['column'] : 1;
        $dir = isset($_GET['order'][0]['dir']) ? $_GET['order'][0]['dir'] : "asc";
        $order = array("index" => $index, "direction" => $dir);
        $length = isset($_GET['length'])?$_GET['length']:50;
        $start = isset($_GET['start'])?$_GET['start']:0;
        $key = isset($_GET['search']['value'])?$_GET['search']['value']:"";

        $people = $this->Employee->get_all($length, $start, $key, $order);

        $format_result = array();

        $width = 50;

        foreach ($people->result() as $person)
        {
            $format_result[] = array(
                "<input type='checkbox' name='chk[]' id='person_$person->person_id' value='" . $person->person_id . "'/>",
                $person->person_id,
                $person->last_name,
                $person->first_name,
                $person->username,
                $person->email,                
                $person->phone_number,
                anchor('employees/view/' . $person->person_id, $this->lang->line('common_edit'), array('class' => 'btn btn-success', 'data-toggle' => 'modal', 'data-target' => '#employee_modal', "title" => "Update Customer"))
            );
        }

        $data = array(
            "recordsTotal" => $this->Employee->count_all(),
            "recordsFiltered" => $this->Employee->count_all(),
            "data" => $format_result
        );

        echo json_encode($data);
        exit;
    }

}

?>