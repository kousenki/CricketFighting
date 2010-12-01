package view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	// Grass field view of pre-determined size
	// this class will handle the presentation logic
	// some simple view behavior will also be handled 
	// within it, e.g. mouse cursor tracking
	public class GrassField extends Sprite
	{
		[Embed(source="assets/embed/bg.jpg")]
		private var background:Class;
		
		public function GrassField()
		{
			super();
			initView();
		}
		
		private function initView():void
		{
			// this will initialize visual appearance of the grass field
			var bgImg:DisplayObject = new background();
			addChild(bgImg);
		}
		
	}
}