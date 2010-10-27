<?php
class lib_service_serviceResponse extends k_HttpResponse 
{
	public function __construct($content = "")
	{
		parent::__construct(200, $content, true);
		$this->setContentType('text/xml');
		$this->setCharset(new k_charset_Utf8());
	}
}
?>