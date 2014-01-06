package {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	public class Hero extends MovieClip {
		public function Hero(posX:uint,posY:uint,w:uint):void {
			x = posX*w;
			y = posY*w;
			width = w;
			height = w;
		}
	}
}