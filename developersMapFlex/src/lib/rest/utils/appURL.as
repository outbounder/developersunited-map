package lib.rest.utils
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.core.Application;
	
	public class appURL
	{
		public function appURL()
		{
		}

		public static function getHostName(url:String):String
		{
			if(url.indexOf("file:///") == 0)
				return null;
			else
				return url.substring(0,url.indexOf("/",8));
		}
		
		public static function validateURLpath(url:String):String
		{
			var result:String = url;
			if(result.indexOf("http://") == -1)
				result = "http://"+result;
			if(result.lastIndexOf("/") != result.length-1)
				result += "/";
			return result;
		}
	}
}