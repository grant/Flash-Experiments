package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		//tiles
		private const tileSize:uint = 50;
		//maps
		private var maps:Array = new Array();
		private var currentMap:uint;
		private var mapTiles:Array;
		private var mapMC:MovieClip;
		public function Main():void {
			setMaps();
			setCurrentMap(0);
			displayMap();
			addChar();
		}
		//setMaps
		private function setMaps():void {
			var map0:Array = new Array();
			map0[0] = new Array(0,0,0,0,0,0,0);
			map0[1] = new Array(0,0,0,1,0,0,0);
			map0[2] = new Array(0,0,0,1,0,0,0);
			map0[3] = new Array(0,0,0,1,0,0,0);
			map0[4] = new Array(0,0,0,0,0,0,0);
			
			maps[0] = map0;
		}
		//setCurrentMap
		private function setCurrentMap(id:uint):void {
			currentMap = id;
		}
		//getCurrentMap
		public function getCurrentMap():Array {
			return maps[currentMap];
		}
		//displayMap
		private function displayMap():void {
			var map:Array = getCurrentMap();
			
			//mapMC
			mapMC = new MovieClip();
			addChild(mapMC);
			
			mapTiles = new Array();
			for(var a:uint = 0;a<map.length;a++) {//y
				mapTiles[a] = new Array();
				for(var b:uint = 0;b<map[0].length;b++) {//x
					mapTiles[a][b] = new Tile(b,a,map[a][b]);
					mapMC.addChild(mapTiles[a][b]);
				}
			}
		}
		//addChar
		private function addChar():void {
			var char = new Char(1,2,5,2);
			addChild(char);
		}
		//getTileSize
		public function getTileSize():uint {
			return tileSize;
		}
	}
}