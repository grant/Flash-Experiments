package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Main extends MovieClip {
		private var submitBtn:Submit = new Submit(450,350);
		public function Main():void {
			addLayers();
			var db:CheckDb = new CheckDb();
			addEventListener(Event.ENTER_FRAME,checkForMessages);
		}
		private function addLayers():void {
			addChild(submitBtn);
		}
		public function submit():void {
			var username = username.text;
			var msg = message.text;
		}
		private var timer:uint = 0;
		private const often:uint = 30;
		private function checkForMessages(e:Event):void {
			if(timer==often){
				timer = 0;
				//var checkDb:CheckDb = new CheckDb();
			} else {
				timer++;
			}
		}
		public function updateMessages(msg:String):void {
			messages.text = msg;
		}
		public function postError():void {
			messages.text = "Error";
		}
	}
}