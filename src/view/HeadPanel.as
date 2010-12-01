package view
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import org.aswing.AssetBackground;
	import org.aswing.EmptyLayout;
	import org.aswing.JButton;
	import org.aswing.JPanel;
	import org.aswing.event.AWEvent;

	public class HeadPanel extends JPanel
	{	
		[Embed(source="assets/embed/flaugt.png",scaleGridLeft=7, scaleGridRight=25, scaleGridTop=30, scaleGridBottom=35)]
		private static var background:Class;
		
		public function HeadPanel()
		{
			super();
			initView();
		}
		
		private function initView():void
		{
			var bg:DisplayObject = new background();
			this.setBackgroundDecorator(new AssetBackground(bg));
			
			this.setLayout(new EmptyLayout());
		}
		
	}
}
