package {
	import flash.events.Event;
	import flash.display.MovieClip;
	public class Dot extends MovieClip {
		private const maxSize:uint = 100;
		private var par:MovieClip;
		public function Dot(px:int,py:int,dis:Number):void {
			var size:uint = maxSize;
			if(dis!=0){
				size = (maxSize*50)/Math.sqrt(dis);
				size = Math.sqrt(size);
				if(size>maxSize){
					size = maxSize;
				}
			}
			width = size;
			height = size;
			x = px;
			y = py;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		public function onAdd(e:Event):void {
			par = MovieClip(parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		public function remove():void {
			//par.removeChild(this);
			this.visible = false;
		}
	}
}