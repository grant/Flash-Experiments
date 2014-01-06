package {
	import flash.display.Sprite;
	public class Main extends Sprite {
		public function Main() {
			var tk:Ticker = new Ticker(0,0,"settings.xml");
			addChild(tk);
		}
	}
}