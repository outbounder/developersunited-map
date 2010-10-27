package devs.united.states.content.map
{
	import com.google.maps.LatLng;
	import com.google.maps.overlays.Marker;
	
	import devs.united.components.map.DevsUnitedMap;
	import devs.united.controller.AppMainController;
	import devs.united.data.access.DevMapService;
	import devs.united.data.model.DevData;
	
	import lib.rest.RestLoaderEvent;
	
	import mx.collections.ArrayCollection;
	import mx.managers.ICursorManager;

	public class MapController
	{
		private var map:DevsUnitedMap;
		private var devsService:DevMapService;
		private var appMainCtrl:AppMainController;
		private var cursorManager:ICursorManager;
		
		private var curDevsOffset:int;
		private var devsCount:int;
		private var devListStep:int = 100;
		
		public function MapController(map:DevsUnitedMap, devsService:DevMapService, appMainCtrl:AppMainController, 
			cursorManager:ICursorManager)
		{
			this.map = map;
			this.devsService = devsService;
			this.appMainCtrl = appMainCtrl;
			this.cursorManager = cursorManager;
		}
		
		public function handleStateChange(value:String):void
		{
			switch(value)
			{
				case 'showme':
					this.map.clearMarkers();
					// check if dev is already created.
					if(this.appMainCtrl.dev.id == -1)
					{
						// get dev data because is missing
						this.cursorManager.setBusyCursor();
						this.devsService.getDevOnMap(this.appMainCtrl.dev.token, this.appMainCtrl.dev.key, onGetDevResult);
					}
					else
					{
						// use current dev data
						var dev:DevData = this.appMainCtrl.dev;
						this.map.createMarker(new LatLng(Number(dev.latitude), Number(dev.longitude)), true);
					}
				break;
				case 'showall':
					this.map.clearMarkers();
				    // start retrieving all devs ;)
					this.cursorManager.setBusyCursor();
					this.devsCount = 0;
					this.curDevsOffset = 0;
					this.devsService.getDevsCountOnMap(onDevsCountResult);
				break;
			}
		}
		
		private function onDevsCountResult(e:RestLoaderEvent):void
		{
			this.devsCount = this.devsService.getDevsCount(e);
			this.devsService.getDevsOnMap(this.curDevsOffset, this.devListStep, onDevsListResult);
		}
		
		private function onDevsListResult(e:RestLoaderEvent):void
		{
			this.curDevsOffset += this.devListStep;
			if(this.curDevsOffset >= this.devsCount)
			{
				this.cursorManager.removeBusyCursor();
			}
			else
			{
				this.devsService.getDevsOnMap(this.curDevsOffset, this.devListStep, onDevsListResult);
			}
			
			var devs:ArrayCollection = this.devsService.getDevListData(e);
			for each(var dev:DevData in devs)
			{
				this.map.createMarker(new LatLng(Number(dev.latitude), Number(dev.longitude)), false);
			}
		}
		
		private function onGetDevResult(e:RestLoaderEvent):void
		{
			var dev:DevData = this.devsService.getDevData(e);
			
			if(dev.id == -1) // check if the developer actually is stored in DB
			{
				// developer does not exist, so place it on random
				var marker:Marker = this.map.createRandomMarker();
				// fill out development data
				dev.latitude = String(marker.getLatLng().lat());
				dev.longitude = String(marker.getLatLng().lng());
				dev.token = this.appMainCtrl.dev.token;
				dev.key = this.appMainCtrl.dev.key;
				dev.createdAt = (new Date()).toUTCString();
				// add development data to service & wait
				this.devsService.addDevToMap(dev, onAddDevResult);
			}
			else
			{
				// developer exists with given token & key, create marker according to it.
				this.cursorManager.removeBusyCursor();
				this.map.createMarker(new LatLng(Number(dev.latitude), Number(dev.longitude)), true);
				this.appMainCtrl.dev = dev;
			}
		}
		
		private function onAddDevResult(e:RestLoaderEvent):void
		{
			this.cursorManager.removeBusyCursor();
			var dev:DevData = this.devsService.getDevData(e);
			this.appMainCtrl.dev = dev;
		}
	}
}