package {
	import flash.display.Sprite;
	import flash.events.Event;
	public class Sec extends Sprite {
		public function Sec(xPos:uint,yPos:uint) {
			const startWidth = 150;
			const startHeight = 3;
			width = startWidth;
			height = startHeight;
			x = xPos;
			y = yPos;
			addEventListener(Event.ENTER_FRAME,loop);
		}
		public function loop(e:Event):void {
			rotation+=5;
		}
	}
}