/*
Organization:

Layers:
-Background
-Buttons
-Cover

Description:
Frame: A single slide that can be moved
Buttons: Navigation buttons
Cover: An image ontop of everthing else

Directions:
"Random" - random direction
"Left" - moves everything to the left
"Right" - moves everything to the right
"Up" - moves everything up
"Down" - moves everything down

*/
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Main extends MovieClip {
		private var cover:Cover = new Cover();
		private var coverLayer:MovieClip = new MovieClip();
		
		private var buttons:Array = new Array();
		private const buttonSize:Array = new Array(25,25);
		private var buttonMCs:Array = new Array();
		private var buttonLayer:MovieClip = new MovieClip();
		
		private var backgroundLayer:Bgs = new Bgs();
		
		private var timerDelay:uint = 1;//seconds
		private var timer:uint = 0;
		
		private const startFrame:uint = 0;
		
		private var currFrame:uint = 0;
		
		public function Main():void {
			timerDelay*=24;
			addButtonPlaces();
			addItems();
			addEventListener(Event.ENTER_FRAME,startTimer);
		}
		private function addButtonPlaces():void {
			buttons[0] = new Array(1025,237.5);
			buttons[1] = new Array(1025,275);
			buttons[2] = new Array(1025,312.5);
			buttons[3] = new Array(1025,350);
		}
		private function addItems():void {
			
			//Backgrounds
			addChild(backgroundLayer);
			
			backgroundLayer.createFrame("Middle",startFrame);
			
			//Buttons
			addChild(buttonLayer);
			for(var a:uint = 0;a < buttons.length; a++){
				buttonMCs[a] = new Btn(a,buttons[a][0],buttons[a][1],buttonSize[0],buttonSize[1]);
				buttonLayer.addChild(buttonMCs[a]);
			}
			
			//Cover
			addChild(coverLayer);
			coverLayer.addChild(cover);
		}
		private function startTimer(e:Event):void {
			trace(currFrame);
			if(timer==timerDelay){
				timer = 0;
				backgroundLayer.createFrame("Random",currFrame);
				currFrame++;
				if(currFrame==buttons.length){
					currFrame = 0;
				}
			} else {
				timer++;
			}
		}
	}
}