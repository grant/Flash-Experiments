package {
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.Event;
	public class Hud extends Sprite {
		//Holders
		private var leftPanel:Sprite = new Panel("Left");
		
		
		public function Hud():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addPanels();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function addPanels():void {
			addChild(leftPanel);
		}
	}
}