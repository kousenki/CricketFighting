package view.control
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Rectangle;
	
	import org.aswing.ASFont;
	import org.aswing.AsWingUtils;
	import org.aswing.AssetBackground;
	import org.aswing.EmptyLayout;
	import org.aswing.JButton;
	import org.aswing.JLabel;
	import org.aswing.JPanel;
	import org.aswing.JWindow;
	import org.aswing.WindowLayout;
	import org.aswing.event.AWEvent;
	import org.aswing.event.ReleaseEvent;
	import org.aswing.event.ResizedEvent;
	import org.aswing.geom.IntDimension;
	import org.aswing.geom.IntRectangle;
	
	import view.control.CloseButton;

	public class WindowBase extends JWindow
	{
		public static const CAPTION_HEIGHT:int = 28;
		public static const CLOSE_BUTTON_WIDTH:int = 24;
		public static const CLOSE_BUTTON_HEIGHT:int = 24;
		public static const VERTICAL_MARGIN:int = 3;
		public static const HORIZONTAL_MARGIN:int = 5;
		
		[Embed(source="assets/embed/default_bg.png",scaleGridLeft=7, scaleGridRight=25, scaleGridTop=30, scaleGridBottom=35)]
		private static var defaultBackground:Class; 
		
		private var captionBar:JPanel;
		private var titleLabel:JLabel;
		private var closeBtn:JButton;
		
		public function WindowBase(owner:*=null, modal:Boolean=false)
		{
			super(owner, modal);
			initBackground();
			initView();
		}
		
		public function setTitle(title:String):void
		{
			titleLabel.setText(title);
		}
		
		private function initBackground():void
		{
			var background:DisplayObject = new defaultBackground();
			setBackgroundDecorator(new AssetBackground(background));
		}
		
		private function initView():void
		{
			captionBar = new JPanel(new EmptyLayout());
			captionBar.addEventListener(MouseEvent.MOUSE_DOWN, onWindowCaptured);
			captionBar.addEventListener(ReleaseEvent.RELEASE, onWindowReleased);
			append(captionBar, WindowLayout.TITLE);
			
			titleLabel = new JLabel();
			titleLabel.setFont(new ASFont("Tahoma",11	,true,false,false));
			titleLabel.filters=[new GlowFilter(0x1c1c1c, 1, 2, 2, 5)];
			
			closeBtn = new CloseButton();
			closeBtn.setSizeWH(CLOSE_BUTTON_WIDTH, CLOSE_BUTTON_HEIGHT);
			closeBtn.y = VERTICAL_MARGIN;
			closeBtn.addActionListener(onClose);
			
			captionBar.appendAll(titleLabel, closeBtn); 
			
			addEventListener(ResizedEvent.RESIZED, onWindowResized);
		}
		
		private function onClose(evt:AWEvent):void
		{
			this.hide();
		}
		
		private function onWindowResized(evt:ResizedEvent):void
		{
			var size:IntDimension = evt.getNewSize();
			captionBar.setSizeWH(size.width, CAPTION_HEIGHT);
			titleLabel.setSizeWH(size.width, 25);
			
			closeBtn.x = size.width - closeBtn.width - 5;			
		}
		
		private function onWindowCaptured(evt:MouseEvent):void
		{
			if (evt.target != titleLabel && evt.target != captionBar) {
				return;
			}
			
			var windowBounds:Rectangle = AsWingUtils.getVisibleMaximizedBounds().toRectangle();
			var gap:Number = captionBar.getHeight();
			windowBounds.x -= (width - gap);
			windowBounds.y -= getInsets().top;
			windowBounds.width += (width - gap*2);
			windowBounds.height -= gap;
			
			startDrag(false, windowBounds);
		}		
		
		private function onWindowReleased(evt:ReleaseEvent):void
		{
			if (evt.target != titleLabel && evt.target != captionBar) { 
				return;
			}
			
			stopDrag();
		}
		
		protected override function paint(rc:IntRectangle):void 
		{
			super.paint(rc);
			captionBar.width = rc.width;
			titleLabel.setSizeWH(rc.width, 25);
			closeBtn.x = rc.width - closeBtn.width - HORIZONTAL_MARGIN;
			closeBtn.y = VERTICAL_MARGIN;
		}
	}
}