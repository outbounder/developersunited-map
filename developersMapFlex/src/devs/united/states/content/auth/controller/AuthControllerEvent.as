package devs.united.states.content.auth.controller
{
	import devs.united.data.model.OpenLoginResponse;
	
	import flash.events.Event;
	
	public class AuthControllerEvent extends Event
	{
		public static const AUTH_COMPLETE:String = "authComplete";
		
		public var response:OpenLoginResponse;
		
		public function AuthControllerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}