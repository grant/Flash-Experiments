package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Btn extends MovieClip {
		private var id:uint;
		private var par:MovieClip;
		private var wid:uint;
		private var hei:uint;
		public function Btn(i:uint,px:int,py:int,w:uint,h:uint):void {
			id = i;
			x = px;
			y = py;
			wid = w;
			hei = h;
			width = w;
			height = h;
			stop();
			
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
			
			addEventListener(MouseEvent.ROLL_OVER,over);
			addEventListener(MouseEvent.ROLL_OUT,out);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function over(e:MouseEvent):void {
			gotoAndStop(2);
		}
		private function out(e:MouseEvent):void {
			gotoAndStop(1);
		}
	}
}