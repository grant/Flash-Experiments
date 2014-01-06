package {
	import flash.display.MovieClip;
	public class Board extends MovieClip {
		//Constants
		public const xTiles:uint=5;
		public const yTiles:uint=5;
		public const tileW:uint=100;
		public const tileH:uint=50;
		//Arrays
		public var tileHolder:Array;
		
		public function Board(xPos:int,yPos:int) {
			x=xPos;
			y=yPos;
			setTiles();
		}
		private function setTiles():void {
			tileHolder = new Array();
			for (var a:uint = 0; a<xTiles; a++) {
				tileHolder[a] = new Array();
				for (var b:uint = 0; b<yTiles; b++) {
					tileHolder[a][b]=new Tile(a,b,tileW,tileH);
					addChild(tileHolder[a][b]);
					sortChildrenByY(tileHolder[a][b]);
				}
			}
		}

		public function sortChildrenByY(container:MovieClip):void {
			var i:int;
			var childList:Array = new Array();

			// first put all children in an array
			i=container.numChildren;
			while (i--) {
				childList[i]=container.getChildAt(i);
			}

			// next, sort the array based on the
			// elements' y property
			childList.sortOn("y", Array.NUMERIC);

			// now match the arrangement of the array
			// with the arrangement of the display list
			i=container.numChildren;
			while (i--) {

				// if the child at position i in the array
				// does not match the child at position
				// i in the display list, set that child
				// to the i position in the display list
				if (childList[i]!=container.getChildAt(i)) {
					container.setChildIndex(childList[i], i);
				}
			}
		}



	}
}