//par:Main
//desc: The stage of platforms and characters where everything that deals with the map/level is displayed and data is stored
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class DisplayMap extends MovieClip {
		//constants
		private const GRAVITY:Number = 1;//acceleration of y velocity in pixels/sec/sec
		//constructors
		private var map:Map;//the map theat is currently displayed
		/////////////
		//variables//
		/////////////
		//-tile
		private var tileWidth:uint=50;//display width of a tile
		private var tileHeight:uint=50;//display height of a tile
		//-ball
		private var ballWidth:uint = 40;//display width of the ball (precondition: must be smaller than the tileWidth)
		private var ballHeight:uint = 40;//display height of the ball (precondition: must be smaller than the tileHeight)
		///////////
		//holders//
		///////////
		//-tile
		private var tileArray:Array;//array of the tile objects
		private var tileHolder:MovieClip;//holds the tiles
		//-ball
		private var ballArray:Array;//array of balls
		private var ballHolder:MovieClip;
		//parent
		private var par:MovieClip;
		public function DisplayMap(map:Map):void {
			this.map = map;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			addHolders();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		
		private function addHolders():void {
			//Organization (Greatest to least depth):
			//-Tile holder
			//-Ball holder
			
			//set-up tile holder clip
			tileHolder = new MovieClip();
			addChild(tileHolder);
			//set-up tile holder array
			var mapTileArray = map.getTileArray();//map tile array
			tileArray = new Array();//tile object array
			for(var a:uint = 0;a<mapTileArray.length;++a) {//y
				tileArray[a] = new Array();
			}
			
			//set-up ball holder clip
			ballHolder = new MovieClip();
			addChild(ballHolder);
			//set-up ball holder array
			ballArray = new Array();
		}
		
		//
		//display
		//
		
		//displays the map
		public function display():void {
			var mapTileArray = map.getTileArray();
			for(var a:uint = 0;a<mapTileArray.length;++a) {//y
				for(var b:uint = 0;b<mapTileArray[0].length;++b) {//x
					var px:uint = tileWidth*b;
					var py:uint = tileHeight*a;
					if(Main.maps.isTile(mapTileArray[a][b])) {//tile id is a physical tile
						tileArray[a][b] = new Tile(mapTileArray[a][b],px,py,tileWidth,tileHeight);
						tileHolder.addChild(tileArray[a][b]);
					} else if(Main.maps.isBall(mapTileArray[a][b])) {//tile id is a ball
						ballArray.push(new Ball(1,px,py,ballWidth,ballHeight,tileWidth,tileHeight));
						ballHolder.addChild(ballArray[ballArray.length-1]);//add ball that was just created
					}
				}
			}
		}
		
		//
		//SETTERS:
		//setTileWidth(wid:uint)
		//setTileHeight(hei:uint)
		//
		
		//sets the tileWidth
		public function setTileWidth(wid:uint):void {
			tileWidth = wid;
		}
		
		//sets the tileHeight
		public function setTileHeight(hei:uint):void {
			tileHeight = hei;
		}
		
		//
		//GETTERS:
		//getGraivty()
		//
		
		//gets the gravity constant
		public function getGravity():Number {
			return GRAVITY;
		}
	}
}