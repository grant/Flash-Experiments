package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Main extends MovieClip {
		private var webcamVideo:WebcamVideo;
		public function Main():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addWebcamVideo();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		
		/**
		 * Adds a visual webcam video stream to the stage
		 **/
		private function addWebcamVideo():void {
			webcamVideo = new WebcamVideo();
			webcamVideo.setStageSize(stage.stageWidth,stage.stageHeight);
			addChild(webcamVideo);
		}
	}
}