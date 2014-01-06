//par:Main
package {
	import flash.display.MovieClip;
	public class BallEnvironment extends MovieClip {
		//constants
		//GRAVITY
		//1: moon-like
		//4: light
		//9: normal
		//18: heavy
		private const GRAVITY:Number = 9;//gravity acceleration constant in y pixels displaced per frame
		
		//object arrays
		private var balls:Array;
		private var walls:Array;
		//object holder clips
		private var ballHolder:MovieClip;
		private var wallHolder:MovieClip;
		public function BallEnvironment():void {
			setUpEnvironment();
			setUpHolders();
			setUpObjects();
			addHolders();
			addObjects();
		}
		
		//sets up the environment
		private function setUpEnvironment():void {
			balls = new Array();
			walls = new Array();
		}
		
		//sets up the holders in the environment
		private function setUpHolders():void {
			ballHolder = new MovieClip();
			wallHolder = new MovieClip();
		}
		//sets up the objects in the environment
		private function setUpObjects():void {
			balls.push(new Ball(1,100,40,70));
		}
		
		//adds the holders to the environment
		private function addHolders():void {
			//layer order (greatest to least depth):
			//-wallHolder
			//-ballHolder
			addChild(wallHolder);
			addChild(ballHolder);
		}
		//adds the objects to the holders
		private function addObjects():void {
			//balls
			for(var a:uint = 0;a<balls.length;++a) {
				ballHolder.addChild(balls[a]);
			}
			//walls
			for(var b:uint = 0;b<walls.length;++b) {
				wallHolder.addChild(walls[b]);
			}
		}
		
		///////////
		//Getters//
		///////////
		//gets the gravity constant
		public function getGravity():Number {
			return GRAVITY;
		}
	}
}