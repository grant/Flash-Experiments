package {
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	public class Next extends SimpleButton {
		public function Next() {
			addEventListener(MouseEvent.CLICK,onClick);
		}
		public function onClick(e:MouseEvent):void {
			if (alpha==1) {
				Object(parent).buttonPress();
			}
		}
	}
}