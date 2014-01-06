//Corner to corner black box
package {
	import flash.display.MovieClip;
	public class Box extends MovieClip {
		public function Box(x1:int,y1:int,x2:int,y2:int):void {
			var px:int = x1<x2?x1:x2;
			var py:int = y1<y2?y1:y2;
			var w:uint = Math.abs(x1-x2);
			var h:uint = Math.abs(y1-y2);
			x = px
			y = py;
			width = w;
			height = h;
		}
	}
}