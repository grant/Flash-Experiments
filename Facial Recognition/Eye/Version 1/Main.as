package {
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Main extends MovieClip {
		private var videoMenu:VideoMenu;
		private var webcamVideo:WebcamVideo;
		public function Main():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			alignStage();
			addWebcamVideo();
			addVideoMenu();
			addClick();
			addEventListener(Event.ENTER_FRAME,onLoop);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		
		/**
		 * Sets the properties for resizing the stage
		 **/
		private function alignStage():void {
			//Alligns stage if resized
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			stage.align = StageAlign.TOP_LEFT;
		}
		
		/**
		 * Adds a visual webcam video stream to the stage
		 **/
		private function addWebcamVideo():void {
			webcamVideo = new WebcamVideo();
			webcamVideo.setStageSize(stage.stageWidth,stage.stageHeight);
			addChild(webcamVideo);
		}
		
		/**
		 * Adds the video menu to the stage
		 **/
		private function addVideoMenu():void {
			videoMenu = new VideoMenu();
			videoMenu.x = 10;
			videoMenu.y = 10;
			addChild(videoMenu);
		}
		
		/**
		 * Gets the color value of the spot clicked on the video
		 **/
		private function addClick():void {
			webcamVideo.addEventListener(MouseEvent.CLICK,onClick);
		}
		private function onClick(e:MouseEvent):void {
			if(videoMenu.getSelection()==0) {//iris color
				var color = webcamVideo.getPixelColor(stage.mouseX,stage.mouseY);
				videoMenu.setIris(color);
				webcamVideo.setSelectedColor(color);
			} else if(videoMenu.getSelection()==1) {//left eye
				webcamVideo.setEye("left");
			} else {//right eye
				webcamVideo.setEye("right");
			}
		}
		
		/**
		 * Run every frame
		 **/
		private function onLoop(e:Event):void {
			if(webcamVideo.eyeIsSet("left")) {
				webcamVideo.updateEyeDot("left");
			}
			if(webcamVideo.eyeIsSet("right")) {
				webcamVideo.updateEyeDot("right");
			}
		}
	}
}