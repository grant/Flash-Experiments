package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Tile extends MovieClip {
		private var a:uint;
		private var b:uint;
		private var par:MovieClip;
		public function Tile(aa:uint,bb:uint,frame:uint,size:uint):void {
			a = aa;
			b = bb;
			gotoAndStop(frame);
			width = size;
			height = size;
			x = size*a;
			y = size*b;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent.parent);
			addEventListener(MouseEvent.CLICK,onClick);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			par.makeBuilding(a,b);
		}
		public function remove():void {
			removeEventListener(MouseEvent.CLICK,onClick);
			par.removeChild(this);
		}
	}
}