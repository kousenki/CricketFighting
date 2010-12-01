// ActionScript file
package view
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.aswing.EmptyLayout;
	import org.aswing.JButton;
	import org.aswing.JLabel;
	import org.aswing.JPanel;
	import org.aswing.AssetBackground;
	import org.aswing.event.AWEvent;
	import org.aswing.geom.IntDimension;
	import org.aswing.geom.IntPoint;
	
	import styles.Style;

	public class CricketPanel extends JPanel
	{	
		public static const SHOW_PACKET1_INFO_PANEL:String = "ShowPacket1InfoPanel";
				
		[Embed(source="assets/embed/flaugt.png",scaleGridLeft=7, scaleGridRight=25, scaleGridTop=30, scaleGridBottom=35)]
		private static var background:Class;
		
//		public var btn:JButton;
//		private var greeting:JLabel;
		 
		public function CricketPanel()
		{
			super();
			var bg:DisplayObject = new background();
			this.setBackgroundDecorator(new AssetBackground(bg));
//			this.getContentPane().setLayout(new EmptyLayout());

			var packet1:JButton = new JButton();
			packet1.setSize(new IntDimension(50,43)); 
			packet1.setLocation(new IntPoint(50,25)); 
			Style.setStyle(packet1,Style.packBtnStyle);
			packet1.buttonMode = true; 
//			packet1.addEventListener(MouseEvent.CLICK,menuClickHandlers);
			packet1.addActionListener(OnPacket1Clicked);
			packet1.name = "smallOne1";
			this.addChild(packet1);
			
			var packet2:JButton = new JButton();
			packet2.setSize(new IntDimension(50,43)); 
			packet2.setLocation(new IntPoint(140,25)); 
			Style.setStyle(packet2,Style.packBtnStyle);
			packet2.buttonMode = true; 
//			packet1.addEventListener(MouseEvent.CLICK,menuClickHandlers);
			packet2.name = "smallOne2";
			this.addChild(packet2);
			
			var packet3:JButton = new JButton();
			packet3.setSize(new IntDimension(50,43)); 
			packet3.setLocation(new IntPoint(230,25)); 
			Style.setStyle(packet3,Style.packBtnStyle);
			packet3.buttonMode = true; 
//			packet1.addEventListener(MouseEvent.CLICK,menuClickHandlers);
			packet3.name = "smallOne3";
			this.addChild(packet3);
			
			var packet4:JButton = new JButton();
			packet4.setSize(new IntDimension(50,43)); 
			packet4.setLocation(new IntPoint(320,25)); 
			Style.setStyle(packet4,Style.packBtnStyle);
			packet4.buttonMode = true; 
//			packet1.addEventListener(MouseEvent.CLICK,menuClickHandlers);
			packet4.name = "smallOne4";
			this.addChild(packet4);
			
			var packet5:JButton = new JButton();
			packet5.setSize(new IntDimension(50,43)); 
			packet5.setLocation(new IntPoint(410,25)); 
			Style.setStyle(packet5,Style.packBtnStyle);
			packet5.buttonMode = true; 
//			packet1.addEventListener(MouseEvent.CLICK,menuClickHandlers);
			packet5.name = "smallOne5";
			this.addChild(packet5);
			
//			packet1.addActionListener(onCricketInfoPanelBtnClicked);
//			btn = new JButton("click me");
//			btn.setSizeWH(80, 30);
//			btn.setLocationXY(50, 20);
//			this.getContentPane().append(btn);
//			
//			greeting = new JLabel("Hello");
//			greeting.setSizeWH(80, 25);
//			greeting.setLocationXY(50, 100);
//			this.getContentPane().append(greeting);		
//			greeting.setVisible(false);	
		}
		
//		private function onCricketInfoPanelBtnClicked(evt:AWEvent):void
//		{
//			dispatchEvent(new Event(SHOW_CRICKET_INFO_PANEL));
//		}
		
		private function OnPacket1Clicked(evt:AWEvent):void
		{
			dispatchEvent(new Event(SHOW_PACKET1_INFO_PANEL));
		}
		
//		public function setUserName(name:String):void
//		{
//			this.setTitle(name);
//		}
		
//		public function sayHi():void
//		{
//			greeting.setVisible(true);
//		}
//		private function menuClickHandlers(evt:MouseEvent):void{ 
//		var menuParams:MenuParams;
//		var str:String = evt.target.name;
//		switch(str){ 
//			case "one":
//				menuParams = new MenuParams(MenuParams.TYPE_USER);
//				break;
//			case "Two":
//				menuParams = new MenuParams(MenuParams.TYPE_SKILL);
//				break;
//			case "Three":
//				menuParams = new MenuParams(MenuParams.TYPE_PACK);
//				break;
//			case "Four":					
//				menuParams = new MenuParams(MenuParams.TYPE_Mounts);
//				break;
//			case "Five":
//				menuParams = new MenuParams(MenuParams.TYPE_TEAM);
//				break;
//			case "Six":
//				menuParams = new MenuParams(MenuParams.TYPE_TheyReveal);
//				break;
//			case "Seven":					
//				 menuParams = new MenuParams(MenuParams.TYPE_Friends);
//				break;
//			case "Eight":
//				menuParams = new MenuParams(MenuParams.TYPE_TASK);
//				break;
//			case "Nine":
//				menuParams = new MenuParams(MenuParams.TYPE_GANG);
//				break;
//			case "Ten":
//			  menuParams = new MenuParams(MenuParams.TYPE_SYSTEM_SHOW);						
//				break;							
//			case "smallOne":
//			  menuParams = new MenuParams(MenuParams.TYPE_Mall);						
//				break;			
//		}
//		AppFacade.getInstance().sendNotification(NotiConst.MAP_CLICK);
//		if(menuParams!=null)
//			AppFacade.getInstance().sendNotification(NotiConst.MENU_OPEN,menuParams);				
//		}
	}
}