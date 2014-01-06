package {
	import flash.display.Sprite;
	public class Editor extends Sprite {
		private var map:Sprite = new Map();
		private var hud:Sprite = new Hud();
		public function Editor():void {
			addLayers();
		}
		private function addLayers():void {
			addChild(map);
			addChild(hud);
		}
	}
}