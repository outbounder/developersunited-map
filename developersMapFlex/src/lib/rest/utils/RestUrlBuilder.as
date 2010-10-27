package lib.rest.utils
{
	public class RestUrlBuilder
	{
		public var root:String = "";
		public var addon:String = "";
		public var getParams:Array = new Array();
				
		public function RestUrlBuilder(root:String)
		{
			this.root = root;
		}
		
		public function append(path:String):void
		{
			if(path.indexOf("?") != -1 || path.indexOf("&") != -1 || path.indexOf("=") != -1)
				throw new Error("could not append to url addon an get param, use appendGetParam instead");
				
			this.addon += path;
		}
		
		public function appendGetParam(keyValuePair:String):void
		{
			this.getParams.push(keyValuePair);
		}
		
		protected function getParamsAsString():String
		{
			return this.getParams.join("&");
		}
		
		public function toString():String
		{
			if(this.getParams.length != 0)
				return this.root+this.addon+"?"+this.getParamsAsString();
			else
				return this.root+this.addon;
		}

	}
}