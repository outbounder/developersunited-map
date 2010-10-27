package devs.united.data.model
{
	import flash.net.URLVariables;
	
	public class DevData
	{
		public var id:int = -1;
		public var token:String;
		public var key:String;
		public var latitude:String;
		public var longitude:String;
		public var createdAt:String;
		
		public function DevData()
		{
		}
		
		public function updateFromXML(xml:XML):void
		{
			for each(var child:XML in xml.children())
			{
				this[child.@name] = child.toString();
			}
		}
		
		public function getURLVariables():URLVariables
		{
			var vars:URLVariables = new URLVariables();
			vars['token'] = this.token;
			vars['key'] = this.key;
			vars['latitude'] = this.latitude;
			vars['longitude'] = this.longitude;
			vars['createdAt'] = this.createdAt;
			return vars;
		}
	}
}
