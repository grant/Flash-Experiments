package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Dot extends MovieClip {
		private var px:uint;
		private var py:uint;
		private var spacing:uint;
		private var size:uint;
		public function Dot(posx:uint,posy:uint,space:uint,s:uint):void {
			//add properties
			px = posx;
			py = posy;
			spacing = space;
			size = s;
			//end adding properties
			x = px*spacing+(spacing/2);
			y = py*spacing+(spacing/2);
			width = size;
			height = size;
			alpha = Math.random()*(py/100);
			//alpha = .1;
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private function onLoop(e:Event):void {
			alpha = Math.random()*(py/100);
		}
	}
}