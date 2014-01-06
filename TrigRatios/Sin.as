package {
	import flash.display.Sprite;
	import flash.events.Event;
	public class Sin extends Sprite {
		public var center:uint;
		public var alteredRotation:Number;
		public function Sin(xPos:uint,yPos:uint) {
			center = xPos;
			const startWidth = 150;
			const startHeight = 3;
			width = startWidth;
			height = startHeight;
			x = xPos;
			y = yPos;
			addEventListener(Event.ENTER_FRAME,loop);
		}
		public function loop(e:Event):void {
			alteredRotation = Math.abs(rotation-360);
			if(alteredRotation>=360){
				alteredRotation-=360;
			}
			if(stage.mouseY<center){
				if(stage.mouseX>center){//I
					rotation=Math.tan(.9);
				} else {//II
					
				}
			} else {
				if(stage.mouseX<center){//III
					
				} else {//IV
					
				}
			}
		}
	}
}