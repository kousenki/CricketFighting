package view
{
	
//	import br.com.stimuli.loading.BulkLoader;
//	import br.com.stimuli.loading.BulkItemEvent;
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	
//	import com.libs.utils.XmlProvider;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import vo.UserBasicInfoProfile;
	
//	import fy.AppFacade;
//	import fy.GlobalVar;
//	import fy.NotiConst;
//	import fy.effects.GameNotice;
	import model.UserData;
//	import fy.model.animation.AnData;
//	import fy.modules.PopUp.PopUpMenu;
//	import fy.modules.menu.MenuParams;
//	import fy.utils.LoadingUtil;
	
	import org.aswing.*;
	import org.aswing.border.*;
	import org.aswing.colorchooser.*;
	import org.aswing.event.DragAndDropEvent;
	import org.aswing.ext.*;
	import org.aswing.geom.*;
	
//	import ui.UserBasic;
	/**
	 * UserBasicInfor 用户基本信息
	 */
	public class UserBasicInfor extends JPanel{
		
		//members define
		private var headImgPanel:JPanel;
		private var panel3:JPanel;
		private var lblLvl:JLabel;
		private var lblNickname:JLabel;
		private var label6:JLabel;
		private var label7:JLabel;
		private var label8:JLabel;
		private var pgbExpValue:JProgressBar;
		private var lblExpInfo:JLabel;
		//property define
		private const Main_Width:int=265;//240
		private const Main_Height:int=112;//80 
		private const ProgressBar_Width:int=105;
		private const ProgressBar_Height:int=12;  
		private var anData:UserBasicInfoProfile;  
		private var userPanel:MovieClip;      
		/** 
		 * UserBasicInfor Constructor
		 */
		[Embed(source="assets/others/back/top.png")] 
		private var TopbackGroundImg:Class; 
		//private var userMenu:PopUpMenu;
		public function UserBasicInfor(){
			//AppFacade.getInstance().registerMediator(new UserBasicInfoMediator(UserBasicInfoMediator.NAME, this));
			//creation Component
			this.cacheAsBitmap=true;
//			var aa:UserBasic=new UserBasic(); 
//			aa.stop();
//			aa.cacheAsBitmap=true; 
			
			userPanel = new (BulkLoader.getLoader("PreLoad").getSWFClass("swf/UserBasicc.swf","UserBasicc"));//new//new UserBasicc();
		//	userPanel.hpText.filters=userPanel.mpText.filters=[new GlowFilter(0x1c1c1c, 1, 2, 2, 5)];
			userPanel.cacheAsBitmap=true;
			userPanel.lvl.text="";
			userPanel.roleinfo.text="";
			userPanel.hpText.text=userPanel.mpText.text="";
//			userPanel.expbar.gotoAndStop(0); 
			userPanel.hpbar.gotoAndStop(0);    
			userPanel.mpbar.gotoAndStop(0);     
			//userPanel.head.addEventListener(MouseEvent.CLICK,onClickHead);
			userPanel.head.buttonMode=true;   
			//userPanel.pk.addEventListener(MouseEvent.CLICK,onPk);  
			userPanel.select.text = "和平";
			//userPanel.moshi.addEventListener(MouseEvent.CLICK,onClick);
			this.setLayout(new EmptyLayout()); 
			this.setEnabled(false); 
			this.setSizeWH(userPanel.width,userPanel.height);
			this.addChild(userPanel); 
//			userMenu = new PopUpMenu();
//			userMenu.addMenu("全体",onSelet);
//			userMenu.addMenu("帮会",onSelet);
//			userMenu.addMenu("队伍",onSelet);  
/* 			userPanel.head.addEventListener(DragAndDropEvent.DRAG_DROP, __onDragDrop);
			userPanel.head.setDropTrigger(true); 
			userPanel.head.setDragAcceptableInitiatorAppraiser(__onDragAppraiser); */
		} 
		private var flag:uint = 1;
//		private function onClick(evt:MouseEvent):void{ 
//			if(flag == 1){
//				userMenu.showAt(2,89);
//				flag = 2;
//			}else{
//				this.userMenu.visible = false;
//				flag = 1;	 
//			} 
//		}
		private function onSelet(evt:MouseEvent):void{  
			var str:String = evt.currentTarget.menuCaption.text;
			userPanel.select.text = str; 
			flag = 1;
			//this.userMenu.visible = false;
		} 
		private function __onDragAppraiser(initiator:*):Boolean{   
/* 			var itemFrom:String=initiator.itemFrom;   
			if(itemFrom==DraAbleItemFrom.PACK_WINDOW){//来自背包的物品
				return true;
			} */
			return true; 
		} 
		private function __onDragDrop(event:DragAndDropEvent):void{ 
			trace("----------------------------------");
		}
//		private function onPk(evt:Event):void
//		{
//			if(GlobalVar.player.anData.pk){ 
//				GlobalVar.player.anData.pk = false;
//				userPanel.pk.gotoAndStop(2);
//				AppFacade.getInstance().sendNotification(NotiConst.S_PLAYER_PK,0);
//			}else{
//				GlobalVar.player.anData.pk = true;
//				userPanel.pk.gotoAndStop(1);
//				AppFacade.getInstance().sendNotification(NotiConst.S_PLAYER_PK,1);
//			}
//		}
//		/**
//		 * 1 打开PK 0 关闭
//		 */ 
//		public function setPk(pk:int):void 
//		{
//			if(pk == 1){
//				userPanel.pk.gotoAndStop(1);
//				GlobalVar.player.anData.pk = true;	
//			}else{
//				userPanel.pk.gotoAndStop(2); 
//				GlobalVar.player.anData.pk = false;	
//			}	
//					
////			userPanel.nopk.visible=pk==0;
////			GlobalVar.player.anData.pk=pk==1;
//		}
		
//		private function onClickHead(evt:Event):void
//		{			
//			AppFacade.getInstance().sendNotification(NotiConst.MENU_OPEN,new MenuParams(MenuParams.TYPE_USER));
//		}
		/**
		 * InitDatas
		 * 加载数据
		 */
		private function InitDatas():void{
			anData=UserData.getInstance().anData;
			if(anData==null){
				return;
			} 
			//test();
			initHeadImgPanel(); 
			initLabel();
		}
		private function initHeadImgPanel():void{
			if(userPanel.head.numChildren) return;						
			var hd:Bitmap=BulkLoader.getLoader().getBitmap("res/user/u"+anData.faction+anData.gender+".png");
			if(hd==null) return;
/*  			hd.scaleX = 0.9;
			hd.scaleY = 0.9; */
			hd.y = -3; 
			hd.x = 1;  
			userPanel.head.addChild(hd);
			//LoadingUtil.getInstance().show(userPanel.head,LoadingUtil.UP_G_HEAD,60,60,-5,-15,true);
			//ImageLoaderUtil.LoadAndAddImage(URLManager.getUesrHead(anData.faction,anData.gender),LoadedCallBack);
			trace("111");
		}  
 
//		private function LoadedCallBack(comp:Component):void{
//			LoadingUtil.getInstance().hide(userPanel.head,LoadingUtil.UP_G_HEAD);
//			var cm:Component = comp;
////			cm.scaleX = cm.scaleY = 0.7; 
//			cm.x = 0;
//			comp.cacheAsBitmap=true;
//			userPanel.head.addChild(comp); 
//		}   

		private function initLabel():void{
			userPanel.roleinfo.text=anData.UserName;
			userPanel.lvl.text=anData.lvl.toString();
		}
		public function updateValue():void
		{
			InitDatas();
			anData = UserData.getInstance().anData;			
			var exp:int = Math.round((anData.Exp/anData.MaxExp)*100); 
			userPanel.hpbar.gotoAndStop(exp);
			userPanel.hpText.text = anData.Exp.toString()+"/"+anData.MaxExp.toString();
			
//			var mp:int = Math.round((anData.mp / anData.maxMp)*100);
//			userPanel.mpbar.gotoAndStop(mp);
//			userPanel.mpText.text = anData.mp.toString()+"/"+anData.maxMp.toString();				
		}
		public function clear():void
		{
			userPanel.roleinfo.text="";
			userPanel.lvl.text="";
			userPanel.hpbar.gotoAndStop(0);
			userPanel.mpbar.gotoAndStop(0);
			userPanel.hpText.text=userPanel.mpText.text="";
			userPanel.pk.gotoAndStop(2);
			if(userPanel.head.numChildren) 
				userPanel.head.removeChildAt(0);
		}
	}
}