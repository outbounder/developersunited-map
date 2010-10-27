package devs.united.data.access
{
	import flash.net.URLVariables;
	
	import lib.rest.access.RestLoader;
	import lib.rest.access.RestService;
	import lib.rest.access.utils.RestUrlBuilder;

	public class OTwitterService extends RestService
	{
		public function OTwitterService(restServiceRoot:String)
		{
			super(restServiceRoot);
		}
		
		protected override function getUrlBuilder(addon:String) : RestUrlBuilder
		{
			var url:RestUrlBuilder = super.getUrlBuilder(addon);
			url.addon = 'otwitter.php/'+addon;
			return url;
		}
		
		
		public function login(username:String, password:String, onLoginComplete:Function):RestLoader
		{
			var vars:URLVariables = new URLVariables();
			vars['user'] = username;
			vars['pass'] = password;
			vars['addon'] = "account/verify_credentials.xml";
			return super.loadRestData("", vars, onLoginComplete, onLoginComplete);
		}
		
		
		public function isLoginSuccessful(loginResult:XML):Boolean
		{
			if(loginResult.error.length() > 0)
				return false;
			else
				return true;
		}
		
	}
}