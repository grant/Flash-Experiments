package {
	import flash.display.MovieClip;
	public class Loudness extends MovieClip {
		private var maxhei:uint;
		public function Loudness(px,py,wid,hei):void {
			x = px;
			y = py;
			width = wid;
			height = 0;
			maxhei = hei;
			stop();
		}
		public function changeLevel(level:uint):void {
			if(level>100){level=0};
			var des:Number = (level/100)*maxhei;
			height += (des-height)*.1;
			gotoAndStop(Math.round(100*(height/maxhei)));
		}
	}
}