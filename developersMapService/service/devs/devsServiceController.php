<?php
class devs_devsServiceController extends lib_service_serviceController
{
	public function __construct()
	{
		parent::__construct(dirname(__FILE__));
	}
	
	function map($name)
	{
		if($name == "devs.php")
			return "devs_devsServiceController";
		return 'devs_'.$name.'Controller';
	}
}
?>