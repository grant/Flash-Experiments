package {
	import flash.display.Sprite;
	public class Main extends Sprite {
		public const xPos:uint = 100;
		public const yPos:uint = 100;
		public var pieArray:Array;
		public function Main() {
			pieArray = new Array();
			pieArray[0] = new PieSlice(0,0,60);
			pieArray[1] = new PieSlice(1,70,200);
			pieArray[2] = new PieSlice(2,250,300);
			pieArray[3] = new PieSlice(3,330,340);
			for(var i = 0;i < pieArray.length;i++){
				addChild(pieArray[i]);
			}
		}
	}
}