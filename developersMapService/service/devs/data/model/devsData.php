<?php
class devs_data_model_devsData
{
	public $id = -1;
	public $token = "";
	public $key = "";
	public $latitude = "";
	public $longitude = "";
	public $createdAt = "";
	
	public function __construct($array = array())
	{
		foreach($array as $key => $value)
		{
			$this->$key = $value;
		}
	}
	
	public static function getCreateTableQuery($tableName)
	{
		return "CREATE TABLE `$tableName` 
				(
					`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
					`token` TEXT NULL, 
					`key` TEXT NULL,
					`latitude` TEXT NULL,
					`longitude` TEXT NULL,
					`createdAt` TEXT NULL
				) ENGINE = MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci";
	}
	
	public function getInsertQuery($tableName)
	{
		$columns = array();
		$values = array();
		foreach($this as $key => $value)
		{
			if($key == 'id')
				continue;
			if(empty($value))
				continue;
				
			$columns []= "`".$key."`";
			$values	[]= "'".$value."'";
		}
		$columns = implode(',',$columns);
		$values = implode(',',$values);
		
		return "INSERT INTO `$tableName` 
				($columns)
				VALUES
				($values)";
	}
	
	public function getUpdateQuery($tableName, $whereNames )
	{
		$where = array();
		$vars = array();
		foreach($this as $key => $value)
		{
			if($key == 'id')
				continue;
			if(empty($value))
				continue;
			if(in_array($key,$whereNames))
				$where []= "`$key` = '$value'";
			else
				$vars []= "`$key` = '$value'";
		}
		$where = implode('AND', $where);
		$vars = implode(',',$vars);
		
		return "UPDATE $tableName SET $vars WHERE $where";
	}
}
?>