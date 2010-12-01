package mediator
{
	import flash.events.Event;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.FriendPanel;

	public class FriendPanelMediator extends Mediator
	{
		public static const NAME:String = "FriendPanelMediator";
		
		public function FriendPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			view().setLocationXY(650, 100);
			view().setSizeWH(150, 300);
		}
		
		public function view():FriendPanel
		{
			return viewComponent as FriendPanel;
		}
		

	}
}