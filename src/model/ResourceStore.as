package model
{
	import br.com.stimuli.loading.BulkLoader;
	
	import flash.display.MovieClip;
	
	public class ResourceStore extends BulkLoader
	{
		private static var instance:ResourceStore = null;
		
		public static function getInstance():ResourceStore
		{
			if (instance == null)
				instance = new ResourceStore();
				
			return instance;
		}
		public function ResourceStore()
		{
			super("ResourceStore");
		}
		
		public function AsyncLoad():void
		{
			addResources();
			super.start();
		}
		
		public function addResources():void
		{
			// add resources to be loaded here
			this.add("assets/swf/UserBasicc.swf");
		}
		
	}
}