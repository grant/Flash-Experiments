package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Tile extends MovieClip {
		private var a:uint;
		private var b:uint;
		private var walkable:uint;
		//parent
		private var par:MovieClip;
		public function Tile(a:uint,b:uint,walkable:uint):void {
			this.a = a;
			this.b = b;
			this.walkable = walkable;
			gotoAndStop(this.walkable+1);
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function setPosition():void {
			x = a*par.getTileSize();
			y = b*par.getTileSize();
		}
		private function onAdd(e:Event):void {
			//parent
			par = MovieClip(parent.parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
			//methods
			setPosition();
		}
	}
}