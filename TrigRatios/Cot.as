package {
	import flash.display.Sprite;
	import flash.events.Event;
	public class Cot extends Sprite {
		public function Cot(xPos:uint,yPos:uint) {
			const startWidth = 150;
			const startHeight = 3;
			width = startWidth;
			height = startHeight;
			x = xPos;
			y = yPos;
		addEventListener(Event.ENTER_FRAME,loop);
		}
		public function loop(e:Event):void {
			rotation+=6;
		}
	}
}