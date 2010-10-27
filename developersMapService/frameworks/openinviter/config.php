<?php
	$openinviter_settings=array(
		"username"=>"obiwon",
		"private_key"=>"a7373df96e60265a7c35cdeac11697ec",
		"cookie_path"=>'/tmp',
		"message_body"=>"You are invited to http://developersmap.wizartworx.com", // http://wizartworx.com is the website on your account. If wrong, please update your account at OpenInviter.com
		"message_subject"=>" is inviting you to http://developersmap.wizartworx.com", // http://wizartworx.com is the website on your account. If wrong, please update your account at OpenInviter.com
		"transport"=>"curl", //Replace "curl" with "wget" if you would like to use wget instead
		"local_debug"=>"on_error", //Available options: on_error => log only requests containing errors; always => log all requests; false => don`t log anything
		"remote_debug"=>FALSE //When set to TRUE OpenInviter sends debug information to our servers. Set it to FALSE to disable this feature
	);
	?>