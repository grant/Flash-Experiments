package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	public class Main extends Sprite {
		public var cookie:SharedObject = SharedObject.getLocal("xyPosition");
		public function Main() {
			stage.addEventListener(MouseEvent.MOUSE_MOVE,onMove);
			stage.addEventListener(MouseEvent.CLICK,onClick);
		}
		private var i:Number = 2;
		private function onMove(e:MouseEvent):void {
			var block:SharedObject = SharedObject.getLocal("xyPosition");
			i -= .001;
			var obj:asdf = new asdf(block.data.xPos,block.data.yPos,i);
			addChild(obj);
		}
		private function onClick(e:MouseEvent):void {
			cookie.data.xPos = stage.mouseX;
			cookie.data.yPos = stage.mouseY;
			cookie.flush();
			//Erases data:
			//cookie.clear();
		}
	}
}