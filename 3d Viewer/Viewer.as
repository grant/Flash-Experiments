/** Notes
Layers

- frame
- boxes
- grid

*/
package {
	import flash.display.MovieClip;
	public class Viewer extends MovieClip {
		private const frameThickness:uint = 2;
		private var frame:MovieClip = new MovieClip();
		public function Viewer(x1:int,y1:int,x2:int,y2:int,dir:String,px:uint,py:uint):void {
			x = x1;
			y = y1;
			var px:uint = x2-x1;
			var py:uint = y2-y1;
			frame.addChild(new Box(0,0,px,frameThickness));
			frame.addChild(new Box(px-frameThickness,frameThickness,px,py-frameThickness));
			frame.addChild(new Box(0,frameThickness,frameThickness,py-frameThickness));
			frame.addChild(new Box(0,py-frameThickness,px,py));
			addChild(frame);
		}
	}
}