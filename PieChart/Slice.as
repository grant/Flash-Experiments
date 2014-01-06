package {
	import flash.display.MovieClip;
	public class Slice extends MovieClip {
		public function Slice(colorNumber:uint,Rotation:uint){
			if(colorNumber>totalFrames){
				colorNumber = colorNumber % totalFrames;
			}
			gotoAndStop(colorNumber+1);
			rotation = Rotation;
		}
	}
}