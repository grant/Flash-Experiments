package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		//Constants
		public const xTiles:uint = 10;
		public const yTiles:uint = 10;
		public const waterHeight:uint = 400;
		public const waterWidth:uint = 600;
		public const waterX:uint = 0;
		public const waterY:uint = 0;
		public const maxDensity:Number = 1;
		public const minDensity:Number = .5;
		public const densityDepthRate:Number = .05;
		//Not-Editable Constants
		public const tileWidth:Number = waterWidth/xTiles;
		public const tileHeight:Number = waterHeight/yTiles;
		//Arrays
		public var tankBoxes:Array;
		//MovieClips
		public var tank:MovieClip;
		public function Main():void {
			createTank();
			populateTank();
			addTank();
		}
		private function createTank():void {
			tank = new MovieClip();
			tank.x = waterX;
			tank.y = waterY;
			
			tankBoxes = new Array();
			for(var a:int = xTiles;a>=0;a--){
				tankBoxes[a] = new Array();
				for(var b:int = yTiles;b>=0;b--){
					tankBoxes[a][b] = new Water(a,b,tileWidth,tileHeight);
					tank.addChild(tankBoxes[a][b]);
				}
			}
		}
		private function populateTank():void {
			
		}
		private function addTank():void {
			addChild(tank);
		}
		private function removeTank():void {
			removeChild(tank);
		}
	}
}