//par:Main
//desc:Contains array preset map objects
package {
	import flash.display.MovieClip;
	public class Maps extends MovieClip {
		//constants
		public const TILE_EMPTY:uint = 0;
		public const TILE_BALL:uint = 1;
		public const TILE_STATIC:uint = 2;
		//variables
		private var presetMaps:Array;
		private var maps:Array;//array of Map objects
		public function Maps():void {
			setPresetMaps();
			setMaps();
		}
		
		//sets up the preset maps
		private function setPresetMaps():void {
			presetMaps = new Array();
			//Legend: Look at constants above
			//Preset map #1:
			presetMaps[0] = new Array();
			presetMaps[0][0] = new Array(00,00,00,00,02);
			presetMaps[0][1] = new Array(01,00,00,00,02);
			presetMaps[0][2] = new Array(02,00,00,00,02);
			presetMaps[0][3] = new Array(02,02,00,00,02);
			presetMaps[0][4] = new Array(02,02,02,02,02);
		}
		
		//sets up the maps
		private function setMaps():void {
			maps = new Array();
			maps[0] = new Map(getPresetTileArray(0));
		}
		
		//
		//Checkers
		//
		
		//checks if the tile is a physical tile
		public function isTile(tileId:uint):Boolean {
			var answer:Boolean;
			if(tileId==TILE_EMPTY||tileId==TILE_BALL) {
				answer = false;
			} else {
				answer = true;
			}
			return answer;
		}
		
		//checks if the tile is a ball
		public function isBall(tileId:uint):Boolean {
			return (tileId==TILE_BALL);
		}
		
		//
		//Getters
		//
		
		//gets the number of maps
		public function getNumMaps():uint {
			return maps.length;
		}
		
		//gets a Map object
		public function getMap(id:uint):Map {
			return maps[id];
		}
		
		//gets a preset tile array
		public function getPresetTileArray(id:uint):Array {
			return presetMaps[id];
		}
	}
}