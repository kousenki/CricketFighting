package net.message
{
	import flash.events.Event;
	
	public class MessageEvent extends Event
	{
		public static const NAME:String = "MessageEvent";
		private var msg:Message;
		
		public function MessageEvent(msg:Message)
		{
			super(NAME);
			this.msg = msg;
		}
		
		public function get message():Message
		{
			return msg;
		}

	}
}