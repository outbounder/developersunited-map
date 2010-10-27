package devs.united.states
{
	import devs.united.controller.AppMainController;
	
	import mx.core.FlexGlobals;
	
	import spark.components.Group;
	
	public class AppState extends Group implements IAppState
	{
		private var _appMainCtrl:AppMainController;
		
		public function AppState()
		{
			super();
			this._appMainCtrl = FlexGlobals.topLevelApplication.appMainCtrl;
		}
		
		public function get appMainCtrl():AppMainController
		{
			return this._appMainCtrl;
		}
	}
}