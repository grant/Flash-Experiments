package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		private var game:Game;//main game
		public function Main():void {
			setGame();
		}
		
		//creates the game
		private function setGame():void {
			game = new Game();
			addChild(game);
		}
	}
}