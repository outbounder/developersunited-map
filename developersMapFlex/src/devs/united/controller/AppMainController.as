package devs.united.controller
{
	import devs.united.data.model.DevData;
	
	import lib.rest.utils.appURL;
	
	import mx.core.FlexGlobals;

	[Bindable]
	public class AppMainController
	{
		public var restServiceRoot:String;
		public var dev:DevData = new DevData();
		
		public function AppMainController(debugRestServiceRoot:String)
		{
			if(appURL.getHostName(FlexGlobals.topLevelApplication.url)==null)
				this.restServiceRoot = appURL.validateURLpath(debugRestServiceRoot);
			else
				this.restServiceRoot = appURL.getHostName(FlexGlobals.topLevelApplication.url)+"/www/";	
		}
	}
}