//Game Idea
//Ad-Blocker

//Objective: Drag the ads around, throw them, and break them
//Click on the "Click me" buttons that pop randomly around the screen. Ads cover them.

//Upgrades:
//Throw Speed
//Throw Friction
//Breaking Power
//(Auto Ad-blocker?)

//Story:
//Don't you just hate ads an an internet surfer?

//Types of Ads:
//Normal: Just drag and throw
//Bonus: Creates a duplicate add if pressed. You must drag by the top of the ad.
//Jump: Moves to random position every second on the screen
//Boss: Large ad that creates smaller ads. Has lots of health.

//Ads:
//Health displayed at bottom
package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public var box:DragRect;
		public function Main() {
			box = new DragRect(100,100,100,100);
			addChild(box);
		}
	}
}