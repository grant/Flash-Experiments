package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public function Main():void {
			var mc:MovieClip = new MovieClip();
			mc.kk = "D";
			for(var i:String in mc){
				trace(i+": "+mc[i]);
			}
		}
	}
}