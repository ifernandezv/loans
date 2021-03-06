<?php

class Payment extends CI_Model {
  /*
    Determines if a given loan_payment_id is a payment
   */

  function exists($payment_id) {
    $this->db->from('loan_payments');
    $this->db->where('loan_payment_id', $payment_id);
    $this->db->where('delete_flag', 0);
    $query = $this->db->get();

    return ($query->num_rows() == 1);
  }

  function get_all($limit = 10000, $offset = 0, $search = "", $order = array()) {
    $sorter = array(
      "loan_payment_id",
      "loan_payment_id",
      "customer.first_name",
      "loan_types.name",
      "balance_amount",
      "paid_amount",
      "date_paid",
      "teller.first_name"
    );

    $select = "lp.*, CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, 
               CONCAT(teller.first_name, ' ',teller.last_name) as teller_name, 
               (SELECT count(*) from kpos_loan_payments
                WHERE loan_payment_id <= lp.loan_payment_id
                AND loan_id = lp.loan_id AND delete_flag = 0) as numero_cuota,
               loan_types.name as loan_type,
               loans.loan_amount,
               loans.loan_balance";

    $this->db->select($select, FALSE);
    $this->db->from('loan_payments as lp');
    $this->db->join('pdv.people as customer', 'customer.person_id = lp.customer_id', 'LEFT');
    $this->db->join('pdv.people as teller', 'teller.person_id = lp.teller_id', 'LEFT');
    $this->db->join('loans', 'loans.loan_id = lp.loan_id', 'LEFT');
    $this->db->join('loan_types as loan_types', 'loan_types.loan_type_id = loans.loan_type_id', 'LEFT');

    if ($search !== "") {
      $this->db->where("(
        loan_types.name LIKE '%" . $search . "%' OR
        kpos_loan_payments.account LIKE '%" . $search . "%' OR
        customer.first_name LIKE '%" . $search . "%' OR
        teller.first_name LIKE '%" . $search . "%' OR
        date_paid LIKE '%" . $search . "%'
        )");
    }

    if (count($order) > 0 && $order['index'] < count($sorter)) {
      //echo $sorter[$order['index']];
      $this->db->order_by($sorter[$order['index']], $order['direction']);
    }
    else {
      $this->db->order_by("loan_payment_id", "desc");
    }

    $this->db->where('lp.delete_flag', 0);

    $this->db->limit($limit);
    $this->db->offset($offset);
    return $this->db->get();
  }

  function get_data_reporte($data) {
    $desde = strtotime($data['desde']);
    $hasta = strtotime($data['hasta']);
    $cliente = $data['customer'];
    $select = "lp.*, CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, 
               CONCAT(teller.first_name, ' ',teller.last_name) as teller_name, 
               (SELECT count(*) from kpos_loan_payments
                WHERE loan_payment_id <= lp.loan_payment_id
                AND loan_id = lp.loan_id AND delete_flag = 0) as numero_cuota,
               loan_types.name as loan_type,
               loans.loan_amount,
               loans.loan_balance";

    $this->db->select($select, FALSE);
    $this->db->from('loan_payments as lp');
    $this->db->join('pdv.people as customer', 'customer.person_id = lp.customer_id', 'LEFT');
    $this->db->join('pdv.people as teller', 'teller.person_id = lp.teller_id', 'LEFT');
    $this->db->join('loans', 'loans.loan_id = lp.loan_id', 'LEFT');
    $this->db->join('loan_types as loan_types', 'loan_types.loan_type_id = loans.loan_type_id', 'LEFT');

    $this->db->order_by("customer_name", "asc");
    $this->db->order_by("loan_id", "asc");
    $this->db->order_by("loan_payment_id", "desc");

    if (!empty($desde)) {
      $this->db->where('lp.date_paid >= '.$desde);
    }

    if (!empty($hasta)) {
      $this->db->where('lp.date_paid <= '.$hasta);
    }

    if (!empty($cliente)) {
      $this->db->where('lp.loan_id = '.$cliente);
    }

    $this->db->where('lp.delete_flag', 0);

    return $this->db->get();
  }

  function count_all() {
    $this->db->where('delete_flag', 0);
    $this->db->from('loan_payments');
    return $this->db->count_all_results();
  }

  function count_payments($loan_id) {
    $this->db->where('loan_id', $loan_id);
    $this->db->where('delete_flag', 0);
    $this->db->from('loan_payments');
    return $this->db->count_all_results();
  }

  function first_payment($loan_id) {
    $this->db->where('loan_id', $loan_id);
    $this->db->where('delete_flag', 0);
    $this->db->from('loan_payments');
    $this->db->order_by('loan_payment_id','asc');
    $this->db->limit(1);
    $query = $this->db->get();

    if ($query->num_rows() == 1) {
      return $query->row()->date_paid;
    }
    return '';
  }

  function last_payment($loan_id) {
    $this->db->where('loan_id', $loan_id);
    $this->db->where('delete_flag', 0);
    $this->db->from('loan_payments');
    $this->db->order_by('loan_payment_id','desc');
    $this->db->limit(1);
    $query = $this->db->get();

    if ($query->num_rows() == 1) {
      return $query->row()->loan_payment_id;
    }
    return '';
  }

  function get_fechas($loan_id) {
    $this->db->where('loan_id', $loan_id);
    $this->db->where('delete_flag', 0);
    $this->db->from('loan_payments');
    $this->db->order_by('loan_payment_id','desc');
    return $this->db->get();
  }

  /*
    Gets information about a particular loan
   */

