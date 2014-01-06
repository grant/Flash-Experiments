/* Notes

- Z Up/Down
- X Left/Right
- Y Forward/Back

MAPS:

Contains blocks

Organization:

Maps contain layers (bottom to top)
Layers contain XY 

*/
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Main extends MovieClip {
		private const maxZDepth:uint = 100;
		private var viewers:Array = new Array();
		private var maps:Array = new Array();
		private var currentMap:Array;
		public function Main():void {
			fillMaps();
			selectMap(0);
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			createViewer(0,0,300,200,"Top",0,0);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function fillMaps():void {
			var m0l0 = new Array(new Array(0,0,0),
								 new Array(0,0,0),
								 new Array(0,0,0));
			var m0l1 = new Array(new Array(0,0,0),
								 new Array(0,1,0),
								 new Array(0,0,0));
			var m0l2 = new Array(new Array(0,0,0),
								 new Array(0,0,0),
								 new Array(0,0,0));
								 
			var m0:Array = new Array(m0l0,m0l1,m0l2);
			maps[0] = new Array(m0);
		}
		private function selectMap(mapIndex:uint):void {
			currentMap = maps[mapIndex];
		}
		private function createViewer(x1:int,y1:uint,x2:int,y2:int,dir:String,px:uint,py:uint) {
			//if px and py are 0, they are set to the center
			if(px==0){ px = Math.ceil(currentMap[0][0].length); }
			if(py==0){ py = Math.ceil(currentMap[0].length); }
			viewers.push(new Viewer(x1,y1,x2,y2,dir,px,py));
			addChild(viewers[viewers.length-1]);
		}
	}
}