<?php
class devs_countController extends lib_service_serviceController
{
	public function __construct()
	{
		parent::__construct(dirname(__FILE__));
	}
	
	function GET()
	{
		$dao = new devs_data_access_devsDAO();
		$count = $dao->getDevCount();
		if(empty($count))
			$count = "0";
		throw new lib_service_serviceResponse("<count>$count</count>");
	}
}
?>