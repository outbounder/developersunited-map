<?php

class lib_service_serviceController extends k_Component 
{
	/**
	 * @var Smarty
	 */
	public $smarty;
	 
	public function __construct($dir)
	{
		$this->smarty = new Smarty();
		$this->smarty->template_dir = $dir.'/templates/';
		$this->smarty->compile_dir = $dir.'/templates_c/'; 
	}
	
	public function getPOST($name, $default = NULL)
	{
		return isset($_POST[$name])?$_POST[$name]:$default;
	}
	
	public function getGET($name, $default = NULL)
	{
		return isset($_GET[$name])?$_GET[$name]:$default;	
	}
}
?>