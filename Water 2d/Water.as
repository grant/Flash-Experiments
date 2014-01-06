package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Water extends MovieClip {
		//Variables
		private var a:uint;
		private var b:uint;
		//MovieClips
		private var par:MovieClip;
		public function Water(aa:uint,bb:uint,wid:uint,hei:uint):void {
			a = aa;
			b = bb;
			width = wid;
			height = hei;
			
			cacheAsBitmap = true;
			alpha = 0;
			
			x = a*wid;
			y = b*hei;
			
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
			addEventListener(Event.ENTER_FRAME,moveWater);
			addEventListener(MouseEvent.CLICK,onClick);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent.parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			alpha += par.minDensity;
		}
		private function moveWater(e:Event):void {
			if(alpha>0){//if has water
				if(b<par.yTiles-1){//if not bottom tile
					checkDown();
				}
				if(a==0){
					checkRight();
				} else if(a==par.xTiles){
					checkLeft();
				} else {
					checkLeft();
					checkRight();
				}
			}
		}
		private function checkLeft():void {
			par.tankBoxes[a-1][b].alpha = alpha;
		}
		private function checkRight():void {
			par.tankBoxes[a+1][b].alpha = alpha;
		}
		private function checkDown():void {
			par.tankBoxes[a][b+1].alpha = alpha;
			//alpha = 0;
		}
	}
}