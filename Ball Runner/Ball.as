//par1:Holder
//par2:DisplayMap
//desc: A controllable ball that moves according to gravitational acceleration, tiles it touches and external forces
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Ball extends MovieClip {
		//constructors
		private var id:uint;//frame number and id of the ball
		private var ballWidth:uint;//display width of the ball
		private var ballHeight:uint;//display height of the ball
		private var tileWidth:uint;//display width of tiles
		private var tileHeight:uint;//display height of tiles
		//variables
		//-constant variables
		private var GRAVITY:Number;//acceleration of y velocity in pixels/sec/sec
		//-switch variables
		private var paused:Boolean = false;
		private var gravityEnabled:Boolean = true;
		//-changing variables
		private var px:int=0;//pixels x from the displayMap
		private var py:int=0;//pixels y from the displayMap
		private var vx:Number=0;//pixels traveling per frame on x axis
		private var vy:Number=0;//pixels traveling per frame on y axis
		//parent
		private var par2:MovieClip;//DisplayMap
		public function Ball(id:uint,px:int,py:int,ballWidth:uint,ballHeight:uint,tileWidth:uint,tileHeight:uint):void {
			this.id = id;
			this.px = px;
			this.py = py;
			this.ballWidth = ballWidth;
			this.ballHeight = ballHeight;
			this.tileWidth = tileWidth;
			this.tileHeight = tileHeight;
			//
			gotoAndStop(id);
			x = px;
			y = py;
			//
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par2 = MovieClip(parent.parent);
			retrieveConstants();
			addEventListener(Event.ENTER_FRAME,moveBall);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		
		//retrieves foreign constants
		private function retrieveConstants():void {
			GRAVITY = par2.getGravity();
		}
		
		//
		//EVENT_LISTENERS:
		//
		//moveBall(Event.ENTER_FRAME)
		//
		
		//moves the ball according the forces acted upon it
		private function moveBall(e:Event):void {
			//
			//UPDATE_POSITION BASED ON FORCES
			//
			vy += GRAVITY;
			//
			px += vx;
			py += vy;
			//update the position visually
			x = px;
			y = py;
		}
		
		//
		//SETTERS:
		//setPause(pause:Boolean=true)
		//setGravityEnabled(enabled:Boolean=true)
		//
		
		//sets pause to true
		public function setPause(pause:Boolean = true):void {
			paused = pause;
		}
		
		//sets if the gravity is enabled or not
		public function setGravityEnabled(enabled:Boolean = true):void {
			gravityEnabled = enabled;
		}
		
		//
		//GETTERS:
		//
		//isPaused()
		//getGravityEnabled()
		//getVx()
		//getVy()
		//getTileX()
		//getTileY()
		//
		
		//gets if the ball is paused or not
		public function isPaused():Boolean {
			return paused;
		}
		
		//gets if the ball's gravitational force is enabled
		public function getGravityEnabled():Boolean {
			return gravityEnabled;
		}
		
		//gets the ball's x velocity
		public function getVx():Number {
			return vx;
		}
		//gets the ball's y velocity
		public function getVy():Number {
			return vy;
		}
		
		//gets the ball's x position
		public function getPx():int {
			return px;
		}
		//gets the ball's y position
		public function getPy():int {
			return py;
		}
		
		//gets the tile x the center of the ball is at
		public function getTileX():int {
			return Math.floor((px+(ballWidth/2))/tileWidth);
		}
		//gets the tile y the center of the ball is at
		public function getTileY():int {
			return Math.floor((py+(ballHeight/2))/tileHeight);
		}
	}
}