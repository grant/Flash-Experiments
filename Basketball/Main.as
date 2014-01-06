//Game idea:
/*
Objective: Try to get the ball to the finish place
Gameplay: You have a few walls/moving walls on the stage.
You try to move the blocks so that the ball will bounce to the finish place
Types of walls:
-Static
-Bouncy
-Moving (moves on the x or y axis at a moderate acceleration so long as there are no walls in the way)
-Push (gives a velocity boost towards a direction (can be a background tile or normal tile))
*/
package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		private var ballEnvironment:BallEnvironment;
		public function Main():void {
			setUpStage();
		}
		
		//sets up the stage
		private function setUpStage():void {
			setUpEnvironment();
		}
		
		//sets up the ball environment
		private function setUpEnvironment():void {
			ballEnvironment = new BallEnvironment();
			addChild(ballEnvironment);
		}
	}
}