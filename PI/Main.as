package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public function Main():void {
			//a = pir^2
			//Triangle = .5BH
			//r = 1
			//h = .5root3
			var radius:Number = 1;
			var iterations:uint = 100;
			var area = 0;
			var h:Number = radius*0.5*Math.sqrt(3);
			area+=(6)*((0.5)*(radius)*(h));
			for(var i:uint = 0;i<iterations;i++){
				
			}
			trace(16*Math.atan(.2)-Math.atan(1/239));
		}
	}
}