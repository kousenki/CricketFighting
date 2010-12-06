package
{
	//fuck panda 
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import flash.display.Sprite;
	
	import org.aswing.*;
	import org.aswing.skinbuilder.orange.*;
	import view.CricketInformationPanel;
	import view.CricketPanel;
	import view.FriendPanel;
	import view.GrassField;
	import view.LoadingSplash;
	import view.ToolBox;
	import view.UserBasicInfor;
	import view.UserInformationPanel;

	[SWF(width="800", height="564", frameRate="24")]
	public class GameStage extends Sprite
	{
		public var loadingSplash:LoadingSplash;
		
		// Grass Field
		public var grassField:GrassField;
		
		// Tool box area, will typicall contain
		// various tool icons, e.g. cricket cans
		public var toolBox:ToolBox;
		public var friendPanel:FriendPanel;
		//public var headPanel:HeadPanel;
		public var userHeader:UserBasicInfor;
		
		// A panel for displaying user specific information
		public var userPanel:UserInformationPanel;
		public var cricketPanel:CricketPanel;
		public var cricketInformationPanel:CricketInformationPanel;
		
		private var shopBtn:JButton;
		private var storehouseBtn:JButton;
		private var campaignBtn:JButton;
		private var battleRoomBtn:JButton;
			
		public function GameStage()
		{						
			AsWingManager.initAsStandard(this);
			UIManager.setLookAndFeel(new OrangeLookAndFeel());
			ApplicationFacade.getInstance().startUp(this);
		}
		
		public function showLoadingSplash():void
		{
			loadingSplash = new LoadingSplash();
			this.addChild(loadingSplash);
		}
		
		public function hideLoadingSplash():void
		{
			this.removeChild(loadingSplash);
		}
		
		public function enterGameView():void
		{
			grassField = new GrassField();
			toolBox = new ToolBox();			
			friendPanel = new FriendPanel();
			//headPanel = new HeadPanel();
			userPanel = new UserInformationPanel();
			userHeader = new UserBasicInfor();
			cricketPanel = new CricketPanel();
			cricketInformationPanel = new CricketInformationPanel();
						
			addChild(grassField);
			addChild(toolBox);
			addChild(friendPanel);
			//addChild(headPanel);
			addChild(userHeader);
			addChild(userPanel);
			addChild(cricketPanel);
			addChild(cricketInformationPanel);
			
			shopBtn = new JButton("Shop");
			shopBtn.setSizeWH(100, 20);
			shopBtn.setLocationXY(300, 50);
			this.addChild(shopBtn);
			
			storehouseBtn = new JButton("Store House");
			storehouseBtn.setSizeWH(100, 20);
			storehouseBtn.setLocationXY(420, 50);
			this.addChild(storehouseBtn);
			
			campaignBtn = new JButton("Campaign");
			campaignBtn.setSizeWH(100, 20);
			campaignBtn.setLocationXY(540, 50);
			this.addChild(campaignBtn);
			
			battleRoomBtn = new JButton("Battle Room");
			battleRoomBtn.setSizeWH(100, 20);
			battleRoomBtn.setLocationXY(660, 50);
			this.addChild(battleRoomBtn);
		}
	}
}
