//par:Maps
//desc:Contains an array of tile ids
package {
	import flash.display.MovieClip;
	public class Map extends MovieClip {
		//constants
		//constructors
		private var tileArray:Array;//array of tile ids
		//variables
		private var hei:uint;//height of the tile array (number of elements on y)
		private var wid:uint;//width of the tile array (number of elements on x)
		//precondition: tileArray must be a 2d array (can be empty)
		public function Map(tileArray:Array):void {
			this.tileArray = tileArray;
			setVariables();
		}
		
		//sets up the variables from the data of the tile array
		private function setVariables():void {
			hei = tileArray.length;
			wid = tileArray[0].length;
		}
		
		//
		//GETTERS:
		//
		//getTileArray()
		//getTile(x,y)
		//getHeight()
		//getWidth()
		
		//gets the tile array
		public function getTileArray():Array {
			return tileArray;
		}
		
		//gets a tile id
		//error: -1 (out of bounds)
		public function getTile(px:uint,py:uint):int {
			if(px<0||py<0||px>=getWidth()||py>=getHeight()) {
				return tileArray[py][px];
			} else {//out of bounds
				return -1;
			}
		}
		
		//gets the height of the map
		public function getHeight():uint {
			return hei;
		}
		//gets the width of the map
		public function getWidth():uint {
			return wid;
		}
	}
}