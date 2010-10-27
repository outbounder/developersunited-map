package devs.united.data.access
{
	import devs.united.data.model.OpenLoginResponse;
	
	import flash.net.URLVariables;
	
	import lib.rest.RestLoader;
	import lib.rest.RestService;
	import lib.rest.utils.RestUrlBuilder;
	
	public class OpenLoginService extends lib.rest.RestService
	{
		public function OpenLoginService(restServiceRoot:String)
		{
			super(restServiceRoot);
		}
		
		protected override function getUrlBuilder(addon:String) : RestUrlBuilder
		{
			var url:RestUrlBuilder = super.getUrlBuilder(addon);
			url.addon = 'openlogin.php'+addon;
			return url; 
		}
		
		public function login(username:String, password:String, onLoginResult:Function):RestLoader
		{
			var vars:URLVariables = new URLVariables();
			vars['user'] = username;
			vars['pass'] = password;
			return super.loadRestData("", vars, onLoginResult, onLoginResult, 'get');
		}
		
		public function isLoginSuccessful(loginResponse:XML):OpenLoginResponse
		{
			if(loginResponse.toString() == "1")
				return new OpenLoginResponse(loginResponse.@type, true);
			else
				return new OpenLoginResponse(null, false);
		}
	}
}