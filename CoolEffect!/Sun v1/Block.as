package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Block extends MovieClip {
		private var xDes:int=0;
		private var yDes:int=0;
		private var xPos:int=0;
		private var yPos:int=0;
		private var ease:Number;
		public function Block(wid:uint,hei:uint,xRelative:int,yRelative:int) {
			width = wid;
			height = hei;
			xPos = xRelative;
			yPos = yRelative;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private function onAdd(e:Event):void {
			x = xPos + stage.mouseX;
			y = yPos + stage.mouseY;
			var xDis:Number = Math.abs(stage.mouseX-this.x);
			var yDis:Number = Math.abs(stage.mouseY-this.y);
			var dis:Number = Math.sqrt((xDis*xDis)+(yDis*yDis));
			if(dis>180){
				removeEventListener(Event.ENTER_FRAME,onLoop);
				parent.removeChild(this);
			}
			ease = ((MovieClip(parent).maxDis-dis)/MovieClip(parent).maxDis);
			alpha = ease;
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onLoop(e:Event):void {
			xDes = xPos + stage.mouseX;
			yDes = yPos + stage.mouseY;
			x += (xDes-x)*ease;
			y += (yDes-y)*ease;
		}
	}
}