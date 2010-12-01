package net
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	import net.message.*;
	
	public class Connection extends EventDispatcher
	{
		public var static const CONNECTED:String = "Connected";
		public var static const CONNECTION_ERR:String = "connectionerr";
		public var static const DATA_RECEIVED:String = "datareceived";
		
		private var socket:Socket;
		private var message:Message;
		private var host:String;
		private var port:int;
		private var buffer:ByteArray;
		
		public function Connection(host:String, port:int)
		{
			socket = new Socket();
			this.host = host;
			this.port = port;
			
			socket.addEventListener(Event.CONNECT, connectHandler);
			socket.addEventListener(Event.CLOSE, closeHandler);
			socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
		}
		
		public function getHost():String
		{
			return host;
		}
		
		public function getPort():int
		{
			return port;
		}
		
		public function connected():Boolean
		{
			return socket.connected;	
		}
		
		public function open():void
		{
			socket.connect(host, port);
		}
		
		public function send(stream:ByteArray):void
		{	
			socket.writeBytes(stream);
			socket.flush();
		}
		
		public function bytesAvailable():int
		{
			return socket.bytesAvailable;
		}
		
		public function readBytes(offset:int, length:int):ByteArray
		{
			var data:ByteArray = new ByteArray();
			return socket.readBytes(data, offset, length);
		}
		
		private function connectHandler(evt:Event):void
		{
			trace('socket connection established to ' + host + ':' + port);
			dispatchEvent(new Event(CONNECTED));
		}
		
		private function ioErrorHandler(evt:IOErrorEvent):void
		{
			trace('socket connection failed due to io error');
			dispatchEvent(new Event(CONNECTION_ERR));
		}
		
		private function securityErrorHandler(evt:SecurityErrorEvent):void
		{
			trace('socket connection failed due to security error');
			dispatchEvent(new Event(CONNECTION_ERR));
		}
		
		private function socketDataHandler(evt:ProgressEvent):void
		{
			trace('socket data received...');
			
			socket.writeBytes(buffer, buffer.length);
			if (buffer.length > 8)
			{
				var packetSize:int = readInt(buffer, 4);
				if (buffer.length >= 4 + packetSize)
				{
					buffer.position = 0;
					var msg:Message = Message.createFromBytes(buffer, 0, 4 + packetSize);
					
					buffer = removeLeadingBytes(buffer);
					
					dispatchEvent(new MessageEvent(msg));
				}
			}
		}
		
		private function readInt(bytes:ByteArray, offset:int):int
		{
			bytes.position = offset;
			return bytes.readInt();
		}
		
		private function removeLeadingBytes(bytes:ByteArray, length:int):ByteArray
		{
			var tail:ByteArray = new ByteArray();
			bytes.writeBytes(swap, length);
			
			return tail;
		}
	}
}