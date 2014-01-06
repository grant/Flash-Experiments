package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Box extends MovieClip {
		private var startX:uint;
		private var startY:uint;
		private var down:Boolean = false;
		private var grabX:uint;
		public function Box(px:uint,py:uint,wid:uint,hei:uint):void {
			startX = px;
			startY = py;
			x = startX;
			y = startY;
			width = wid;
			height = hei;
			addEventListener(MouseEvent.MOUSE_DOWN,ifDown);
			addEventListener(MouseEvent.MOUSE_UP,ifUp);
			addEventListener(Event.ENTER_FRAME,moveXY);
		}
		private function ifDown(e:MouseEvent):void {
			down = true;
			alpha = .5;
			grabX = stage.mouseX-x;
		}
		private function ifUp(e:MouseEvent):void {
			down = false;
			alpha = 1;
			if(startX-stage.mouseX<width/2){
				x = 0;
				MovieClip(parent).box2.x = 200;
			} else {
				x = 0;
			}
		}
		private function moveXY(e:Event):void {
			if(down){
				x = stage.mouseX-grabX;
			}
		}
	}
}