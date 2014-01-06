package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Bar extends MovieClip {
		private var counter:uint = 0;
		public var speed:Number = 3;
		private var par:MovieClip;
		//
		private var lastX:Number=0;
		private var nextX:Number;
		public function Bar(a:uint,w:uint,h:uint):void {
			width = w;
			height = h;
			this.mouseEnabled = false;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			nextX = par.size;
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onLoop(e:Event):void {
			x += par.size/speed;
			if(x>=par.size*par.xsize){
				x = 0;
				nextX = 0;
			}
			if(x>=nextX){
				nextX+=par.size;
				var des:uint = Math.floor(x/par.size);
				for(var a:uint = 0;a<par.ysize;a++){
					if(par.h[des][a].off){
						par.playSound(par.note[0-(par.h[des][a].b-11)],1,0);
						//par.h[des][a].playSound();
					}
				}
			}
		}
	}
}