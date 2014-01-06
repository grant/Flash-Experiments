package {
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	public class Main extends Sprite {
		private var bd:BitmapData=new BitmapData(500,500,false,0xFF000000);
		private var b:Bitmap;
		private var num:uint=1;
		public function Main():void {
			addEventListener(Event.ENTER_FRAME,onLoop);
			fixBd();
			b=new Bitmap(bd);
			addChild(b);
		}
		private var timer:uint=0;
		private function onLoop(e:Event):void {
			if (timer==1) {
				timer=0;
				fixBd();
				b=new Bitmap(bd);
				addChild(b);
				num+=1;
			} else {
				timer++;
			}
			trace(num);
		}
		private function fixBd():void {
			for (var a:uint = 0; a<bd.height; a++) {
				var color:uint = (a*256)-1;
				var finalColor:uint=0;
				for (var c:uint = 1; c<=num; c++) {
					finalColor+=color+c;
				}
				var rect:Rectangle=new Rectangle(0,a,bd.width,1);
				bd.fillRect(rect,finalColor+(256<<8));
			}
		}
	}
}