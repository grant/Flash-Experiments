package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Main extends MovieClip {
		public var dots:MovieClip;
		private var heads:MovieClip;
		public function Main():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			var bg:Bg = new Bg(1000,800);
			addChild(bg);
			dots = new MovieClip();
			addChild(dots);
			heads = new MovieClip();
			addChild(heads);
			stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseIsDown);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function mouseIsDown(e:MouseEvent):void {
			var dir:Dir = new Dir(stage.mouseX,stage.mouseY);
			heads.addChild(dir);
			var projectile:Projectile = new Projectile(stage.mouseX,stage.mouseY);
			heads.addChild(projectile);
		}
	}
}