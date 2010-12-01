// ActionScript file
package model
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import vo.CricketInfoProfile;

	// cricket profile proxy object, we use it to 
	// communicate with server fetching various
	// user properties
	public class CricketInfoProfileProxy extends Proxy
	{
		public static const NAME:String = "CricketInfoProfileProxy";
		
		public function CricketInfoProfileProxy()
		{
			super(NAME, null);
		}
		
		public function GetCricketInfoProfile():CricketInfoProfile
		{
			// lazy loading from server upon first access
			if (getData() == null)
			{
				loadCricketInfoProfile();
			}
			
			return getData() as CricketInfoProfile;
		}
		
		public function loadCricketInfoProfile():void
		{
			// TODO: load cricket profile according to sns user id from server
			var profile:CricketInfoProfile = new CricketInfoProfile();
			profile.UserID = 0;
			profile.UserName = "Test User";
			profile.nickName = "mcgrady";
			profile.level = 5;
			profile.strength = 20;
			profile.agility = 10;
			profile.stamina = 15;
			profile.power = 100;
			profile.hungerValue = 80;
			profile.winRatio = 82.3;
			profile.title = "大将军";
			setData(profile);
			return;
		}
	}
}