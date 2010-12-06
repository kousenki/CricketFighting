package controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import mediator.*;
	import model.*;

	public class EnterGameCommand extends SimpleCommand
	{
		public function EnterGameCommand()
		{
			super();
		}
		
		public override function execute(notification:INotification):void
		{
			// register proxy
			facade.registerProxy(new UserProfileProxy());
			facade.registerProxy(new CricketProfileProxy());
			facade.registerProxy(new CricketInfoProfileProxy());
			
			// register mediator
			var stage:GameStage = notification.getBody() as GameStage;
			facade.registerMediator(new StageMediator(stage));
			facade.registerMediator(new GrassFieldMediator(stage.grassField));
			facade.registerMediator(new ToolBoxMediator(stage.toolBox));
			facade.registerMediator(new FriendPanelMediator(stage.friendPanel));
			//facade.registerMediator(new HeadPanelMediator(stage.headPanel));
			facade.registerMediator(new UserBasicInfoMediator(stage.userHeader));
			facade.registerMediator(new UserPanelMediator(stage.userPanel));	
			facade.registerMediator(new CricketPanelMediator(stage.cricketPanel));
			facade.registerMediator(new CricketInfoPanelMediator(stage.cricketInformationPanel));			
		}
		
	}
}