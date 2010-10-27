package devs.united.data.access
{
	import devs.united.data.model.DevData;
	
	import flash.net.URLVariables;
	
	import lib.rest.RestLoader;
	import lib.rest.RestLoaderEvent;
	import lib.rest.RestService;
	
	import mx.collections.ArrayCollection;
	
	public class DevMapService extends RestService
	{
		public function DevMapService(restServiceRoot:String)
		{
			super(restServiceRoot);
		}
		
		public function setDevToMap(devData:DevData, onResultHandler:Function):RestLoader
		{
			var vars:URLVariables = devData.getURLVariables();
			return super.loadRestData("devs.php/set", vars, onResultHandler, onResultHandler, 'get');
		}
		
		public function addDevToMap(devData:DevData, onResultHandler:Function):RestLoader
		{
			var vars:URLVariables = devData.getURLVariables();
			return super.loadRestData("devs.php/add", vars, onResultHandler, onResultHandler, 'get');
		}
		
		public function getDevsCountOnMap(onResultHandler:Function):RestLoader
		{
			return super.loadRestData("devs.php/count", null, onResultHandler, onResultHandler, 'get');
		}
		
		public function getDevsOnMap(offset:int, limit:int, onResultHandler:Function):RestLoader
		{
			var vars:URLVariables = new URLVariables();
			vars['offset'] = offset;
			vars['limit'] = limit;
			return super.loadRestData("devs.php/list", vars, onResultHandler, onResultHandler, 'get');
		}
		
		public function getDevOnMap(token:String, key:String, onResultHandler:Function):RestLoader
		{
			var vars:URLVariables = new URLVariables();
			vars['token'] = token;
			vars['key'] = key;
			return super.loadRestData('devs.php/get', vars, onResultHandler, onResultHandler,'get');  
		}
		
		public function getDevData(e:RestLoaderEvent):DevData
		{
			var dev:DevData = new DevData();
			dev.updateFromXML(e.response.asXML);
			return dev;
		}
		
		public function getDevListData(e:RestLoaderEvent):ArrayCollection
		{
			var result:ArrayCollection = new ArrayCollection();
			var xml:XML = e.response.asXML;
			for each(var devXML:XML in xml..dev)
			{
				var dev:DevData = new DevData();
				dev.updateFromXML(devXML);
				result.addItem(dev);
			}
			return result;
		}
		
		public function getDevsCount(e:RestLoaderEvent):int
		{
			return int(e.response.asXML.toString());
		}
	}
}