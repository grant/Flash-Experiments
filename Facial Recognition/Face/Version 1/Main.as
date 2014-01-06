/*
Ideas:
-Have a list of skin pigments and compare various parts of the frame to the skin color.

-Create typical shapes of a person's ovular face, eyes, lips, ect.

-Use a motion detector

-Detect edges for finding the features of the face
-Use color of various features (eyes:brown,green,black,blue...)

Useful web page:
http://www.laserpirate.com/as3edgeandmotion/
*/
package {
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.system.Capabilities;

	public class Main extends MovieClip {

		//Constants

		//Colors of common skin colors in hexidecimal uints
		//Colors based on Felix von Luschan skin color scale
		//Colors are in order from white to black
		//10,11,3,2,15,16,17,20,21,25,26,27,29,30,33,34,- (custom black color)
		private var skinPigments:Array=new Array(16514292,16578797,16447991,15526889,15853507,15721133,14733971,15456645,14926951,13083748,12359522,10251075,7949616,6566166,5714473,4202517,2494733);

		private var screenWidth:uint=Capabilities.screenResolutionX;
		private var screenHeight:uint=Capabilities.screenResolutionY;

		private var camWidth:uint = 256;
		private var camHeight:uint = 196;
		
		private var white:uint = 16777215;

		//Variables

		private var video:Video;

		//Bitmaps
		private var inputBitmap:BitmapData;//raw input of the current frame of the web camera
		private var prevBitmap:BitmapData = new BitmapData(camWidth,camHeight);//previous frame of the web camera
		private var motionBitmap:BitmapData;//movement of the frame (B&W)
		private var edgeBitmap:BitmapData;//edges of the frame (B&W)
		private var motionVideoOn:Boolean=true;//captures motion video
		private var edgeVideoOn:Boolean=true;//captures edge video

		public function Main():void {
			//alignStage();
			addVideo();
			addLocators();
		}

		/**
		 * Aligns the stage for full screen
		 **/
		private function alignStage():void {
			//Aligns stage if resized
			stage.scaleMode=StageScaleMode.EXACT_FIT;
			stage.align=StageAlign.TOP_LEFT;
		}

		/**
		 * Adds the video to the stage
		 **/
		private function addVideo():void {
			try {
				var camera:Camera=Camera.getCamera();
				camera.setMode(camWidth, camHeight, 15);//256,196,15
				if (camera!=null) {
					// setup camera and bitmaps
					video=new Video(camera.width,camera.height);
					video.attachCamera(camera);
					video.x=0;
					video.y=0;
					//video.width=stage.stageWidth;
					//video.height=stage.stageHeight;
					addChild(video);
					video.addEventListener(Event.ENTER_FRAME, updateVideo);
				} else {
					showErrorMsg();
				}
			} catch (e:*) {
				showErrorMsg();
			}
		}

		/**
		 * Adds geometric shapes that show where recognized facial features are
		 **/
		private function addLocators():void {

		}

		/**
		 * Runs every time a frame is captured from the video camera
		 **/
		private function updateVideo(e:Event):void {
			//creates an updates a bitmap of video data
			inputBitmap=new BitmapData(video.width,video.height);
			inputBitmap.draw(video);
			if (motionVideoOn) {
				motionBitmap=new BitmapData(video.width,video.height);
				captureMotionBitmap();
				//sets the current bitmap as the previous bitmap
				prevBitmap=inputBitmap.clone();
			}
			if (edgeVideoOn) {
				edgeBitmap = new BitmapData(video.width,video.height);
				captureEdgeBitmap();
			}
		}

		/**
		 * Captures motion (difference in pixels) between the previous frame and the current frame
		 **/
		private function captureMotionBitmap():void {
			for (var i:uint = 0; i<inputBitmap.width; ++i) {
				for (var j:uint = 0; j<inputBitmap.height; ++j) {

					//get current frame pixel color
					var curr:Object=HexToRGB(inputBitmap.getPixel(i,j));

					//get previous frame pixel color
					var prev:Object=HexToRGB(prevBitmap.getPixel(i,j));

					//1. Calculate the difference between the previous RGB and current RGB
					//2. Average the differences together
					var difference:uint = (Math.abs(curr.red-prev.red) + Math.abs(curr.green-prev.green) + Math.abs(curr.blue-prev.blue))/3;
					
					//black or white
					
					//increase the intensity of the bitmap
					if(difference>30) {
						//difference = 255;
						motionBitmap.setPixel(i,j,white);
					} else {
						//difference = 0;
						motionBitmap.setPixel(i,j,0);
					}
					
					//update the bitmap with the new data
					//motionBitmap.setPixel(i,j,RGBToHex(difference,difference,difference));
					
					//range from black to white
				}
			}
			//view the bitmap
			//var bitmap:Bitmap = new Bitmap(motionBitmap);
			//addChild(bitmap);
		}

		/**
		 * Captures the edges (differences between right and bottom pixels) of the current frame
		 **/
		private function captureEdgeBitmap():void {
			for (var i:uint = 0; i<inputBitmap.width-1; ++i) {
				for (var j:uint = 0; j<inputBitmap.height-1; ++j) {
					
					//get current frame pixel color
					var curr:Object=HexToRGB(inputBitmap.getPixel(i,j));
					
					//get the right pixel color
					var right:Object=HexToRGB(inputBitmap.getPixel(i+1,j));
					
					//get the bottom pixel color
					var bottom:Object=HexToRGB(inputBitmap.getPixel(i,j+1));
					
					//1. Find the RGB diffences between the current pixel and the right and bottom pixel
					//2. Average the differences
					var difference:uint = (Math.abs(curr.red-right.red) + Math.abs(curr.green-right.green) + Math.abs(curr.blue-right.blue));
					difference += (Math.abs(curr.red-bottom.red) + Math.abs(curr.green-bottom.green) + Math.abs(curr.blue-bottom.blue));
					difference /= 3;
					
					if(difference>50) {
						edgeBitmap.setPixel(i,j,white);
					} else {
						edgeBitmap.setPixel(i,j,0);
					}
				}
			}
			//view the bitmap
			//var bitmap:Bitmap = new Bitmap(edgeBitmap);
			//addChild(bitmap);
			var bitmapData:BitmapData = new BitmapData(inputBitmap.width,inputBitmap.height);
			for (var k:uint = 0; k<inputBitmap.width; ++k) {
				for (var l:uint = 0; l<inputBitmap.height; ++l) {
					bitmapData.setPixel(k,l,(motionBitmap.getPixel(k,l) & edgeBitmap.getPixel(k,l)));
				}
			}
			var bitmap:Bitmap = new Bitmap(bitmapData);
			addChild(bitmap);
		}

		/**
		 * Gets the average color of an area of the video
		 * @param videoPixel The pixel of the video camera (not the stage) that is the center of where the average color is taken
		 * @param area The width/height of the area to sample the color from
		 * @return The average color of the area specified as a ColorTransform object
		 **/
		private function getAvgColor(videoPixel:Point,area:uint):ColorTransform {
			//Make sure the area is an even number (so that it can be divided into 2 evenly)
			//Rounds the number up if it is odd
			area += (area%2)?1:0;

			var halfArea:uint=area*0.5;

			//Validate that the area does not go off the screen
			var top:int=videoPixel.y-halfArea;
			top = (top<0)?0:top;

			var left:int=videoPixel.x-halfArea;
			left = (left<0)?0:left;

			var right:int=videoPixel.x+halfArea;
			right = (right>video.width)?video.width:right;

			var bottom:int=videoPixel.y+halfArea;
			bottom = (bottom>video.height)?video.height:bottom;

			//Separate pixel colors into RGB
			//Add pixel RGB values into total red, green, and blue variables
			var totalRed:uint=0;
			var totalGreen:uint=0;
			var totalBlue:uint=0;

			for (var i:uint = 0; i<area; i++) {//for all horizontal pixels
				for (var j:uint = 0; j<area; j++) {//for all vertical pixels
					var pixelColor:uint=inputBitmap.getPixel(top+i,left+j);
					var colorObj:Object=HexToRGB(pixelColor);
					totalRed+=colorObj.red;
					totalGreen+=colorObj.green;
					totalBlue+=colorObj.blue;
				}
			}

			//divide total color values by how many there were
			var numPixels=area*area;

			totalRed/=numPixels;
			totalGreen/=numPixels;
			totalBlue/=numPixels;

			//Set return color to the color that was calculated
			var color:ColorTransform = new ColorTransform();
			color.color=uint(RGBToHex(totalRed,totalGreen,totalBlue));
			return color;
		}

		/**
		 * Converts a Hexidecimal color into an RGB object
		 * @param hex A hexidecimal color as a number
		 * @return An RGB object with properties of red, green, and blue
		 **/
		private function HexToRGB(hex:uint):Object {
			var rgbObj:Object = {
			red: ((hex & 0xFF0000) >> 16),
			green: ((hex & 0x00FF00) >> 8),
			blue: ((hex & 0x0000FF))
			};
			return rgbObj;
		}

		/**
		 * Converts an RGB color into a hexidecimal color as a string
		 * @param r Red
		 * @param g Green
		 * @param b Blue
		 * @return RGB color
		 **/
		private function RGBToHexString(r, g, b):String {
			var hex:String="0x"+r.toString(16)+g.toString(16)+b.toString(16);
			return hex;
		}

		/**
		 * Converts an RGB color into a hexidecimal color as an uint
		 * @param r Red
		 * @param g Green
		 * @param b Blue
		 * @return RGB color
		 **/
		private function RGBToHex(r, g, b):uint {
			var hex:uint = (r << 16) + (g << 8) + b;
			return hex;
		}

		/**
		 * Shows an error message because the web camera is not deteced
		 **/
		private function showErrorMsg():void {
			trace("Can't detect web camera");
		}
	}
}