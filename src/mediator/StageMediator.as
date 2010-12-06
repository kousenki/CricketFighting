package mediator
{	
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import model.ResourceStore;
	import controller.StartupCommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.aswing.geom.IntDimension;
	
	import view.CricketPanel;

	public class StageMediator extends Mediator
	{	
		public static const NAME:String = "StageMediator";
		
		public function StageMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}	
		
		public function view():GameStage
		{
			return viewComponent as GameStage;
		}
		
		public override function listNotificationInterests():Array
		{
			return [StartupCommand.LOADING_START,
			StartupCommand.LOADING_PROGRESS,
			StartupCommand.LOADING_COMPLETE,
			ToolBoxMediator.OPEN_USER_PANEL,
			ToolBoxMediator.OPEN_CRICKET_PANEL,
			CricketPanelMediator.OPEN_PACKET1_INFO_PANEL];
		}
		
		public override function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case StartupCommand.LOADING_START:
				view().showLoadingSplash();
				break;
				
				case StartupCommand.LOADING_PROGRESS:
				view().loadingSplash.showProgress(notification.getBody() as Number);
				break;
				
				case StartupCommand.LOADING_COMPLETE:
				view().hideLoadingSplash();
				view().enterGameView();
				
				break;
				
				case ToolBoxMediator.OPEN_USER_PANEL:
				if (!view().userPanel.isVisible())
				{
					view().userPanel.setSizeWH(200, 450);
					view().userPanel.setLocationXY(100, 0);
					view().userPanel.show();
				}
				break;
				
				case ToolBoxMediator.OPEN_CRICKET_PANEL:
				if(!view().cricketPanel.isVisible())
				{
					view().cricketPanel.setSizeWH(500, 100);
					view().cricketPanel.setLocationXY(170, 385);
					view().cricketPanel.setVisible(true);
				}
				break;
				
				case CricketPanelMediator.OPEN_PACKET1_INFO_PANEL:
				if(!view().cricketInformationPanel.isVisible())
				{
					view().cricketInformationPanel.setSize(new IntDimension(200,250));
					view().cricketInformationPanel.setLocationXY(200, 120);
					view().cricketInformationPanel.setVisible(true);
				}
				break;
				
				default:
				break;
			}
		}
	}
}