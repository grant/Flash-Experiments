package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Coin extends MovieClip {
		private const gravity:int = 1;
		private const bounce:Number = .5;
		private const speed:uint = 10;
		private const setGround:Boolean = false;
		private const ground:int = 300;
		private var xs:Number = Math.random()*speed-(speed/2);
		private var ys:Number = Math.random()*speed-(speed/2);
		public function Coin(xMouse:int,yMouse:int) {
			x = xMouse;
			y = yMouse;
			x += xs;
			y += ys;
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private function onLoop(e:Event):void {
			x += xs;
			y += ys;
			ys += gravity;
			
			if(setGround==true){
				if(y - (height/2) >= ground){
					y = ground;
					ys = -ys*bounce;
				}
			}			
			
			if(x-(width/2)>stage.stageWidth){
				removeEventListener(Event.ENTER_FRAME,onLoop);
				parent.removeChild(this);
			} else if(x+(width/2)<0){
				removeEventListener(Event.ENTER_FRAME,onLoop);
				parent.removeChild(this);
			} else if(y+height<0){
				removeEventListener(Event.ENTER_FRAME,onLoop);
				parent.removeChild(this);
			} else if(y-height>stage.stageHeight){
				removeEventListener(Event.ENTER_FRAME,onLoop);
				parent.removeChild(this);
			}
		}
	}
}