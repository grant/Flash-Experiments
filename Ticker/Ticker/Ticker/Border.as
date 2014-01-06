package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.display.Shape;
	import flash.events.Event;
	public class Border extends Sprite {
		private var par:MovieClip;
		public function Border() {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			var border:Shape = new Shape();
			border.graphics.beginFill(MovieClip(parent).borderColor);
			border.graphics.drawRect(0,0,par.sW,par.borderSize);
			border.graphics.drawRect(0,par.borderSize,par.borderSize,par.sH-(2*par.borderSize));
			border.graphics.drawRect(0,par.sH-par.borderSize,par.sW,par.borderSize);
			border.graphics.drawRect(par.sW-par.borderSize,par.borderSize,par.borderSize,par.sH-(2*par.borderSize));
			border.graphics.endFill();
			addChild(border);
			var shading1:Shading = new Shading();
			shading1.x=par.borderSize;
			shading1.width = par.sW-(2*par.borderSize);
			shading1.height = par.borderSize;
			shading1.gotoAndStop(1);
			addChild(shading1);
			var shading2:Shading = new Shading();
			shading2.width = par.borderSize;
			shading2.height = par.sH-par.borderSize;
			shading2.gotoAndStop(1);
			addChild(shading2);
			var shading3:Shading = new Shading();
			shading3.x = par.sW-par.borderSize;
			shading3.width = par.borderSize;
			shading3.height = par.borderSize;
			shading3.gotoAndStop(2);
			addChild(shading3);
			var shading4:Shading = new Shading();
			shading4.y = par.sH-par.borderSize;
			shading4.width = par.borderSize;
			shading4.height = par.borderSize;
			shading4.gotoAndStop(2);
			addChild(shading4);
		}
	}
}