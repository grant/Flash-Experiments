package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public function Main():void {
			var piano:Piano = new Piano();
			addChild(piano);
			//var fps:FPSCounter = new FPSCounter();
			//addChild(fps);
		}
	}
}