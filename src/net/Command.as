package net
{
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	public class Command extends EventDispatcher
	{
		protected var connection:Connection;
		
		public function Command(conn:Connection)
		{
			connection = conn;
		}
		
		public function send():void
		{
			var command:ByteArray = getCommandStream();
			connection.send(command);
		}
		
		protected virtual function getCommandStream():ByteArray
		{
			var command:ByteArray = new ByteArray();
			return command;
		}
	}
}