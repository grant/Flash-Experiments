package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public const SCREEN_WIDTH:uint = 600;
		public const SCREEN_HEIGHT:uint = 400;
		public var eye:Array;
		public var eyeX:Array;
		public var eyeY:Array;
		public var eyeZ:Array;
		public var eyeViewPoint:Array = new Array(1000,1000,1000);
		public function Main():void {
			addEye();
			addDots();
		}
		private function addEye():void {
			//x,y,z
			eye = new Array(0,0,0);
			eyeX = new Array(eyeViewPoint[0],eye[1],eye[2]);
			eyeY = new Array(eye[0],eyeViewPoint[1],eye[2]);
			eyeZ = new Array(eye[0],eye[1],eyeViewPoint[2]);
		}
		private function addDots():void {
			//x,y,z,scale
			var dot:Dot = new Dot(0,1,1,10);
			addChild(dot);
		}
	}
}