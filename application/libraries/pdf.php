<?php

class pdf {

    function pdf()
    {
        $CI = & get_instance();
        log_message('Debug', 'mPDF class is loaded.');
    }

    function load($param = NULL)
    {
        include_once APPPATH . '/third_party/mpdf/mpdf.php';

        if ($param == NULL)
        {
          return new mPDF("en-GB-x",array(216,280),'','',20,20,10,10,6,3);
        }

        return new mPDF($param);
    }

}

?>
