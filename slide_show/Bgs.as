//Background layer
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Bgs extends MovieClip {
		public var current:uint=0;
		public var frame1:MovieClip;
		public var frame2:MovieClip;

		private var firstFrame:Boolean=true;

		private var par:MovieClip;
		public function Bgs():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par=MovieClip(parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		public function createFrame(dir:String,bgNum:uint):void {
			if (dir=="Random") {
				dir=findRandomDirection();
			}
			var frame:Frame=new Frame(dir,bgNum);

			if (firstFrame) {
				firstFrame=false;
				frame1=frame;
				addChild(frame1);
			} else {
				current=current==0?1:0;
				if (current==0) {
					frame1=frame;
					frame1.easeMove("Middle");
					frame2.easeMove(dir);
					addChild(frame1);
				} else {
					frame2=frame;
					frame1.easeMove(dir);
					frame2.easeMove("Middle");
					addChild(frame2);
				}
			}
		}
		private function findRandomDirection():String {
			var dir:String;
			var r:uint=Math.floor(Math.random()*4);
			switch (r) {
				case 0 :
					dir="Up";
					break;
				case 1 :
					dir="Down";
					break;
				case 2 :
					dir="Left";
					break;
				case 3 :
					dir="Right";
					break;
			}
			return dir;
		}
	}
}