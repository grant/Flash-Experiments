//par:(none)
//desc:Driver class of the application
package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public static var maps:Maps;//Contains preset maps
		public static var displayMap:DisplayMap;
		public function Main():void {
			setMaps();
			setDisplayMap(maps.getMap(0));
			addLayers();
			displayMap.display();
		}
		
		//
		//Set-ups
		//
		
		//sets up the preset maps
		private function setMaps():void {
			maps = new Maps();
			addChild(maps);//non-visible object
		}
		
		//sets up the display map
		private function setDisplayMap(map:Map):void {
			displayMap = new DisplayMap(map);
		}
		
		//
		//Display
		//
		
		//adds the display layers and their contents
		private function addLayers():void {
			addChild(displayMap);
		}
		
		//
		//GETTERS
		//
	}
}