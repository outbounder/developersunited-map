package devs.united.states.content.auth.controller
{
	import devs.united.data.access.OpenLoginService;
	
	import flash.events.EventDispatcher;
	
	import lib.rest.RestLoaderEvent;
	
	[Event(name="authComplete", type="devs.united.states.content.auth.controller.AuthControllerEvent")]
	public class AuthController extends EventDispatcher
	{
		private var restServiceRoot:String;
		private var loginService:OpenLoginService;
		
		public function AuthController(restServiceRoot:String)
		{
			this.restServiceRoot = restServiceRoot;
		}
		
		public function showme(username:String,password:String):void
		{
			this.loginService = new OpenLoginService(this.restServiceRoot);
			this.loginService.login(username, password, onLoginServiceResponse);
		}
		
		private function onLoginServiceResponse(e:RestLoaderEvent):void
		{
			var event:AuthControllerEvent = new AuthControllerEvent(AuthControllerEvent.AUTH_COMPLETE);
			event.response = this.loginService.isLoginSuccessful(e.response.asXML);
			this.dispatchEvent(event);
		}
	}
}