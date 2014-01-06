package {
	import flash.display.Sprite;
	public class Main extends Sprite {
		private var game:Game = new Game();
		public function Main():void {
			addChild(game);
		}
	}
}