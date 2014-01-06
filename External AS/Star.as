package {
 
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.events.*;
 
	/*
	This class represents the Star movie clip we drew on the stage.
	We extend this class to a movie clip, thus allowing us to use movie 
	clip's functions and properties.
	*/
	public class Star extends MovieClip {
 
		private var starColor:uint;
		private var starRotation:Number;
 
		/*
		This is called the constructer of the class.
		It is called every time we create a new Star instance.
		In the constructor, we assign a random color to the star and set some 
		of it's properties.
		*/
		public function Star () {
 
			//Calculate a random color
			this.starColor = Math.random() * 0xffffff;
 
			// Get access to the ColorTransform instance associated with star.
			var colorInfo:ColorTransform = this.transform.colorTransform;
 
			// Set the color of the ColorTransform object.
			colorInfo.color = this.starColor;
 
			// apply the color to the star
			this.transform.colorTransform = colorInfo;
 
			//Assign a random alpha for the star
			this.alpha = Math.random();
 
			//Assign a random rotation speed
			this.starRotation =  Math.random() * 10 - 5;
 
			//Assign a random scale
			this.scaleX = Math.random();
			this.scaleY = this.scaleX;
 
			//Add ENTER_FRAME where we do the animation
			addEventListener(Event.ENTER_FRAME, rotateStar);
		}
 
		//This function is responsible for the rotation of the star
		private function rotateStar(e:Event):void {
			this.rotation += this.starRotation;
		}
	}
}