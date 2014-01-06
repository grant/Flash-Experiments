package {
	import flash.display.MovieClip;
	public class StageMovieClip extends MovieClip {
		private var STAGE_WIDTH:uint;
		private var STAGE_HEIGHT:uint;
		
		public function StageMovieClip():void {
					
		}
		
		/**
		 * Sets the dimentions of the current stage size
		 **/
		public function setStageSize(wid:uint,hei:uint):void {
			STAGE_WIDTH = wid;
			STAGE_HEIGHT = hei;
		}
	}
}