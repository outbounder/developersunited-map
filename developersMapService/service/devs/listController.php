<?php
class devs_listController extends lib_service_serviceController
{
	public function __construct()
	{
		parent::__construct(dirname(__FILE__));
	}
	
	function GET()
	{
		$dao = new devs_data_access_devsDAO();
		$devs = $dao->getDevList($this->getGET('offset',0),$this->getGET('limit',0));
		$this->smarty->assign_by_ref('devs',$devs);
		throw new lib_service_serviceResponse($this->smarty->fetch('devsList.xml'));
	}
}
?>