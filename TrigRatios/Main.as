package {
	import flash.display.Sprite;
	public class Main extends Sprite {
		public const centerX:uint = 225;
		public const centerY:uint = 250;
		public var sin:Sin = new Sin(centerX,centerY);
		public var cos:Cos = new Cos(centerX,centerY);
		public var tan:Tan = new Tan(centerX,centerY);
		public var csc:Csc = new Csc(centerX,centerY);
		public var sec:Sec = new Sec(centerX,centerY);
		public var cot:Cot = new Cot(centerX,centerY);
		public function Main(){
			addChild(sin);
			addChild(cos);
			addChild(tan);
			addChild(csc);
			addChild(sec);
			addChild(cot);
		}
	}
}
			