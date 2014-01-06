/*
Notes:

Created by Grant Timmerman
Date: 8/28/2010

//////////////////////////////
GDD:

Creates levels for RPG game.

Heirarchy:

Main>Editor

Editor>Maps
	  >HUD
	  
Maps>Map (current Map)
Map>Layers
Layers>Ground
	  >Environment
	  >Items
	  >Misc.
	  All fall into tiles
	  
HUD>Choose map
   >Publish map array code
   >Import map array code
   >Create new map
   		>Set dimentions
		>Set default tile
   >Add/Subtract map width on all sides
   >Choose Tile
*/
package {
	import flash.display.Sprite;
	public class Main extends Sprite {
		private var editor:Editor = new Editor();
		public function Main():void {
			addChild(editor);
		}
	}
}