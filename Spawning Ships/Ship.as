package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Ship extends MovieClip {
		private const friction:Number = .5;//0-1
		private const rotationAcceleration:Number = .5;//.5
		private var maxRotationSpeed:uint = 6;//5
		private var a:uint;
		private var b:uint;
		private var rotationSpeed:Number=0;
		public function Ship(aa:uint,bb:uint,size:uint,frame:uint):void {
			a=aa;
			b=bb;
			width=size*.8;
			height=size*.8;
			x = (a*size)+(size/2);
			y = (b*size)+(size/2);
			gotoAndStop(frame);
			addEventListener(Event.ENTER_FRAME,rotating);
			addEventListener(Event.ENTER_FRAME,moveShip);
		}
		private function rotating(e:Event):void {
			var desx:int = stage.mouseX;
			var desy:int = stage.mouseY;
			var theX:int=desx-x;
			var theY:int = (desy-y) * -1;
			var desrot:int = Math.atan(theY/theX)/(Math.PI/180);//destination rotation
			if (theX<0) {
				desrot+=180;
			}
			if (theX>=0&&theY<0) {
				desrot+=360;
			}
			var currot:int = rotation-180;//current rotation
			currot = Math.abs(currot)-90;
			if(currot<0){
				currot+=360;
			}
			if((currot-desrot>0||desrot-currot>180)&&(currot-desrot<180)){
				rotate(1,currot,desrot);
			} else {
				rotate(-1,currot,desrot);
			}
			var temp:int = desrot+180;
			if(rotationSpeed>maxRotationSpeed){
				rotationSpeed = maxRotationSpeed;
			} else if(rotationSpeed<-maxRotationSpeed){
				rotationSpeed = 0-maxRotationSpeed;
			}
			rotation += rotationSpeed;
			//rotation = (desrot*-1) + 90;
		}
		private function rotate(direction:int,currot:int,desrot:int):void{
			if(Math.abs(currot-desrot)<maxRotationSpeed){//if close to destination rotation
				rotationSpeed*=friction;
			} else {
				rotationSpeed += direction*rotationAcceleration;
			}
		}
		private function moveShip(e:Event):void {
			var spd=10;
			if (rotation>180) {
				y += (spd*Math.cos(Math.PI/180*rotation));
				x -= (spd*Math.sin(Math.PI/180*rotation));
			} else {
				y -= (spd*Math.cos(Math.PI/180*rotation));
				x += (spd*Math.sin(Math.PI/180*rotation));
			}
		}
	}
}