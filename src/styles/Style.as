package styles
{
	import org.aswing.Component;
	import org.aswing.JButton;
	import org.aswing.plaf.ComponentUI;
 
	public class Style
	{
		[Embed(source="assets/embed/button_pack_down.png")]
		private static var packBtnDown:Class; 
		[Embed(source="assets/embed/button_pack_default.png")]
		private static var packBtnOver:Class; 
		public static var packBtnStyle:Array = [  
			"Button.defaultImage", packBtnDown,  
			"Button.pressedImage", packBtnOver,  
			"Button.rolloverImage", packBtnOver
		];
			
		 /**
		 * 设置样式 
		 * @param componet 组件
		 * @param sty	样式数组
		 * 
		 */		
		public static function setStyle(componet:Component, sty:Array):void
		{
			var componentUI:ComponentUI = componet.getUI();
			for(var i:int;i<sty.length;i+=2){
				componentUI.putDefault(sty[i], sty[i+1]);
			} 
			componet.setUI(componentUI);
		}
	}
}
