package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		private var game:Game = new Game();
		public function Main():void {
			addChild(game);
		}
	}
}