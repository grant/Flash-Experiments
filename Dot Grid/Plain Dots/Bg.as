package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Bg extends MovieClip {
		public function Bg():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			width = stage.stageWidth;
			height = stage.stageHeight;
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
	}
}