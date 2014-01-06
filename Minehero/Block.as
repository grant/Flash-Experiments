package {
	import flash.display.MovieClip;
	public class Block extends MovieClip {
		private var posX:uint;
		private var posY:uint;
		private var wid:uint;
		public function Block(a:uint,b:uint,type:uint,w:uint):void {
			posX = a;
			posY = b;
			wid = w;
			width = w;
			height = w;
			x = a*width;
			y = b*height
			gotoAndStop(type+1);
		}
	}
}