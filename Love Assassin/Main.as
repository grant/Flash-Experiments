package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.ColorMatrixFilter;
	public class Main extends MovieClip {
		public function Main():void {
			addEvents();
		}
		
		//adds events
		private function addEvents():void {
			addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		//on every frame
		private function onFrame(e:Event):void {
			var h:Heart = new Heart();
			h.x = Math.random()*stage.stageWidth;
			h.y = Math.random()*stage.stageHeight;
			h.alpha = Math.random()*.7;
			h.rotation = Math.random()*360;
			//filter
			var matrix:Array = new Array();
			matrix=matrix.concat([r(),r(),r(),0,0]);// red
			matrix=matrix.concat([r(),r(),r(),0,0]);// green
			matrix=matrix.concat([r(),r(),r(),0,0]);// blue
			matrix=matrix.concat([0,0,0,1,0]);
			
			var cmf:ColorMatrixFilter = new ColorMatrixFilter(matrix);
			h.filters = [cmf];
			//add child
			addChild(h);
		}
		
		//gets a random number
		private function r():Number {
			return Math.random();
		}
	}
}