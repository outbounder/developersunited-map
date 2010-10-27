<?php
class devs_addController extends lib_service_serviceController
{
	public function __construct()
	{
		parent::__construct(dirname(__FILE__));
	}
	
	function GET()
	{
		$dao = new devs_data_access_devsDAO();
		$dev = new devs_data_model_devsData($_GET);
		$dao -> addDev($dev);
		$this->smarty->assign_by_ref('dev', $dev);
		throw new lib_service_serviceResponse('<dev>'.$this->smarty->fetch('devData.xml').'</dev>');
	}
}
?>