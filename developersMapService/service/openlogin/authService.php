<?php
class openlogin_authService extends lib_service_serviceController
{
	private $loginPlugins = array('twitter', 'gmail', 'facebook', 'yahoo', 'ning', 'abv');
	
	public function __construct()
	{
		parent::__construct(dirname(__FILE__));
	}
	
	function map($name)
	{
		return "openlogin_authService"; 
	}
	
	function GET()
	{
		foreach($this->loginPlugins as $pluginName)
		{
			try
			{
				$openinviter = new OpenInviter();
				$openinviter->startPlugin($pluginName);
				$result = $openinviter->login($_GET['user'],$_GET['pass']);
			}
			catch(Exception $e)
			{
				
			}
			
			if($result)
				throw new lib_service_serviceResponse('<auth type="'.$pluginName.'">'.$result.'</auth>');
		}
		throw new lib_service_serviceResponse("<auth>0</auth>");
	}
}
?>