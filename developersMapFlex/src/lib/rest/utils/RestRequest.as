package lib.rest.utils
{
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class RestRequest
	{
		public var url:String;
		public var method:String;
		
		public function RestRequest(url:String,method:String)
		{
			this.url = url;
			this.method = method;
		}
		
		public function toUrlRequest(vars:URLVariables):URLRequest
		{
			var request:URLRequest = new URLRequest(this.url);
			var header:URLRequestHeader = new URLRequestHeader('pragma', 'no-cache');
			request.requestHeaders.push(header);
			if(this.method == "get")
				request.method = URLRequestMethod.GET;
			if(this.method == "post")
				request.method = URLRequestMethod.POST;
				
			request.data = vars;
			
			return request;
		}

	}
}