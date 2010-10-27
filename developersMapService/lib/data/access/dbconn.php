<?php

class lib_data_access_dbconn extends PDO
{
	/**
	 * @var config_dbconfig
	 */
	public $dbconfig;
	
	public $link;
	
	public function __construct()
	{
		$this->dbconfig = new config_dbconfig();
		
		try
		{
			// try to access the db
			parent::__construct($this->dbconfig->getDNS(),$this->dbconfig->username, $this->dbconfig->password);
		}
		catch(PDOException $e)
		{
			die('database connection failed to '.$this->dbconfig->server.' at user '.$this->dbconfig->username.' with '.$e->getMessage());
		}
	}
	
	protected function hasTable($name)
	{
		try
		{
			$result = $this->query("SHOW TABLES LIKE '$name'");
		}
		catch(PDOException $e)
		{
			return FALSE;
		}
		
		return $result->rowCount == 1;
	}
}
?>