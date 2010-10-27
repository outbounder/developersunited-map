<?php
class devs_getController extends lib_service_serviceController
{
	public function __construct()
	{
		parent::__construct(dirname(__FILE__));
	}
	
	function GET()
	{
		$dao = new devs_data_access_devsDAO();
		$dev = $dao -> getDev($_GET['token'],$_GET['key']);
		$this->smarty->assign_by_ref('dev',$dev);
		throw new lib_service_serviceResponse('<dev>'.$this->smarty->fetch('devData.xml').'</dev>');
	}
}
?>