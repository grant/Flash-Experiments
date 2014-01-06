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
		
		private const WIDTH_PADDING:uint = 60;//how much padding on the left and right to check for iris
		private const HEIGHT_PADDING:uint = 40;//how much padding on the top and bottom to check for iris
		
		private const FPS:uint = 15;
		private const FAVOR_AREA:Boolean = false;//true for no resizing if can't get exact dimensions, false if no resizing (optimum)
		
		private const SKIN_PIGMENTS:Array=new Array(10251075);//,16578797,16447991,15526889,15853507,15721133,14733971,15456645,14926951,13083748,12359522,10251075,7949616,6566166,5714473,4202517,2494733);
		
		//private const SKIN_PIGMENTS:Array=new Array(16514292,16578797,16447991,15526889,15853507,15721133,14733971,15456645,14926951,13083748,12359522,10251075,7949616,6566166,5714473,4202517,2494733);
		
		/*************
		 * Variables *
		 *************/
		
		private var selectedColor:uint = 0;
		private var leftEyeX:uint = 0;
		private var leftEyeY:uint = 0;
		private var rightEyeX:uint = 0;
		private var rightEyeY:uint = 0;
		
		private var leftEyeDot:Dot;
		private var rightEyeDot:Dot;
		
		private var camera:Camera;
		private var video:Video;
		
		private var inputBitmap:BitmapData;
		private var bitmap:Bitmap;
		
		//layers
		private var dotLayer:MovieClip;
		private var videoLayer:MovieClip;
		
		public function WebcamVideo():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addLayers();
			addBitmap();
			startCam();
			addEyeDots();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		
		/**
		 * Adds the layers
		 **/
		private function addLayers():void {
			videoLayer = new MovieClip();
			dotLayer = new MovieClip();
			
			addChild(videoLayer);
			addChild(dotLayer);
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
			videoLayer.addChild(bitmap);
		}
		
		/**
		 * Adds the eye dots to the screen
		 **/
		private function addEyeDots():void {
			leftEyeDot = new Dot();
			rightEyeDot = new Dot();
			dotLayer.addChild(leftEyeDot);
			dotLayer.addChild(rightEyeDot);
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
			///*
			for(var a:uint = WIDTH_PADDING; a<editedBitmap.width-WIDTH_PADDING; a++) {
				for(var b:uint = HEIGHT_PADDING; b<editedBitmap.height-HEIGHT_PADDING; b++) {
					///*
					if(CustomColor.compareColor(editedBitmap.getPixel(a,b),selectedColor)<20) {
						editedBitmap.setPixel(a,b,0);
					}
					//*/
				}
			}
			//*/
			//GC: removes the bitmap if there is already one on the screen
			if(bitmap!=null) {
				videoLayer.removeChild(bitmap);
			}
			bitmap = new Bitmap(editedBitmap);
			bitmap.width = stage.stageWidth;
			bitmap.height = stage.stageHeight;
			videoLayer.addChild(bitmap);
		}
		
		/**
		 * Gets the pixel's color
		 * @param px The x position on the stage
		 * @param py The y position on the stage
		 * @return The pixel's color
		 **/
		public function getPixelColor(px:uint,py:uint):uint {
			return inputBitmap.getPixel(getX(px),getY(py));
		}
		
		/**
		 **
		 ** Methods that convert between the X and Y of the video and stage
		 **
		 **/
		
		/**
		 * Gets the x position on the webcam video
		 * @param px The x position on the stage
		 * @return The video's x position
		 **/
		public function getX(px:uint):uint {
			return Math.abs(px/stage.stageWidth)*video.width;
		}
		
		/**
		 * Gets the y position on the webcam video
		 * @param py The y position on the stage
		 * @return The video's y position
		 **/
		public function getY(py:uint):uint {
			return Math.abs(py/stage.stageHeight)*video.height;
		}
		
		/**
		 * Gets the x position on the stage
		 * @param px The x position on the video
		 * @return The x position on the stage
		 **/
		private function getStageX(px:uint):uint {
			return px*(stage.stageWidth/video.width);
		}
		
		/**
		 * Gets the y position on the stage
		 * @param py The y position on the video
		 * @return The y position on the stage
		 **/
		private function getStageY(py:uint):uint {
			return py*(stage.stageHeight/video.height);
		}
		
		////
			
		/**
		 * Sets the selectedColor
		 **/
		public function setSelectedColor(color:uint):void {
			selectedColor = color;
		}
		
		/**
		 * Sets the eye's x and y position
		 * @param px The eye's x position
		 * @param py The eye's y position
		 **/
		public function setEye(eyeName:String) {
			var px:uint = getX(stage.mouseX);
			var py:uint = getY(stage.mouseY);
			if(eyeName=="left") {//left eye
				leftEyeX = px;
				leftEyeY = py;
			} else {//right eye
				rightEyeX = px;
				rightEyeY = py;
			}
			updateEyeDot(eyeName);
		}
		
		/**
		 * Update eye dots
		 **/
		public function updateEyeDot(eyeName:String):void {
			var eyeX:uint = 0;
			var eyeY:uint = 0;
			
			var sumX:uint = 0;
			var sumY:uint = 0;
			var total:uint = 0;
			if(eyeName=="left") {//left eye
				//find the eye center within 10 pixel radius
				for(var a:uint = leftEyeX-10;a<leftEyeX+10;a++) {
					for(var b:uint = leftEyeY-10;b<leftEyeY+10;b++) {
						//if the pixel is considered an iris
						if(CustomColor.compareColor(inputBitmap.getPixel(a,b),selectedColor)<20) {
							sumX += a;//add x position
							sumY += b;//add y position
							total++;
						}
					}
				}
				
				if(total>2) {//if found more than 2 pixels that thought there was an iris
					eyeX = Math.abs(sumX/total);
					eyeY = Math.abs(sumY/total);
				}
				
				if(eyeX!=0) {//if an iris was found
					leftEyeDot.x = getStageX(eyeX);
					leftEyeDot.y = getStageY(eyeY);
				}
			} else {//right eye
				//find the eye center within 10 pixel radius
				for(var c:uint = rightEyeX-10;c<rightEyeX+10;c++) {
					for(var d:uint = rightEyeY-10;d<rightEyeY+10;d++) {
						//if the pixel is considered an iris
						if(CustomColor.compareColor(inputBitmap.getPixel(c,d),selectedColor)<20) {
							sumX += c;//add x position
							sumY += d;//add y position
							total++;
						}
					}
				}
				
				if(total>2) {//if found more than 2 pixels that thought there was an iris
					eyeX = Math.abs(sumX/total);
					eyeY = Math.abs(sumY/total);
				}
				
				if(eyeX!=0) {//if an iris was found
					rightEyeDot.x = getStageX(eyeX);
					rightEyeDot.y = getStageY(eyeY);
				}
			}
		}
		
		/**
		 * Checks if the eye position has been set
		 * @param eyeName "left" or "right"
		 * @return If the eye position has been set or not
		 **/
		public function eyeIsSet(eyeName:String):Boolean {
			if(eyeName=="left") {
				if(leftEyeX==0) {
					return false;
				} else {
					return true;
				}
			} else {
				if(rightEyeX==0) {
					return false;
				} else {
					return true;
				}
			}
		}
		
		/**
		 * Shows an error message
		 **/
		private function showErrorMsg():void {
			trace("Error when trying to recieve a web camera stream");
		}
	}
}