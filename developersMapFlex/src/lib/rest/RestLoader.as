package lib.rest
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLVariables;
	
	import lib.rest.utils.RestRequest;
	import lib.rest.utils.RestResponse;
	
	[Event(name="complete",type="lib.rest.RestLoaderEvent")]
	[Event(name="fault",type="lib.rest.RestLoaderEvent")]
	[Event(name="progress",type="flash.events.ProgressEvent")]
	public class RestLoader extends EventDispatcher
	{
		public var dataVars:URLVariables;
		public var response:RestResponse;
		
		protected var request:RestRequest;
		protected var loader:URLLoader;
		
		public function RestLoader(url:String, method:String = "post")
		{
			this.dataVars = new URLVariables();
			
			this.loader = new URLLoader();
			this.loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHttpStatus);
			this.loader.addEventListener(Event.COMPLETE, onLoadComplete);
			this.loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadFailed);
			this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onLoadFailed);
			this.loader.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
			
			this.request = new RestRequest(url, method);
		}
		
		public function load():void
		{
			this.loader.load(this.request.toUrlRequest(this.dataVars));
		}
		
		private function onLoadProgress(e:ProgressEvent):void
		{
			this.dispatchEvent(e);
		}
		
		private function onHttpStatus(e:HTTPStatusEvent):void
		{
			trace("http status:"+e.status);
		}
		
		private function onLoadComplete(e:Event):void
		{
			try
			{
				this.response = new RestResponse(this.request, this.loader.data);
			}
			catch(e:Error)
			{
				trace(e, this.loader.data);
			}
			
			var event:RestLoaderEvent = new RestLoaderEvent(RestLoaderEvent.COMPLETE);
			event.response = response;
			this.dispatchEvent(event);
		}
		
		private function onLoadFailed(e:Event):void
		{
			var event:RestLoaderEvent = new RestLoaderEvent(RestLoaderEvent.FAILED);
			event.failedEventInfo = e;
			trace(e);
			this.dispatchEvent(event);
		}

	}
}