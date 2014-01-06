package {
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	public class Main extends Sprite {
		private var hex:Array = new Array();
		private var bd:BitmapData = new BitmapData(500,500,true,0xFFAA0000);
		private var b:Bitmap = new Bitmap(bd,"auto",true);
		public function Main() {
			addEventListener(Event.ENTER_FRAME,update);
		}
		private var timer:uint = 0;
		private var number:Number = 25;
		private var fir:Boolean = false;
		private function update(e:Event):void {
			if(timer==1){
				if(fir){
					removeChild(b);
				} else {
					fir=true;
				}
				timer = 0;
				gradient(number);
				addChild(b);
				number-=.1;
			} else {
				timer++;
			}
		}
		private function gradient(num:uint):void {
			for(var a:uint = 0;a<bd.width;a++){
				for(var b:uint = 0;b<bd.height;b++){
					
					//bd.setPixel(a,b,Math.sqrt(a*b)<<num);
					//bd.setPixel(a,b,b*b*a*a<<num);
					//bd.setPixel(a,b,b-a<<num);
					//bd.setPixel(a,b,(a*500%b)<<num);
					//bd.setPixel(a,b,(a*100/b)<<num);
					//bd.setPixel(a,b,a*b<<num);
				}
			}
		}
	}
}