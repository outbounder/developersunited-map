<?php
class devs_data_access_devsDAO extends lib_data_access_dbconn
{
	public $tablename = 'devs';
	
	public function __construct()
	{
		parent::__construct();
		if(!$this->hasTable($this->tablename))
		{
			try
			{
				$result = $this->query(devs_data_model_devsData::getCreateTableQuery($this->tablename));
			}
			catch(PDOException $e)
			{
				die('could not create table entity '.$e->getMessage());
			}
		}
	}
	
	/**
	 * 
	 * @param $token
	 * @param $key
	 * @return number
	 */
	public function getDevId($token, $key)
	{
		$result = $this->query('SELECT id FROM '.$this->tablename." WHERE token = '$token' AND key = '$key'");
		$id = $result->fetchColumn();
		return $id;
	}
	
	/**
	 * 
	 * @param devs_data_model_devsData $dev
	 */
	public function addDev(devs_data_model_devsData  $dev)
	{
		$query = $dev->getInsertQuery('devs');
		$result = $this->query($query);
		$dev->id = $this->lastInsertId(); 
	}
	
	public function setDev(devs_data_model_devsData  $dev)
	{
		$query = $dev->getUpdateQuery('devs',array('token','key'));
		$result = $this->query($query);
	}
	
	/**
	 * 
	 * @param $token
	 * @param $key
	 * @return devs_data_model_devsData
	 */
	public function getDev($token, $key)
	{
		$query = 'SELECT * FROM '.$this->tablename." WHERE `token` LIKE '$token' AND `key` LIKE '$key'";
		$stm = $this->query($query);
		$row = $stm->fetch(PDO::FETCH_ASSOC);
		if($row)
			$dev = new devs_data_model_devsData($row);
		else
			$dev = new devs_data_model_devsData();
		return $dev;
	}
	
	/**
	 * 
	 * @param $offset
	 * @param $limit
	 * @return array of devs_data_model_devsData
	 */
	public function getDevList($offset,$limit)
	{
		$query = "SELECT * FROM $this->tablename ORDER BY id ASC LIMIT $limit OFFSET $offset";
		$result = $this->query($query);
		$devs = array();
		while($row = $result->fetch(PDO::FETCH_ASSOC))
		{
			$dev = new devs_data_model_devsData($row);
			$devs []= $dev; 
		}
		return $devs;
	}
	
	/**
	 * 
	 * @return number
	 */
	public function getDevCount()
	{
		$result = $this->query('SELECT count(id) as c FROM '.$this->tablename);
		$result = $result->fetch(PDO::FETCH_ASSOC);
		return $result['c'];
	}
}
?>