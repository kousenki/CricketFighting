package mediator
{
	import fy.NotiConst;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.UserBasicInfor;
	public class UserBasicInfoMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "UserBasicInfoMediator";
		public function UserBasicInfoMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		private function get view():UserBasicInfor
		{
			return viewComponent as UserBasicInfor; 
		}
		override public function listNotificationInterests() : Array
		{
			return [NotiConst.PlAYER_ATTR_DATA,NotiConst.R_PLAYER_PK,NotiConst.R_PLAYER_AUTOHPMP];
		}
		override public function handleNotification(notification:INotification) : void
		{
			var name:String = notification.getName();
			switch(name){
				case NotiConst.PlAYER_ATTR_DATA: 
				  	view.updateValue(); 
					break;
				case NotiConst.R_PLAYER_PK:
				  	view.setPk(notification.getBody() as int);
					break;	
				case NotiConst.R_PLAYER_AUTOHPMP:
				  	view.updateValue();
					break;	
			}
		}
	}
}