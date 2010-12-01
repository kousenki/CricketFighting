package view
{
	import flash.events.Event;
	
	import org.aswing.EmptyLayout;
	import org.aswing.JButton;
	import org.aswing.JLabel;
	import view.control.WindowBase;

	public class UserInformationPanel extends WindowBase
	{
		public function UserInformationPanel()
		{
			super();
			
			this.getContentPane().setLayout(new EmptyLayout());
		}
		
		public function setUserName(name:String):void
		{
			this.setTitle(name);
		}
	}
}