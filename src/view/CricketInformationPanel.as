package view
{
	import org.aswing.ASColor;
	import org.aswing.AsWingConstants;
	import org.aswing.Component;
	import org.aswing.Container;
	import org.aswing.EmptyLayout;
	import org.aswing.FlowLayout;
	import org.aswing.JLabel;
	import org.aswing.JPanel;
	import org.aswing.SoftBoxLayout;
	import org.aswing.border.LineBorder;
	import org.aswing.geom.IntDimension;
	
	import view.control.WindowBase;

	public class CricketInformationPanel extends WindowBase
	{
		//private var useJpanel:userModel;
		private var nickName:JLabel;
		private var level:JLabel;
		private var strength:JLabel;
		private var agility:JLabel;
		private var stamina:JLabel;
		private var power:JLabel;
		private var hungerValue:JLabel;
		private var winRatio:JLabel;
		private var title:JLabel;
		
		public function CricketInformationPanel()
		{
			super();
			
			this.getContentPane().setLayout(new EmptyLayout());
			
			initView();
		}
		
		private function initView():void{
			
			var jp:JPanel = new JPanel(new SoftBoxLayout(SoftBoxLayout.Y_AXIS,2,AsWingConstants.LEFT));
			jp.setSize(new IntDimension(122,200));
			jp.setLocationXY(10,0);
			jp.setBorder(new LineBorder(null,ASColor.HALO_ORANGE));
			this.getContentPane().append(jp);
			
			nickName = new JLabel();
			nickName.setForeground(ASColor.WHITE);
			
			level = new JLabel();
			level.setForeground(ASColor.WHITE);
			
			strength = new JLabel();
			strength.setForeground(ASColor.WHITE);
			
			agility = new JLabel();
			agility.setForeground(ASColor.WHITE); 
			
			stamina = new JLabel();
			stamina.setForeground(ASColor.WHITE);
					 
			power = new JLabel();
			power.setForeground(ASColor.WHITE);
			
			hungerValue = new JLabel();
			hungerValue.setForeground(ASColor.WHITE);
			
			winRatio = new JLabel();
			winRatio.setForeground(ASColor.WHITE);
			
			title = new JLabel();
			title.setForeground(ASColor.WHITE);
			
			jp.append(labelHold(nickName,"昵称:"));
			jp.append(labelHold(level,"等级:"));
			jp.append(labelHold(strength,"力量："));
			jp.append(labelHold(agility,"敏捷："));
			jp.append(labelHold(stamina,"耐力："));
			jp.append(labelHold(power,"体力："));
			jp.append(labelHold(hungerValue,"饥饿值："));
			jp.append(labelHold(winRatio,"胜率："));
			jp.append(labelHold(title,"称号："));
			 
//			useJpanel = new userModel(false); 
//			useJpanel.setBorder(new LineBorder(null,ASColor.BLUE));
//			useJpanel.setLocationXY(110,0);
//			useJpanel.setSizeWH(210,230);
			//baseInfo.appendAll(jp,useJpanel);
			//this.appendAll(jp);
			
		} 
		
		private function labelHold(c:Component,text:String,toolTip:String=null):Container{
			var panel:JPanel = new JPanel(new FlowLayout(FlowLayout.LEFT,2,0,false));
			var label:JLabel = new JLabel(text);
			label.setForeground(ASColor.WHITE);
			panel.appendAll(label,c);	
			if(toolTip != null){
				panel.setToolTipText(toolTip);
			}
			return panel;
		}
		
		public function setUserName(name:String):void
		{
			this.setTitle(name);
		}
		
		public function setValue(data:Object):void
		{
			nickName.setText(data.nickName);
			level.setText(data.level);
			strength.setText(data.strength);
			agility.setText(data.agility);
			stamina.setText(data.stamina);
			power.setText(data.power);
			hungerValue.setText(data.hungerValue);
			winRatio.setText(data.winRatio.toString() + "%");
			title.setText(data.title);
		}
	}
}
