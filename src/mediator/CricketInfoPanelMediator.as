// ActionScript file
package mediator
{
	import model.CricketInfoProfileProxy;
	
	import org.aswing.event.AWEvent;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.CricketInformationPanel;
	
	import vo.CricketInfoProfile;

	public class CricketInfoPanelMediator extends Mediator
	{
		public static const NAME:String = "CricketInfoPanelMediator";
		private var profile:CricketInfoProfile;
		
		public function CricketInfoPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			view().setLocationXY(50, 370);
			view().setSizeWH(100, 500);
			view().addEventListener(AWEvent.SHOWN, onCricketInfoPanelShown);
			view().setVisible(false);
		}
		
		private function onCricketInfoPanelShown(evt:AWEvent):void
		{
			var proxy:CricketInfoProfileProxy = facade.retrieveProxy(CricketInfoProfileProxy.NAME) as CricketInfoProfileProxy;
			profile = proxy.GetCricketInfoProfile();
//			view().setUserName(profile.UserName);
			view().setValue(profile);
		}
		
//		private function onButtonClick(evt:AWEvent):void
//		{
////			view().sayHi();
//		}
		
		public function view():CricketInformationPanel
		{
			return viewComponent as CricketInformationPanel;
		}
	}
}

