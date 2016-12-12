<?php
require_once("report.php");
class Summary_customers_location extends Report
{
	function __construct()
	{
		parent::__construct();
	}
	
	public function getDataColumns()
	{
		$columns = array();
		
		$columns[] = array('data'=>lang('reports_customer'), 'align'=> 'left');
		$columns[] = array('data'=>lang('reports_subtotal'), 'align'=> 'right');
		$columns[] = array('data'=>lang('reports_total'), 'align'=> 'right');
		$columns[] = array('data'=>lang('reports_tax'), 'align'=> 'right');

		if($this->Employee->has_module_action_permission('reports','show_profit',$this->Employee->get_logged_in_employee_info()->person_id))
		{
			$columns[] = array('data'=>lang('reports_profit'), 'align'=> 'right');
		}
		
		return $columns;		
	}
	
	public function getData()
	{
		$this->db->select('CONCAT(first_name, " ",last_name) as customer, company_name, balance, location_id, `long` as longsale, `lat` as latsale,customers.person_id as personid', false);
		$this->db->from('customers');
		$this->db->join('people', 'customers.person_id = people.person_id');	
		$this->db->where($this->db->dbprefix('customers').'.location_id', $this->params['current_location_id']);
		if ($this->params['customer_type'] == 1)
		{
			$this->db->where($this->db->dbprefix('customers').'.balance > ', 0);
		}
		if ($this->params['customer_type'] == 2)
		{
			$this->db->where($this->db->dbprefix('customers').'.balance = ', 0);
		}
		$this->db->group_by('customers.person_id');
		$this->db->order_by('last_name');
		if (isset($this->params['export_excel']) && !$this->params['export_excel'])
		{
			$this->db->limit($this->report_limit);
			$this->db->offset($this->params['offset']);
		}
		return $this->db->get()->result_array();		
	}
	
	public function getNoCustomerData()
	{
		
	}
	
public function getSummaryData()
	{
	}
	
function getTotalRows()
	{
		$this->db->select('COUNT(DISTINCT(person_id)) as customer_count');
		$this->db->from('customers');		
		if ($this->params['customer_type'] == 1)
		{
			$this->db->where($this->db->dbprefix('customers').'.balance > ', 0);
		}
		if ($this->params['customer_type'] == 2)
		{
			$this->db->where($this->db->dbprefix('customers').'.balance = ', 0);
		}
		$this->db->where($this->db->dbprefix('customers').'.`lat` !=', 0);
		$this->db->where($this->db->dbprefix('customers').'.`long` !=', 0);
		$this->db->where($this->db->dbprefix('customers').'.deleted', 0);
		$this->db->where($this->db->dbprefix('customers').'.location_id', $this->params['current_location_id']);
		$ret = $this->db->get()->row_array();
		return $ret['customer_count'];
	}
	
}
?>