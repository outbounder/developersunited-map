package devs.united.data.model
{
	public class OpenLoginResponse
	{
		public var authOK:Boolean = false;
		public var accountType:String;
		
		public function OpenLoginResponse(type:String, ok:Boolean)
		{
			this.authOK = ok;
			this.accountType = type;
		}
	}
}