<?php

class pdf2 {

    function pdf()
    {
        $CI = & get_instance();
        log_message('Debug', 'mPDF class is loaded.');
    }

    function load($param = NULL)
    {
        include_once APPPATH . '/third_party/mpdf2/mpdf.php';

        if ($param == NULL)
        {
            $param = '"en-GB-x","Letter","","",10,10,10,10,6,3';
        }

        return new mPDF($param);
    }

}

?>
