package controller
{
	import model.UserProfileProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class LoginCommand extends SimpleCommand
	{
		public function LoginCommand()
		{
			super();
		}
		
		public override function execute(notification:INotification):void
		{
		}
		
	}
}