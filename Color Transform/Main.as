package {
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	import flash.display.Shape;
	public class Main extends Sprite {
		public function Main() {
			var rect:Shape = new Shape();
			rect.graphics.beginFill(0x00FF00);
			rect.graphics.drawRect(0,0,100,100);
			rect.graphics.endFill();

			var colorTransform:ColorTransform=rect.transform.colorTransform;
			colorTransform.color=0xFF0000;
			rect.transform.colorTransform=colorTransform;

			addChild(rect);
		}
	}
}