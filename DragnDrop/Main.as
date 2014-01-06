package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public var box1:Box = new Box(0,0,200,300);
		public var box2:Box = new Box(200,0,200,300);
		public function Main():void {
			addChild(box1);
			box2.y += 50;
			addChild(box2);
		}
	}
}