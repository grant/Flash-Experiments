package {
	import flash.display.MovieClip;
	public class Game extends MovieClip {
		private const blockWidth:uint = 50;
		
		private var levels:Array;
		
		private var hero:Hero;
		
		public var map:MovieClip;
		public var currentMap:Array;
		public function Game():void {
			makeLevels();
			addMap(0);
			addHero(1,1);
		}
		private function makeLevels():void {
			var level1:Array = new Array();
			level1[0] = [1,1,2,3,2];
			level1[1] = [1,0,1,3,3];
			level1[2] = [1,1,2,3,2];
			level1[3] = [1,0,1,3,3];
			level1[4] = [4,4,2,2,2];
			level1[5] = [4,4,1,2,0];
			levels = new Array(level1);
		}
		private function addMap(levelNumber):void {
			map = new MovieClip();
			var level = levels[levelNumber];
			currentMap= new Array();
			for(var a:uint = 0;a<level.length;a++){
				currentMap[a] = new Array();
				for(var b:uint = 0;b<level[a].length;b++){
					currentMap[a][b] = level[a][b];
					var block:Block = new Block(b,a,currentMap[a][b],blockWidth);
					map.addChild(block);
				}
			}
			addChild(map);
		}
		private function addHero(px:uint,py:uint):void {
			hero = new Hero(px,py,blockWidth);
			addChild(hero);
		}
	}
}
