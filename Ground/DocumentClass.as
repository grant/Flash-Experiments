package {
	import flash.display.Sprite;
	public class DocumentClass extends Sprite {
		public var groundHolder:Array = new Array();
		public function DocumentClass() {
			groundHolder[0] = new Ground(100,100,200,200);
			groundHolder[1] = new Ground(0,0,30,50);
			for(var i:uint=0;i<groundHolder.length;i++){
				addChild(groundHolder[i]);
			}
		}
	}
}