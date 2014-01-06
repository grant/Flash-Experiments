package {
	import flash.display.Sprite;
	public class Game extends Sprite {
		public var textSprite:Text = new Text();
		public function Game() {
			addChild(textSprite);
		}
	}
}