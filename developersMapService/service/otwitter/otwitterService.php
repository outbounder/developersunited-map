<?php
class otwitter_otwitterService extends lib_service_serviceController
{
	public function __construct()
	{
		parent::__construct(dirname(__FILE__));
	}
	
	function map($name)
	{
		return "otwitter_otwitterService";
	}
	
	function POST()
	{
		
		$opt[CURLOPT_USERPWD] = $_POST['user'].":".$_POST['pass'];
		$opt[CURLOPT_URL] = "http://twitter.com/".$_POST['addon'];
		$opt[CURLOPT_HEADER] = 0;
		$opt[CURLOPT_RETURNTRANSFER] = 1;
		
		//do the request
		$curl = curl_init();
		curl_setopt_array($curl, $opt);

		$response = curl_exec($curl);
		
		curl_close($curl);
		
		throw new lib_service_serviceResponse($response);
	}
}
?>