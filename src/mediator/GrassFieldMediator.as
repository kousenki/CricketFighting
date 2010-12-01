package mediator
{
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.GrassField;
	import controller.CaptureCricketCommand;

	public class GrassFieldMediator extends Mediator
	{
		public static const NAME:String = "GrassFieldMediator";
		public static const CAPTURE_CRICKET:String = NAME + "captureCricket";
		
		public function GrassFieldMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			registerCommands();
		}
		
		private function registerCommands():void
		{
			// register commands initiated by GrassField view
			facade.registerCommand(CAPTURE_CRICKET, CaptureCricketCommand);
		}
		
		public function getView():GrassField
		{
			return viewComponent as GrassField;
		}
		
		public override function onRegister():void
		{
			getView().addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onMouseDown(evt:MouseEvent):void
		{
			// raise CAPTURE notification, passing in anonymouse parameters
			// the corresponding command object will unpack the parameters
			// and handle it in its own scope
			this.sendNotification(CAPTURE_CRICKET, {x:evt.localX, y:evt.localY});
		}
	}
}