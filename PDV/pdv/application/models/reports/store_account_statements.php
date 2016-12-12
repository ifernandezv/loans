<?php
require_once("report.php");
class Store_account_statements extends Report
{
	function __construct()
	{
		parent::__construct();
	}
	
	public function getDataColumns()
	{
		return array();	
	}
	
	public function getData()
	{
		$return = array();
		
		$customer_ids_for_report = array();
		$customer_id = $this->params['customer_id'];
		$location_id = $this->params['location_id'];
			
		if ($customer_id == -1)
		{
			if ($location_id == -1)
			{
				$this->db->distinct();
				$this->db->select('store_accounts.customer_id');
				$this->db->from('store_accounts');
				$this->db->join('customers', 'customers.person_id = store_accounts.customer_id');
				$this->db->join('sales', 'sales.sale_id = store_accounts.sale_id');
				$this->db->where('customers.balance !=', 0);
				$this->db->where('customers.deleted',0);
			//	$this->db->where('customers.location_id',$location_id);
				$this->db->limit($this->report_limit);
				$this->db->offset($this->params['offset']);
				$result = $this->db->get()->result_array();
					
				foreach($result as $row)
				{
					$customer_ids_for_report[] = $row['customer_id'];
				}
			}
			else 
			{
				$this->db->distinct();
				$this->db->select('store_accounts.customer_id');
				$this->db->from('store_accounts');
				$this->db->join('customers', 'customers.person_id = store_accounts.customer_id');
				$this->db->join('sales', 'sales.sale_id = store_accounts.sale_id');
				$this->db->where('customers.balance !=', 0);
				$this->db->where('customers.deleted',0);
				$this->db->where('customers.location_id',$location_id);
				$this->db->limit($this->report_limit);
				$this->db->offset($this->params['offset']);
				$result = $this->db->get()->result_array();
					
				foreach($result as $row)
				{
					$customer_ids_for_report[] = $row['customer_id'];
				}
			}
			
		}
		else
		{ 
			if ($location_id == -1)
			{
				$this->db->select('person_id');
				$this->db->from('customers');
				$this->db->where('balance !=', 0);
				$this->db->where('person_id', $this->params['customer_id']);
			//	$this->db->where('location_id',$location_id);
				$this->db->where('deleted',0);
				
				$result = $this->db->get()->row_array();
				
				if (!empty($result))
				{
					$customer_ids_for_report[] = $result['person_id'];
				}
			}
			else 
			{
				$this->db->select('person_id');
				$this->db->from('customers');
				$this->db->where('balance !=', 0);
				$this->db->where('person_id', $this->params['customer_id']);
				$this->db->where('location_id',$location_id);
				$this->db->where('deleted',0);
				
				$result = $this->db->get()->row_array();
				
				if (!empty($result))
				{
					$customer_ids_for_report[] = $result['person_id'];
				}
				
			}
		}
		
	if ($location_id==-1)
	{			
		foreach($customer_ids_for_report as $customer_ids)
			{
				$this->db->from('store_accounts');
				$this->db->where('store_accounts.customer_id', $customer_ids);
				$this->db->join('sales', 'sales.sale_id = store_accounts.sale_id');
				
				if ($this->params['pull_payments_by'] == 'payment_date')
				{
					$this->db->where('date >=', $this->params['start_date']);
					$this->db->where('date <=', $this->params['end_date']. '23:59:59');				
					$this->db->order_by('date');
				}
				else
				{
					$this->db->where('sale_time >=', $this->params['start_date']);
					$this->db->where('sale_time <=', $this->params['end_date']. '23:59:59');
					$this->db->order_by('sale_time');
				}
				
				
				$result = $this->db->get()->result_array();
			
			//If we don't have results from this month, pull the last store account entry we have
				if (count($result) == 0)
				{
					$this->db->from('store_accounts');
					$this->db->where('store_accounts.customer_id', $customer_ids);
					$this->db->join('sales', 'sales.sale_id = store_accounts.sale_id');
					$this->db->limit(1);
					if ($this->params['pull_payments_by'] == 'payment_date')
					{
						$this->db->order_by('date', 'DESC');
					}
					else
					{
						$this->db->order_by('sale_time', 'DESC');
					}
				
					$this->db->limit(1); 	
					$result = $this->db->get()->result_array();
					
				}
				
				for ($k=0;$k<count($result);$k++)
				{
					$item_names = array();
					$sale_id = $result[$k]['sale_id'];
					$this->db->select('name');
					$this->db->from('items');
					$this->db->join('sales_items', 'sales_items.item_id = items.item_id');
					$this->db->where('sale_id', $sale_id);
					
					foreach($this->db->get()->result_array() as $row)
					{
						$item_names[] = $row['name'];
					}
					
					$this->db->select('name');
					$this->db->from('item_kits');
					$this->db->join('sales_item_kits', 'sales_item_kits.item_kit_id = item_kits.item_kit_id');
					$this->db->where('sale_id', $sale_id);
					
					foreach($this->db->get()->result_array() as $row)
					{
						$item_names[] = $row['name'];
					}
					
					$result[$k]['items'] = implode(', ', $item_names);
				}

				$return[]= array('customer_info' => $this->Customer->get_info($customer_ids),'store_account_transactions' => $result);

			}
	}
	else 
	{
		foreach($customer_ids_for_report as $customer_ids)
		{
			$this->db->from('store_accounts');
			$this->db->where('store_accounts.customer_id', $customer_ids);
			$this->db->join('sales', 'sales.sale_id = store_accounts.sale_id');
			
			if ($this->params['pull_payments_by'] == 'payment_date')
			{
				
				$this->db->where('date >=', $this->params['start_date']);
				$this->db->where('date <=', $this->params['end_date']. '23:59:59');		
				$this->db->where('sales.location_id',$location_id);		
				$this->db->order_by('date');
			}
			else
			{
				$this->db->where('sale_time >=', $this->params['start_date']);
				$this->db->where('sale_time <=', $this->params['end_date']. '23:59:59');
				$this->db->where('sales.location_id',$location_id);
				$this->db->order_by('sale_time');
			}

			$result = $this->db->get()->result_array();
		
		//If we don't have results from this month, pull the last store account entry we have
			if (count($result) == 0)
			{
				$this->db->from('store_accounts');
				$this->db->where('store_accounts.customer_id', $customer_ids);
				$this->db->join('sales', 'sales.sale_id = store_accounts.sale_id');
				$this->db->limit(1);
				if ($this->params['pull_payments_by'] == 'payment_date')
				{
					$this->db->order_by('date', 'DESC');
				}
				else
				{
					$this->db->order_by('sale_time', 'DESC');
				}
			
				$this->db->limit(1); 	
				$result = $this->db->get()->result_array();
				
			}
			
			for ($k=0;$k<count($result);$k++)
			{
				$item_names = array();
				$sale_id = $result[$k]['sale_id'];
				
				$this->db->select('name');
				$this->db->from('items');
				$this->db->join('sales_items', 'sales_items.item_id = items.item_id');
				$this->db->where('sale_id', $sale_id);
				
				foreach($this->db->get()->result_array() as $row)
				{
					$item_names[] = $row['name'];
				}
				
				$this->db->select('name');
				$this->db->from('item_kits');
				$this->db->join('sales_item_kits', 'sales_item_kits.item_kit_id = item_kits.item_kit_id');
				$this->db->where('sale_id', $sale_id);
				
				foreach($this->db->get()->result_array() as $row)
				{
					$item_names[] = $row['name'];
				}
				
				$result[$k]['items'] = implode(', ', $item_names);
			}

				$return[]= array('customer_info' => $this->Customer->get_info($customer_ids),'store_account_transactions' => $result);
		}
		
	}
		
		return $return;
	}
	
