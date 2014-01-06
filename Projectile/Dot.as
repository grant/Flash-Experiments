package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Dot extends MovieClip {
		public function Dot(px:int,py:int):void {
			if(px<0||py<0||px>1000||py>800){
				addEventListener(Event.ADDED_TO_STAGE,removeThis);
			} else {
				x = px;
				y = py;
				addEventListener(Event.ENTER_FRAME,kill);
			}
		}
		private var i:uint = 0;
		private var timer:uint = 60;
		private function kill(e:Event):void {
			if(i==timer){
				addEventListener(Event.ENTER_FRAME,decreaseAlpha);
				removeEventListener(Event.ENTER_FRAME,kill);
			} else {
				i++;
			}
		}
		private function decreaseAlpha(e:Event):void {
			if(alpha>0){
				alpha -= .1;
			} else {
				removeEventListener(Event.ENTER_FRAME,decreaseAlpha);
				remove();
			}
		}
		private function remove():void {
			MovieClip(parent).removeChild(this);
		}
		private function removeThis(e:Event):void {
			remove();
			removeEventListener(Event.ADDED_TO_STAGE,removeThis);
		}
	}
}