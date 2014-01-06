//Cob = center of balance
package {
	import flash.display.MovieClip;
	public class Cob extends MovieClip {
		private var px:Number;
		private var py:Number;
		private var wid:uint;
		private var hei:uint;
		public function Cob(px:Number,py:Number,wid:uint,hei:uint):void {
			this.px = px;
			this.py = py;
			this.wid = wid;
			this.hei = hei;
			updateXY();
		}
		public function updatePosition(px:Number,py:Number):void {
			this.px = px;
			this.py = py;
			updateXY();
		}
		private function updateXY():void {
			x = px*wid;
			y = py*hei;
		}
	}
}