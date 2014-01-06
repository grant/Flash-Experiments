//par:MovieClip (holder)
//par2:BallEnvironment
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Ball extends MovieClip {
		//constructors
		private var graphicId:uint;//the hash to the frame number of the graphic to use
		private var px:int=0;//position x relative to the 0,0 of the ballEnvironment
		private var py:int=0;//position y relative to the 0,0 of the ballEnvironment
		private var radius:int;//radius of the ball
		//variables
		//-switchers (variables that are changed only when switched or manually changed)
		private var gravityEnabled:Boolean = true;//if gravity is enabled or not
		private var GRAVITY:Number;//gravity constant for this ball
		//-movers (variables that can change constantly)
		private var vx:Number=0;//velocity on x axis
		private var vy:Number=0;//velocity on y axis
		//parent
		private var par2:MovieClip;
		public function Ball(graphicId:uint,px:int,py:int,radius:int):void {
			this.graphicId = graphicId;
			this.px = px;
			this.py = py;
			this.radius = radius;
			//END constructors
			gotoAndStop(graphicId);
			x = px;
			y = py;
			this.width = radius*2;
			this.height = radius*2;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par2 = MovieClip(parent.parent);
			getExternalVariables();
			if(gravityEnabled) {
				addEventListener(Event.ENTER_FRAME,moveBall);
			}
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		//gets variables from other packages
		private function getExternalVariables():void {
			GRAVITY = par2.getGravity();
		}
		
		//moves the ball according to forces placed on it
		private function moveBall(e:Event):void {
			//accelerate vy
			vy += GRAVITY;
			//move the ball
			x += vx;
			y += vy;
		}
	}
}