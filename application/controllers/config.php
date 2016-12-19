<?php

require_once ("secure_area.php");

class Config extends Secure_area {

    function __construct()
    {
        parent::__construct('config');
    }

    function index()
    {
        $this->load->view("config");
    }

    function save()
    {
        $batch_save_data = array(
            'company' => $this->input->post('company'),
            'address' => $this->input->post('address'),
            'phone' => $this->input->post('phone'),
            'email' => $this->input->post('email'),
            'fax' => $this->input->post('fax'),
            'website' => $this->input->post('website'),
            'currency_symbol' => $this->input->post('currency_symbol'),
            'currency_side' => $this->input->post('currency_side'),
            'language' => $this->input->post('language'),
            'timezone' => $this->input->post('timezone')
        );

        if ($this->Appconfig->batch_save($batch_save_data))
        {
            echo json_encode(array('success' => true, 'message' => $this->lang->line('config_saved_successfully')));
        }
    }
    
    function upload()
    {
        $directory = FCPATH . "uploads/logo/";
        $this->load->library('uploader');
        $data = $this->uploader->upload($directory);

        $this->Appconfig->save("logo", $data['filename']);
        $data['company_name'] = strtolower(preg_replace('/\s+/', '', $this->config->item('company')));

        echo json_encode($data);
        exit;
    }

}

?>