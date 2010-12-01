package
{
	import controller.StartupCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class ApplicationFacade extends Facade implements IFacade
	{
		public static const NAME:String = "ApplicationFacade";
		public static const STARTUP:String = NAME + "startup";
		
		public function ApplicationFacade()
		{
			super();
		}
		
		public static function getInstance():ApplicationFacade
		{
			if (instance == null)
				instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		public function startUp(app:Object):void
		{
			sendNotification(STARTUP, app);
		}
		
		protected override function initializeController():void
		{
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
		}
	}
}