package model
{	
	import vo.UserBasicInfoProfile;
	
	public class UserData
	{
		
		private static var _instance:UserData;
		
		private var _anData:UserBasicInfoProfile;	//玩家基本信息
				
		public function set anData(value:UserBasicInfoProfile):void
		{
			_anData = value; 
		}
		public function get anData():UserBasicInfoProfile
		{
			return _anData;
		}
	
		public function UserData()
		{
			if(_instance != null){
				throw new Error("This is singler");
			}
		}
		public static function getInstance():UserData
		{
			return instance;
		}
		public static function get instance():UserData
		{
			if(_instance == null){
				_instance = new UserData();
			}
			return _instance;
		} 
	}
}