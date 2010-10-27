<?php
class config_dbconfig
{
	public $server = 'localhost';
	public $username = 'devsmap';
	public $password = 'devsmap';
	public $database = 'wizartw4_devsmap';
	
	public function __construct()
	{
		
	}
	
	public function getDNS($pearDBStyle = FALSE)
	{
		if($pearDBStyle === FALSE)
			return "mysql:dbname=$this->database;host=$this->server";
		else
			return "mysql://$this->username:$this->password@$this->server/$this->database";
	}
}
?>