package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Dot extends MovieClip {
		private var px:uint;
		private var py:uint;
		private var spacing:uint;
		private var size:uint;
		private var turnedOn:Boolean;
		
		private var connections:Array = new Array();
		
		private var par2:MovieClip;
		public function Dot(posx:uint,posy:uint,space:uint,s:uint,turnOn:Boolean):void {
			stop();
			//add properties
			px = posx;
			py = posy;
			spacing = space;
			size = s;
			turnedOn = turnOn;
			//end adding properties
			x = px*spacing+(spacing/2);
			y = py*spacing+(spacing/2);
			width = size;
			height = size;
			alpha = (turnedOn)?.5:.1;
			//addEventListener(Event.ENTER_FRAME,onLoop);
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par2 = MovieClip(parent.parent);
			connections = par2.getNeighbors(px,py);
			if(turnedOn){
				//ENABLE TO HAVE PHYSICALLY CONNECTED
				//width = spacing;
				//height = spacing;
				setTile();
			}
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onLoop(e:Event):void {

		}
		private function setTile():void {
			//Calculate number of adjacent on tiles
			var numOns:uint = 0;
			for(var a:uint = 0;a<connections.length;a++){
				numOns+=(connections[a])?1:0;
			}
			//Set Tile
			if(numOns==4||numOns==3){
				gotoAndStop(4);//square
			} else if(numOns==0){
				gotoAndStop(1);//dot
			} else if(numOns==1){
				gotoAndStop(2);//end of line
				//rotate
				if(connections[0]){
					rotation = 0;
				} else if(connections[1]){
					rotation = 90;
				} else if(connections[2]){
					rotation = 180;
				} else {
					rotation = 270;
				}
			} else if(numOns==2){
				if((connections[0]&&connections[2])||(connections[1]&&connections[3])){//across from each other
					gotoAndStop(4);//square
				} else {
					gotoAndStop(3);
					//rotation 
					if(connections[0]&&connections[1]){
						rotation = 0;
					} else if(connections[1]&&connections[2]){
						rotation = 90;
					} else if(connections[2]&&connections[3]){
						rotation = 180;
					} else {
						rotation = 270;
					}
				}
			}
		}
	}
}