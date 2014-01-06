package {
	import flash.display.MovieClip;
	public class Selector extends MovieClip {
		private const lineWidth:uint = 3;//border around selector
		public function Selector(size:uint):void {
			width = size+(lineWidth/2);
			height = size+(lineWidth/2);
		}
	}
}