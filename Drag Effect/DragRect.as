package {
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class DragRect extends MovieClip {
		//Default
		public var defaultWidth:uint;
		public var defaultHeight:uint;
		//Move
		public var clickX:int;
		public var clickY:int;
		public var desX:int;
		public var desY:int;
		public var xs:Number;
		public var ys:Number;
		public var lastX:int;
		public var lastY:int;
		public var ease:Number = .1;
		public var bendStrength:Number;
		public var floatStrength:Number = .7;
		//Stats
		public var hits:uint=0;
		public function DragRect(xPos:int,yPos:int,wid:uint,hei:uint) {
			x = xPos;
			y = yPos;
			defaultWidth=wid;
			defaultHeight=hei;
			width = defaultWidth;
			height = defaultHeight;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addEventListener(MouseEvent.MOUSE_DOWN,onDown);
			stage.addEventListener(MouseEvent.MOUSE_UP,onUp);
		}
		private function onDown(e:MouseEvent):void {
			removeEventListener(Event.ENTER_FRAME,float);
			clickX=stage.mouseX-x;
			clickY=stage.mouseY-y;
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private var i:uint = 0;
		private function onLoop(e:Event):void {
			desX = stage.mouseX-clickX;
			desY = stage.mouseY-clickY;
			xs = (desX-lastX)*floatStrength;
			ys = (desY-lastY)*floatStrength;
			x += (desX-x)*ease;
			y += (desY-y)*ease;
			checkBounds();
			lastX = x;
			lastY = y;
			if(i>=1){
				i=0;
				lastX = x;
				lastY = y;
			} else {
				i++;
			}
		}
		private function onUp(e:MouseEvent):void {
			removeEventListener(Event.ENTER_FRAME,onLoop);
			addEventListener(Event.ENTER_FRAME,float);
		}
		private function float(e:Event):void {
			xs *= (1-ease);
			ys *= (1-ease);
			x += xs;
			y += ys;
			checkBounds();
			if(x+width>=stage.stageWidth){
				if(xs > 0){
					xs = -xs;
					hits++;
				}
			}
			if(x<=0){
				if(xs<0){
					xs = -xs
					hits++;
				}
			}
			if(y<=0){
				if(ys<0){
					ys = -ys;
					hits++;
				}
			}
			if(y+height>=stage.stageHeight){
				if(ys>0){
					ys = -ys;
					hits++;
				}
			}
		}
		private function checkBounds():void {
			if(x+width>stage.stageWidth){
				x = stage.stageWidth-width;
			}
			if(x<0){
				x = 0;
			}
			if(y + height >stage.stageHeight){
				y = stage.stageHeight-height;
			}
			if(y<0){
				y=0;
			}
		}
	}
}