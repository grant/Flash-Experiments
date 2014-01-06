package {
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	public class Main extends Sprite {
		public function Main() {
			var pt1:Point = new Point(circle1.x, circle1.y); 
			pt1 = circle1.localToGlobal(pt1); 
			var pt2:Point = new Point(circle2.x, circle2.y); 
			pt2 = circle2.localToGlobal(pt2); 
			var distance:Number = Point.distance(pt1, pt2);
		}
	}
}