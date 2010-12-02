package controls
{
	public class Version
	{
		public static const VERSION:String = "2.0";
		public static var config:String = "1";
				
		public static function add(url:String):String
		{
			//return url = url + "?v=" + Version.config + "&vv=" + Version.VERSION;
			return url = url + "?v=" +Version.VERSION+"."+Version.config;
		}
	}
}