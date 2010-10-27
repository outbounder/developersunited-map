package lib.rest
{
	import flash.events.Event;
	
	import lib.rest.utils.RestResponse;

	public class RestLoaderEvent extends Event
	{
		public static const COMPLETE:String = "complete";
		public static const FAILED:String = "failed";
		
		public var response:RestResponse = null;
		public var failedEventInfo:Event;
		
		public function RestLoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}