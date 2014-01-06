package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Shell extends MovieClip {
		private const wid:uint = 25;
		private const hei:uint = 10;
		private var widthTrig:Number;
		private var heightTrig:Number;
		private var radian1:Number;
		private var radian2:Number;
		private var alteredRotation:Number;
		public function Shell() {
			x = 100;
			width = wid;
			height = hei;
			rotation = 98;
			alteredRotation = rotation+180;
			radian1 = 0.0174532925*Math.abs(rotation);
			widthTrig = (Math.sin(radian1)*(wid/2));
			radian2 = 0.0174532925*(90-(Math.abs(rotation)));
			heightTrig = (Math.sin(radian2)*(hei/2));
			if(alteredRotation<90){
				trace("90");
				y = 100-widthTrig+heightTrig;
			} else if(alteredRotation<180){
				trace("180");
				y = 100-widthTrig-heightTrig;
			} else if(alteredRotation<270){
				trace("270");
				y = 100-widthTrig-heightTrig;
			} else {
				trace("360");
				y = 100-widthTrig+heightTrig;
			}
			trace(widthTrig,heightTrig);
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		public function onLoop(e:Event):void {
			rotation += 9;
			if(rotation>=180){
				rotation-=360;
			}
			alteredRotation = rotation+180;
			radian1 = 0.0174532925*Math.abs(rotation);
			widthTrig = (Math.sin(radian1)*(wid/2));
			radian2 = 0.0174532925*(90-(Math.abs(rotation)));
			heightTrig = (Math.sin(radian2)*(hei/2));
			x = 100;
			if(alteredRotation<90){
				trace("90");
				y = 100-widthTrig+heightTrig;
			} else if(alteredRotation<180){
				trace("180");
				y = 100-widthTrig-heightTrig;
			} else if(alteredRotation<270){
				trace("270");
				y = 100-widthTrig-heightTrig;
			} else {
				trace("360");
				y = 100-widthTrig+heightTrig;
			}
		}
	}
}