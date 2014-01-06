package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	public class Submit extends MovieClip {
		private var par:MovieClip;
		public function Submit(px:uint,py:uint):void {
			this.buttonMode = true;
			x = px;
			y = py;
			width = 100;
			height = 50;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			addEventListener(MouseEvent.CLICK,onClick);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onEnter);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			submit();
		}
		private function onEnter(e:KeyboardEvent):void {
			if(e.keyCode==13){
				submit();
			}
		}
		private function submit():void {
			par.submitMessage();
			par.input.text = "";
		}
	}
}