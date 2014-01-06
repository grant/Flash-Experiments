package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Scroller extends MovieClip {
		private var ease:Number=.5;
		public var scrolling:Boolean=false;
		private var par:MovieClip;
		private const smallestWidth:uint = 10;
		public function Scroller(xpos:uint,ypos:uint):void {
			x=xpos;
			y=ypos;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par=MovieClip(parent);
			width = (stage.stageWidth-smallestWidth)*(stage.stageWidth/par.base.width)+smallestWidth;
			if(width>stage.stageWidth){
				width = stage.stageWidth;
			}
			addEventListener(MouseEvent.MOUSE_DOWN,onDown);
			stage.addEventListener(MouseEvent.MOUSE_UP,onUp);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private var xoff:uint;
		private function onDown(e:Event):void {
			scrolling=true;
			xoff=stage.mouseX-x;
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private var xdes:int;
		private function onLoop(e:Event):void {
			xdes=stage.mouseX-xoff;
			if (xdes<0) {
				xdes=0;
			} else if (xdes+width>stage.stageWidth) {
				xdes=stage.stageWidth-width;
			}
			x += (xdes-x)*ease;
			//Changing base x
			if (par.base.width>stage.stageWidth) {
				var slidepos:Number = -(x/(stage.stageWidth-width));//value 0-1
				var basepos:Number = ((par.base.width)-stage.stageWidth);//value 0-maxX
				par.base.x = slidepos*basepos;

				//x:0 to stagewidth-width
				//0 to width-stagewidth
			}
		}
		private function onUp(e:Event):void {
			scrolling=false;
			removeEventListener(Event.ENTER_FRAME,onLoop);
		}
	}
}