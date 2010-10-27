package lib.rest
{
	import flash.net.URLVariables;
	
	import lib.rest.utils.RestUrlBuilder;
	
	public class RestService
	{
		public var restServiceRoot:String;
		
		public function RestService(restServiceRoot:String)
		{
			this.restServiceRoot = restServiceRoot;
		}
		
		protected function getUrlBuilder(addon:String):RestUrlBuilder
		{
			var url:RestUrlBuilder = new RestUrlBuilder(this.restServiceRoot);
			url.append(addon);
			return url;
		}
		
		protected function appendDefaultDataVars(vars:URLVariables):void
		{
			
		}
		
		protected function loadRestData(urlAddon:String, vars:URLVariables, 
			onLoadComplete:Function, onLoadFailed:Function, method:String ):RestLoader
		{
			if(vars == null)
				vars = new URLVariables();
				
			var loader:RestLoader = new RestLoader(this.getUrlBuilder(urlAddon).toString(), method);
			loader.dataVars = vars;
			this.appendDefaultDataVars(loader.dataVars);
			loader.addEventListener(RestLoaderEvent.COMPLETE, onLoadComplete);
			loader.addEventListener(RestLoaderEvent.FAILED, onLoadFailed);
			loader.load();
			return loader;
		}
	}
}