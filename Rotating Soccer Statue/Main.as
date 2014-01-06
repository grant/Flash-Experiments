package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Main extends MovieClip {
		private var prevY:uint = 0;
		private var timer:uint = 0;
		public function Main():void {
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private function onLoop(e:Event):void {
			if(stage.mouseY!=prevY) {
				timer = 0;
			}
			
			prevY = stage.mouseY;
			
			if(timer<10) {
				var frame:uint = (Math.abs((stage.mouseY/stage.stageHeight)*images.totalFrames)*10)%images.totalFrames;
				images.gotoAndStop(frame);
			} else {
				if(images.currentFrame==images.totalFrames) {
					images.gotoAndStop(1);
				} else {
					images.gotoAndStop(images.currentFrame+1);
				}
			}
			
			timer++;
		}
	}
}