  function get_info($payment_id) {
    $select = "lp.*, CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, 
               CONCAT(teller.first_name, ' ',teller.last_name) as teller_name, 
               loan_types.name as loan_type,
               (SELECT count(*) from kpos_loan_payments
                WHERE loan_payment_id <= lp.loan_payment_id
                AND loan_id = lp.loan_id AND delete_flag = 0) as numero_cuota";

    $this->db->select($select, FALSE);
    $this->db->from('loan_payments as lp');
    $this->db->join('pdv.people as customer', 'customer.person_id = lp.customer_id', 'LEFT');
    $this->db->join('pdv.people as teller', 'teller.person_id = lp.teller_id', 'LEFT');
    $this->db->join('loans as l', 'l.loan_id = lp.loan_id', 'LEFT');
    $this->db->join('loan_types', 'loan_types.loan_type_id = l.loan_type_id', 'LEFT');
    $this->db->where('loan_payment_id', $payment_id);
    $this->db->where('lp.delete_flag', 0);

//    $result = $this->db->_compile_select();
//    error_log('query en get_info: '.print_r($result,true));

    $query = $this->db->get();

    if ($query->num_rows() == 1) {
      return $query->row();
    }

    //Get empty base parent object, as $loan_id is NOT a loan
    $payment_obj = new stdClass();

    //Get all the fields from items table
    $fields = $this->db->list_fields('loan_payments');

    foreach ($fields as $field)
    {
        $payment_obj->$field = '';
    }

    $payment_obj->loan_payment_id = -1;
    $payment_obj->customer_name = '';

    return $payment_obj;
  }

  /*
    Gets information about multiple loans
   */

  function get_multiple_info($loans_ids) {
    $this->db->from('loans');
    $this->db->where_in('item_kit_id', $loan_ids);
    $this->db->order_by("account", "asc");
    return $this->db->get();
  }

  /*
    Inserts or updates a payment
   */

  function save(&$payment_data, $payment_id = false) {
    if (!$payment_id or ! $this->exists($payment_id)) {
      if ($this->db->insert('loan_payments', $payment_data)) {
        $payment_data['loan_payment_id'] = $this->db->insert_id();
      }
      else {
        return false;
      }
    }

    $payment_data['date_modified'] = time();
    $this->db->where('loan_payment_id', $payment_id);
    if ($this->db->update('loan_payments', $payment_data)) {
      $query = '
        UPDATE kpos_loans
        SET loan_pago = \'' . $payment_data['date_paid'] . '\'
        WHERE loan_id = '.$payment_data['loan_id'];
      return $this->db->query($query);
    }
  }

  /*
    Deletes one payment
   */

  function delete($payment_id) {
    $payment_info = $this->get_info($payment_id);
    $old_balance = $payment_info->balance_amount + $payment_info->paid_amount - $payment_info->interes;
    $data = array('loan_balance' => $old_balance);
    if($payment_info->numero_cuota == 1) {
      $loan_info = $this->Loan->get_info($payment_info->loan_id);
      $data['loan_pago'] = $loan_info->loan_applied_date;
      $data['loan_balance'] = $loan_info->loan_amount;
      $data['loan_applied_date'] = $loan_info->loan_applied_date;
    }
    $this->db->where('loan_payment_id', $payment_id);
    $this->db->update('loan_payments', array('delete_flag' => 1));

    return $this->Loan->save($data,$payment_info->loan_id);
  }

  /*
    Deletes a list of loans
   */

  function delete_list($payment_ids) {
    $this->db->where_in('loan_payment_id', $payment_ids);
    return $this->db->update('loan_payments', array("delete_flag" => 1));
  }

  /*
    Get search suggestions to find loans
   */

  function get_search_suggestions($search, $limit = 25) {
    $suggestions = array();

    $this->db->from('loans');
    $this->db->like('account', $search);
    $this->db->order_by("account", "asc");
    $by_name = $this->db->get();
    foreach ($by_name->result() as $row) {
      $suggestions[] = $row->account;
    }

    //only return $limit suggestions
    if (count($suggestions > $limit)) {
      $suggestions = array_slice($suggestions, 0, $limit);
    }
    return $suggestions;
  }

  function get_loan_search_suggestions($search, $limit = 25) {
    $suggestions = array();

    $this->db->from('loans');
    $this->db->like('account', $search);
    $this->db->order_by("account", "asc");
    $by_name = $this->db->get();
    foreach ($by_name->result() as $row) {
      $suggestions[] = 'LOAN ' . $row->item_kit_id . '|' . $row->name;
    }

    //only return $limit suggestions
    if (count($suggestions > $limit)) {
      $suggestions = array_slice($suggestions, 0, $limit);
    }
    return $suggestions;
  }

  /*
    Preform a search on loans
   */

  function search($search) {
    $this->db->from('loans');
    $this->db->where("account LIKE '%" . $this->db->escape_like_str($search) . "%' or 
description LIKE '%" . $this->db->escape_like_str($search) . "%'");
    $this->db->order_by("account", "asc");
    return $this->db->get();
  }

  function get_loans($customer_id) {
    $this->db->select('loans.*, loan_types.name as loan_type, loan_types.term as loan_term');
    $this->db->from('loans');
    $this->db->join('loan_types', "loan_types.loan_type_id = loans.loan_type_id");
    $this->db->where("customer_id", $customer_id);
    $this->db->where("customer_id >", 0);
    $this->db->where("delete_flag", 0);
    $this->db->where("loan_balance > ", 0);

    $result = $this->db->get()->result();

    return $result;
  }
}

?>
