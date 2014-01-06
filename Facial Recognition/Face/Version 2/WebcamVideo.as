package {
	import flash.display.MovieClip;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.media.Camera;
	import flash.media.Video;
	public class WebcamVideo extends StageMovieClip {
		/*************
		 * Constants *
		 *************/
		private const CAMERA_WIDTH:uint = 320;
		private const CAMERA_HEIGHT:uint = 260;
		
		private const FPS:uint = 15;
		private const FAVOR_AREA:Boolean = false;//true for no resizing if can't get exact dimensions, false if no resizing (optimum)
		
		private const SKIN_PIGMENTS:Array=new Array(10251075);//,16578797,16447991,15526889,15853507,15721133,14733971,15456645,14926951,13083748,12359522,10251075,7949616,6566166,5714473,4202517,2494733);
		
		//private const SKIN_PIGMENTS:Array=new Array(16514292,16578797,16447991,15526889,15853507,15721133,14733971,15456645,14926951,13083748,12359522,10251075,7949616,6566166,5714473,4202517,2494733);
		
		/*************
		 * Variables *
		 *************/
		
		private var camera:Camera;
		private var video:Video;
		
		private var inputBitmap:BitmapData;
		private var bitmap:Bitmap;
		
		public function WebcamVideo():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addBitmap();
			startCam();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		
		/**
		 * Starts the video cam
		 **/
		private function startCam():void {
			try {
				camera = Camera.getCamera();
				camera.setMode(CAMERA_WIDTH, CAMERA_HEIGHT, FPS, FAVOR_AREA);
				if (camera!=null) {
					// setup camera and bitmaps
					video=new Video(camera.width,camera.height);
					video.attachCamera(camera);
					video.addEventListener(Event.ENTER_FRAME, updateVideo);
				} else {
					showErrorMsg();
				}
			} catch (e:*) {
				showErrorMsg();
			}
		}
		
		/**
		 * Adds the display bitmap to the stage
		 **/
		private function addBitmap():void {
			bitmap = new Bitmap();
			addChild(bitmap);
		}
		
		/**
		 * Runs every time a frame is captured from the video camera
		 **/
		private function updateVideo(e:Event):void {
			//get bitmap from video
			inputBitmap=new BitmapData(video.width,video.height);
			inputBitmap.draw(video);
			//edit this bitmap
			var editedBitmap:BitmapData = inputBitmap.clone();
			//for all pixels
			for(var a:uint = 0; a<editedBitmap.width; a++) {
				for(var b:uint = 0; b<editedBitmap.height; b++) {
					if(CustomColor.compareColor(editedBitmap.getPixel(a,b),SKIN_PIGMENTS[0])<200) {
						editedBitmap.setPixel(a,b,0);
					}
					/*
					//for all colors
					for(var c:uint = 0;c<SKIN_PIGMENTS.length;c++) {
						//if the color is 20% similar
						if(CustomColor.compareColor(editedBitmap.getPixel(a,b),SKIN_PIGMENTS[c])<20) {
							editedBitmap.setPixel(a,b,SKIN_PIGMENTS[c]);
						} else {
							editedBitmap.setPixel(a,b,0);
						}
					}
					*/
				}
			}
			//GC: removes the bitmap if there is already one on the screen
			if(bitmap!=null) {
				removeChild(bitmap);
			}
			bitmap = new Bitmap(editedBitmap);
			addChild(bitmap);
		}
		
		/**
		 * Shows an error message
		 **/
		private function showErrorMsg():void {
			trace("Error when trying to recieve a web camera stream");
		}
	}
}