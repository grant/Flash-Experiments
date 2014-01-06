package {
	import flash.display.MovieClip;
	public class Game extends MovieClip {
		private var displayMap:DisplayMap = new DisplayMap();
		public function Game():void {
			addChild(displayMap);
		}
	}
}