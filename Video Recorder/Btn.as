package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Btn extends MovieClip {
		private var type:uint;
		private var px:uint;
		private var py:uint;
		private var w:uint;
		private var h:uint;
		private var par:MovieClip;
		public function Btn(id:uint,posx:uint,posy:uint,wid:uint,hei:uint):void {
			type = id;
			px = posx;
			py = posy;
			w = wid;
			h = hei;
			gotoAndStop(type);
			x = px;
			y = py;
			width = w;
			height = h;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			addEventListener(MouseEvent.CLICK,onClick);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			if(type==1) {//record
				if(!par.recording){
					par.record.length = 0;//clear vector
				}
				par.recording = (par.recording)?false:true;
			} else if(type==2){//play
				par.videoRunning = 1;
				par.currViewerPos = 0;
			} else if(type==3){//pause
				par.recording = false;
				par.videoRunning = 0;
			} else if(type==4){//rewind
				par.recording = false;
				par.currViewerPos = par.record.length-1;
				par.videoRunning = -1;
			}
		}
	}
}