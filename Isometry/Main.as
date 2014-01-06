package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public function Main() {
			var map:Board = new Board(300,100);
			addChild(map);
		}
	}
}