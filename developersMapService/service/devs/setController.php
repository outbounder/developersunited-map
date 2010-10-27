<?php
class devs_setController extends lib_service_serviceController
{
	public function __construct()
	{
		parent::__construct(dirname(__FILE__));
	}
	
	function GET()
	{
		$dao = new devs_data_access_devsDAO();
		$dev = new devs_data_model_devsData($_GET);
		$dao -> setDev($dev);
		throw new lib_service_serviceResponse('<done />');
	}
}
?>