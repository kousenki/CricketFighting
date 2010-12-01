// ActionScript file
package mediator
{
	import model.CricketProfileProxy;
	import flash.events.Event;
	import org.aswing.event.AWEvent;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.CricketPanel;
	
	import vo.CricketProfile;

	public class CricketPanelMediator extends Mediator
	{
		public static const NAME:String = "CricketPanelMediator";
		public static const OPEN_PACKET1_INFO_PANEL:String = "OpenPacket1InfoPanel";
		private var profile:CricketProfile;
		
		public function CricketPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			view().setLocationXY(50, 370);
			view().setSizeWH(500, 100);
			view().addEventListener(AWEvent.SHOWN, onCricketPanelShown);
			view().setVisible(false);
			view().addEventListener(CricketPanel.SHOW_PACKET1_INFO_PANEL, ShowPacket1InfoPanel);
//			view().btn.addActionListener(onButtonClick);
		}
		
		private function onCricketPanelShown(evt:AWEvent):void
		{
			var proxy:CricketProfileProxy = facade.retrieveProxy(CricketProfileProxy.NAME) as CricketProfileProxy;
			profile = proxy.GetCricketProfile();
//			view().setUserName(profile.UserName);
		}
		
		private function onButtonClick(evt:AWEvent):void
		{
//			view().sayHi();
		}
		
		public function view():CricketPanel
		{
			return viewComponent as CricketPanel;
		}
		
		private function ShowPacket1InfoPanel(evt:Event):void
		{
			this.sendNotification(OPEN_PACKET1_INFO_PANEL);
		}
	}
}