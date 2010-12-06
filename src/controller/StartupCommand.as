package controller
{	
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import mediator.*;
	
	import model.*;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand
	{
		private var stage:GameStage;
		
		public static const LOADING_START:String = "LoadingStart";
		public static const LOADING_PROGRESS:String = "LoadingProgress";
		public static const LOADING_COMPLETE:String = "LoadingComplete";
		
		public function StartupCommand()
		{
			super();
		}
		
		public override function execute(notification:INotification):void
		{
			stage = notification.getBody() as GameStage;
			facade.registerMediator(new StageMediator(stage));
			
			loadResources();
		}
		
		private function loadResources():void
		{
			ResourceStore.getInstance().addEventListener(BulkProgressEvent.PROGRESS, onLoadingProgress);
			ResourceStore.getInstance().addEventListener(BulkProgressEvent.COMPLETE, onLoadingComplete);
			ResourceStore.getInstance().AsyncLoad();
			sendNotification(LOADING_START);
		}
		
		private function onLoadingProgress(evt:BulkProgressEvent):void
		{
			sendNotification(LOADING_PROGRESS, evt.percentLoaded);
		}
		
		private function onLoadingComplete(evt:BulkProgressEvent):void
		{
			sendNotification(LOADING_COMPLETE);
			sendNotification(ApplicationFacade.ENTER_GAME, stage);
		}
	}
}