package mediator
{
	import flash.events.Event;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.HeadPanel;

	public class HeadPanelMediator extends Mediator
	{
		public static const NAME:String = "HeadPanelMediator";
		
		public function HeadPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			view().setLocationXY(20, 30);
			view().setSizeWH(200, 100);
		}
		
		public function view():HeadPanel
		{
			return viewComponent as HeadPanel;
		}
		

	}
}