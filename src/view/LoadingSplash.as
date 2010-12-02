package view
{
	import flash.display.Sprite;
	import controls.Version;

	public class LoadingSplash extends Sprite
	{
		public function LoadingSplash()
		{
			super();
			initBulkLoader();
		}
		
		private function initBulkLoader():void{
			ibulkLoader=BulkLoader.getLoader("PreLoad");
			if(ibulkLoader==null)
				ibulkLoader = new BulkLoader("PreLoad");
			
			ibulkLoader.addEventListener(BulkLoader.PROGRESS, onResProgressHandler);
			ibulkLoader.addEventListener(BulkLoader.COMPLETE, onResCompleteHandler);
			ibulkLoader.addEventListener(ErrorEvent.ERROR,onErrorHandle);
			ibulkLoader.add(Version.add("data/res.mpt"), {id:"res",type:"binary"});			
			ibulkLoader.start();
		}
		
		public function showProgress(progress:Number):void
		{
			
		}
	}
}