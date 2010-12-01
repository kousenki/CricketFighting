package view.control
{
	import org.aswing.JButton;
	import org.aswing.plaf.ComponentUI;

	public class CloseButton extends JButton
	{
		[Embed(source="assets/embed/close_up.png")]
		private static var closeUp:Class;
		
		[Embed(source="assets/embed/close_over.png")]
		private static var closeOver:Class;
		
		[Embed(source="assets/embed/close_up.png")]
		private static var closeDown:Class;
				
		public function CloseButton(text:String="")
		{
			super(text);
			initButtonStyle();
		}
		
		private function initButtonStyle():void
		{
			var ui:ComponentUI = getUI();
			ui.putDefault("Button.defaultImage", closeUp);
			ui.putDefault("Button.pressedImage", closeDown);
			ui.putDefault("Button.rolloverImage", closeOver);
		}
		
	}
}