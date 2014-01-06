package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Building extends MovieClip {
		private const loaderLength:uint = 60;
		private var loader:uint = 0;
		private var a:uint;
		private var b:uint;
		private var par:MovieClip;
		public function Building(aa:uint,bb:uint,size:uint):void {
			a = aa;
			b = bb;
			x = a*size;
			y = b*size;
			width = size;
			height = size;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
			addEventListener(Event.ENTER_FRAME,makeShips);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent.parent);
			addEventListener(MouseEvent.CLICK,onClick);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			par.moveSelection(a,b);
		}
		private function makeShips(e:Event):void {
			if(loader==loaderLength){
				loader = 0;
				par.addShip(a,b);
			} else {
				loader++;
			}
		}
		public function remove():void {
			removeEventListener(MouseEvent.CLICK,onClick);
			par.removeChild(this);
		}
	}
}