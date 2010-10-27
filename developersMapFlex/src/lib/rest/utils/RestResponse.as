package lib.rest.utils
{
	public class RestResponse
	{
		public var source:RestRequest;
		public var data:Object;
		
		public function RestResponse(source:RestRequest, data:Object)
		{
			this.source = source;
			this.data = data;
		}
		
		public function get asXML():XML
		{
			try
			{
				return XML(data);
			}	
			catch(e:Error)
			{
				trace('notice', e.toString());
			}
			return null;
		}

	}
}