package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	public class DisplayNumber extends Sprite {
		private var par:MovieClip;
		private var numPlace:uint;
		private var number:uint;
		public function DisplayNumber(place:uint,num:uint,xPos:int,w:uint,h:uint) {
			numPlace = place;
			number = num;
			x = xPos;
			y = -h;
			width = w;
			height = h;
			textBox.text = String(number);
			textBox.selectable=false;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent.parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
			addEventListener(Event.ENTER_FRAME,added);
		}
		public function added(e:Event):void {
			var speed;
			y += (par.borderSize-y)*par.switchSpeed;
			if(y>par.borderSize-1){
				if(par.numArray[numPlace]!=number){
					y = par.borderSize;
					par.addNum(numPlace);
					addEventListener(Event.ENTER_FRAME,remove);
					removeEventListener(Event.ENTER_FRAME,added);
				}
			}
		}
		private var acc:uint=0;
		public function remove(e:Event):void {
			y+=(par.sH-y)*(par.switchSpeed);
			if(y>par.sH-1){
				removeEventListener(Event.ENTER_FRAME,remove);
				MovieClip(parent).removeChild(this);
			}
		}
	}
}