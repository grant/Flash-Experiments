package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.display.Shape;
	import flash.events.Event;
	public class Background extends Sprite {
		private var par:MovieClip;
		public function Background() {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			var bg:Shape = new Shape();
			bg.graphics.beginFill(MovieClip(parent).bgColor);
			bg.graphics.drawRect(par.borderSize,par.borderSize,par.sW-(2*par.borderSize),par.sH-(2*par.borderSize));
			bg.graphics.endFill();
			addChild(bg);
		}
	}
}