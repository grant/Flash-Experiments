package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	public class Tile extends MovieClip {
		public function Tile(a:uint,b:uint,tileW:uint,tileH:uint) {
			x = (tileW/2)*(a-b);
			y = ((tileH/2)*a)+((tileH/2)*b);
			//to change height/width, go to the FLA to change the tile size
			stop();
			addEventListener(MouseEvent.CLICK,onClick);
		}
		private function onClick(e:MouseEvent):void {
			if(currentFrame!=totalFrames){
				gotoAndStop(currentFrame+1);
			}
		}
	}
}