package controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class CaptureCricketCommand extends SimpleCommand
	{	
		public function CaptureCricketCommand()
		{
			super();
		}
		
		public override function execute(notification:INotification):void
		{
			
		}
	}
}