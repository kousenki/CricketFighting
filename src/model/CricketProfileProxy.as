// ActionScript file
package model
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import vo.CricketProfile;

	// cricket profile proxy object, we use it to 
	// communicate with server fetching various
	// user properties
	public class CricketProfileProxy extends Proxy
	{
		public static const NAME:String = "CricketProfileProxy";
		
		public function CricketProfileProxy()
		{
			super(NAME, null);
		}
		
		public function GetCricketProfile():CricketProfile
		{
			// lazy loading from server upon first access
			if (getData() == null)
			{
				loadCricketProfile();
			}
			
			return getData() as CricketProfile;
		}
		
		public function loadCricketProfile():void
		{
			// TODO: load cricket profile according to sns user id from server
			var profile:CricketProfile = new CricketProfile();
			profile.UserID = 0;
			profile.UserName = "Test User";
			setData(profile);
			return;
		}
	}
}