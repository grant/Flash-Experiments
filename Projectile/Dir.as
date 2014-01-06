package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Dir extends MovieClip {
		private var px:uint;
		private var py:uint;
		public function Dir(startX:uint,startY:uint):void {
			px = startX;
			py = startY;
			x = px;
			y = py;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addEventListener(Event.ENTER_FRAME,onLoop);
			stage.addEventListener(MouseEvent.MOUSE_UP,onUp);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onLoop(e:Event):void {
			rotation = 0;
			
			var disX:Number = Math.abs(stage.mouseX-x);
			var disY:Number = Math.abs(stage.mouseY-y);
			var dis:Number = Math.sqrt((disX*disX)+(disY*disY));
			width = dis;
			
			var myRadians:Number = Math.atan2(stage.mouseY-y, stage.mouseX-x);
			var myDegrees:Number = Math.round((myRadians*180/Math.PI));
			rotation = myDegrees;
		}
		private function onUp(e:Event):void {
			removeEventListener(Event.ENTER_FRAME,onLoop);
			stage.removeEventListener(MouseEvent.MOUSE_UP,onUp);
			MovieClip(parent).removeChild(this);
		}
	}
}