package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Block extends MovieClip {
		public var off:Boolean;
		private var par:MovieClip;
		private var a:uint;
		public var b:uint;
		public function Block(aa:uint,bb:uint,size:uint,o:Boolean):void {
			off = o;
			gotoAndStop(off+1);
			a = aa;
			b = bb;
			x = a*size;
			y = b*size;
			width = size;
			height = size;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			addEventListener(MouseEvent.ROLL_OVER,onRoll);
			stage.addEventListener(MouseEvent.MOUSE_DOWN,onDown);
			stage.addEventListener(MouseEvent.MOUSE_UP,onUp);
			addEventListener(MouseEvent.MOUSE_DOWN,onClick);
			
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			switchOff();
		}
		private var mouseIsDown:Boolean = false;
		private function onDown(e:MouseEvent):void {
			mouseIsDown = true;
		}
		private function onUp(e:MouseEvent):void {
			mouseIsDown = false;
		}
		private function onRoll(e:MouseEvent):void {
			if(mouseIsDown){
				switchOff();
			}
		}
		private function switchOff():void {
			if(!MovieClip(parent.parent).scroller.scrolling){
			if(!par.changing){
				par.changing=true;
				if(off){
					par.off=false;
				} else {
					par.off=true;
				}
			}
			off = par.off;
			gotoAndStop(off+1);
			}
		}
	}
}