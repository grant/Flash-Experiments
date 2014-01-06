/*
Idea for game/app
Title: Guess what I'm saying.
Description: You watch a 10 second video of someone talking. There is no audio. You have to guess what they are saying and write it in a speech bubble. Videos can be transfered and viewed through Kongregate.
You also can see the audio levels of the person speaking.
*/
package {
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.*;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.text.TextField;
	import flash.text.TextFormat;
	public class Main extends MovieClip {
		public var recording:Boolean = false;
		public var videoRunning:int = 0;
		public var currViewerPos:uint = 0;
		
		private var video:Video;
		private var videoViewer:Bitmap;//video that plays, rewinds, and pauses
		public var record:Vector.<BitmapData> = new Vector.<BitmapData>();
		
		private var recordBTN:Btn = new Btn(1,10,210,50,50);
		private var playBTN:Btn = new Btn(2,70,210,50,50);
		private var pauseBTN:Btn = new Btn(3,130,210,50,50);
		private var rewindBTN:Btn = new Btn(4,190,210,50,50);
		private var recordingCircle:RecordingCircle = new RecordingCircle();
		public function Main():void {
			allignStage();
			addVideo();
			addButtons();
		}
		private function allignStage():void {
			//Alligns stage if resized
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			stage.align = StageAlign.TOP_LEFT;
		}
		private function addVideo():void {
			try {
				var camera:Camera = Camera.getCamera();
				camera.setMode(256, 196, 30);//256,196,15
				if (camera != null) {
		   			// setup camera and bitmaps
					video = new Video(camera.width, camera.height);
					video.attachCamera(camera);
					video.x = 0;
					video.y = 0;
					addChild(video);
					video.addEventListener(Event.ENTER_FRAME, updateVideo);
					
					videoViewer = new Bitmap();
					addChild(videoViewer);
					videoViewer.x = video.x+video.width;
					videoViewer.y = video.y;
				} else {
					showErrorMsg();
				}
			} catch (e:*) {
				showErrorMsg();
			}
		}
		//Error Message
		private function showErrorMsg():void {
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.align = "center";
			txtFormat.font = "Arial";
			
			var errTxt = new TextField();
			errTxt.x = 0;
			errTxt.y = 270;
			errTxt.width = 400;
			errTxt.textColor = 0xFF0000;
			errTxt.text = "No Camera Detected.";
			errTxt.setTextFormat(txtFormat);
			addChild(errTxt);
		}	
		private function addButtons():void {
			addChild(recordBTN);
			addChild(playBTN);
			addChild(pauseBTN);
			addChild(rewindBTN);
			recordingCircle.width = 10;
			recordingCircle.height = 10;
			recordingCircle.x = 512-20;
			recordingCircle.y = 10;
			recordingCircle.visible = false;
			addChild(recordingCircle);
		}
		//Update video
		private function updateVideo(e:Event):void {
			var inputBitmap:BitmapData = new BitmapData(video.width, video.height);
			inputBitmap.draw(video);
			
			if(recording){
				recordingCircle.visible = true;
				
				record.push(inputBitmap);//add video frame to record
				videoViewer.bitmapData = record[record.length-1];//show the last video frame taken
			} else {
				recordingCircle.visible = false;
				
				if(videoRunning == -1){
					if(currViewerPos==0){//if on first frame of video
						videoRunning = 0;//pause
					} else {
						--currViewerPos;//go back
					}
				} else if(videoRunning == 1){
					if(currViewerPos==record.length-1){//if on last frame of video
						videoRunning = 0;//pause
					} else {
						++currViewerPos;//play
					}
				}
				if(record.length!=0){
					//show current frame
					videoViewer.bitmapData = record[currViewerPos];
				}
			}
			trace(record.length);
		}
	}
}