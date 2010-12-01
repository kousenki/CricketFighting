package net.message
{
	import flash.utils.ByteArray;
	
	public class Message
	{
		public var messageType:int;
		public var bodySize:int;
		public var body:ByteArray;
		
		public function Message()
		{
		}
		
		public static function createFromBytes(bytes:ByteArray):Message
		{
			var msg:Message = new Message();
			
			msg.messageType = bytes.readInt();
			msg.bodySize = bytes.readInt();
			bytes.writeBytes(msg.body, 8, bodySize);
			return msg;  
		}
	}
}