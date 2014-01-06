package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Char extends MovieClip {
		//start
		private var x1:uint;
		private var y1:uint;
		//end
		private var x2:uint;
		private var y2:uint;
		//parent
		private var par:MovieClip;
		public function Char(x1:uint,y1:uint,x2:uint,y2:uint):void {
			this.x1 = x1;
			this.y1 = y1;
			this.x2 = x2;
			this.y2 = y2;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			//parent
			par = MovieClip(parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
			//methods
			setPosition();
			findPath();
		}
		private function setPosition():void {
			x = x1*par.getTileSize();
			y = y1*par.getTileSize();
		}
		private function findPath():void {
			var a:Astar = new Astar(par.getCurrentMap());
			var path:Array = a.getPath(x1,y1,x2,y2);
			trace("Path: ",path,"\nPathLength: ",path.length);
		}
	}
}