	public function getTotalRows()
	{
		$customer_id = $this->params['customer_id'];
		$location_id = $this->params['location_id'];
		
		if ($customer_id == -1)
		{
		
				$query = mysql_query( "SELECT DISTINCT * FROM ".$this->db->dbprefix('store_accounts')." WHERE ".$this->db->dbprefix('store_accounts').".sno IN (SELECT MAX(".$this->db->dbprefix('store_accounts').".sno) FROM ".$this->db->dbprefix('store_accounts')." GROUP BY ".$this->db->dbprefix('store_accounts').".customer_id) AND ".$this->db->dbprefix('store_accounts').".location_id ='".$location_id."' AND ".$this->db->dbprefix('store_accounts').".balance != '0'");
		
		return mysql_num_rows($query);
			
		}
		else
		{
			$this->db->distinct();
			$this->db->select('store_accounts.customer_id');
			$this->db->from('store_accounts');
			$this->db->where('sales.location_id =', $location_id);
			$this->db->join('sales', 'sales.sale_id = store_accounts.sale_id');
			$this->db->where('store_accounts.customer_id', $customer_id);
			$this->db->where('balance !=', 0);
			$this->db->group('store_accounts.customer_id');
			return $this->db->get()->num_rows();
		}
		
		
	}
	
	
	public function getSummaryData()
	{
		return array();
	}
}
?>