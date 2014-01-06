package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Dot extends MovieClip {
		//constants
		private const perspectiveConstant:uint = 200;//changes size (relative)
		//properties
		private var px:Number;
		private var py:Number;
		private var pz:Number;
		private var size:Number;
		//distances
		private var xdis:Number;
		private var ydis:Number;
		private var zdis:Number;
		//parent (Main)
		private var par:MovieClip;
		public function Dot(posx:Number,posy:Number,posz:Number,scale:Number):void {
			//Store Variables
			px = posx;
			py = posy;
			pz = posz;
			size = scale;
			//
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			projectXYZ();
			projectScale();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function projectXYZ():void {
			var eye:Array = par.eye;
			//x
			var eyeX:Array = par.eyeX;
			xdis = px-eye[0];
			var sumX:Number = xdis*(eyeX[0]+eyeX[1]+eyeX[2]);
			//y
			var eyeY:Array = par.eyeY;
			ydis = py-eye[0];
			var sumY:Number = ydis*(eyeY[0]+eyeY[1]+eyeY[2]);
			//z
			var eyeZ:Array = par.eyeZ;
			zdis = pz-eye[0];
			var sumZ:Number = zdis*(eyeZ[0]+eyeZ[1]+eyeZ[2]);
			//final X and Y
			var finalX:Number = (par.SCREEN_WIDTH*sumX)/(1+sumZ);
			var finalY:Number = (par.SCREEN_HEIGHT*sumY)/(1+sumZ);
			//move X and Y
			x = finalX-(par.SCREEN_WIDTH*.5);
			//different because of flash's non-cartesian point system
			y = (-finalY+(par.SCREEN_HEIGHT*1.5));
			
			trace(x,y,"||",finalX,finalY);
		}
		private function projectScale():void {
			//2x nested Pythagorean's Theorm
			var absoluteDistance:Number = Math.sqrt((Math.sqrt((xdis*xdis)+(ydis*ydis))*Math.sqrt((xdis*xdis)+(ydis*ydis)))+(zdis*zdis));
			width = height = perspectiveConstant/absoluteDistance;
		}
	}
}