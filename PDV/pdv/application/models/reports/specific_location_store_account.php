<?php
require_once("report.php");
class Specific_location_store_account extends Report
{
	function __construct()
	{
		parent::__construct();
	}
	
	public function getDataColumns()
	{
		return array(array('data'=>lang('reports_id'), 'align'=>'left'),
		array('data'=>lang('reports_time'), 'align'=> 'left'),
		array('data'=>lang('reports_sale_id'), 'align'=> 'left'),
		array('data'=>lang('reports_customer'), 'align'=> 'left'),
		array('data'=>lang('reports_debit'), 'align'=> 'left'),
		array('data'=>lang('reports_credit'), 'align'=> 'left'),
		array('data'=>lang('reports_balance'), 'align'=> 'left'),
		array('data'=>lang('reports_items'), 'align'=> 'left'),		
		array('data'=>lang('reports_comment'), 'align'=> 'left'));
		
	}
	
	public function getData()
	{
		$this->db->from('store_accounts');
		$this->db->join('sales_items', 'sales_items.sale_id = store_accounts.sale_id');
		$this->db->where('location_id',$this->params['location_id']);
		
		
		if ($this->params['sale_type'] == 'sales')
		{
			$this->db->where('quantity_purchased > 0');
		}
		elseif ($this->params['sale_type'] == 'returns')
		{		
			$this->db->where('quantity_purchased < 0');
		}

		$this->db->where('date BETWEEN "'.$this->params['start_date'].'" and "'.$this->params['end_date'].'"');
		$this->db->group_by('store_accounts.sno');
		//If we are exporting NOT exporting to excel make sure to use offset and limit
		if (isset($this->params['export_excel']) && !$this->params['export_excel'])
		{
			$this->db->limit($this->report_limit);
			$this->db->offset($this->params['offset']);
		}
		
		$result = $this->db->get()->result_array();
		
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
		return $result;
		
	}
	
	public function getTotalRows()
	{
		$this->db->from('store_accounts');
		$this->db->where('location_id',$this->params['location_id']);
		$this->db->where('date BETWEEN "'.$this->params['start_date'].'" and "'.$this->params['end_date'].'"');
		return $this->db->count_all_results();
	}
		
	public function getSummaryData()
	{
		$summary_data= $this->Location->get_total_account($this->params['location_id'],$this->params['start_date'],$this->params['end_date']);
		return $summary_data;
	}
}
?>