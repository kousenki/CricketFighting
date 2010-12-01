package model
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import vo.UserProfile;

	// user profile proxy object, we use it to 
	// communicate with server fetching various
	// user properties
	public class UserProfileProxy extends Proxy
	{
		public static const NAME:String = "UserProfileProxy";
		
		public function UserProfileProxy()
		{
			super(NAME, null);
		}
		
		public function GetUserProfile():UserProfile
		{
			// lazy loading from server upon first access
			if (getData() == null)
			{
				loadUserProfile();
			}
			
			return getData() as UserProfile;
		}
		
		public function loadUserProfile():void
		{
			// TODO: load user profile according to sns user id from server
			var profile:UserProfile = new UserProfile();
			profile.UserID = 0;
			profile.UserName = "Test User";
			setData(profile);
			return;
		}
	}
}