package net
{
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	public class Query extends Command
	{
		public var static const REPLY_READY:String = "replyready";
		
		public function Query(conn:Connection)
		{
			super(conn);
			connection.addEventListener(Connection.DATA_RECEIVED, onReplyReady);
		}
		
		private function onReplyReady():void
		{
			dispatchEvent(new Event(REPLY_READY));
		}
		
		public function getReply():ByteArray
		{
			var reply:ByteArray = new ByteArray();
			var offset:int = 0;
			while (connection.bytesAvailable() > 0)
			{
			}
		}
	}
}