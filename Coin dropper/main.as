package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class main extends MovieClip {
		public var fps:uint = 24;
		private const gameType:String = "ENTER_FRAME";
		//"ENTER_FRAME","MOUSE_MOVE"
		private var amount:uint = 10;
		private var rate:uint = 1;//amount of frames to wait
		private var rateTimer:uint = rate;
		public function main() {
			stage.frameRate = fps;
			switch(gameType){
				case "ENTER_FRAME":
					addEventListener(Event.ENTER_FRAME,onLoop);
					break;
				case "MOUSE_MOVE":
					stage.addEventListener(MouseEvent.MOUSE_MOVE,onClick);
					break;
			}
		}
		private function onLoop(e:Event):void {
			releaseCoins();
		}
		private function onClick(e:MouseEvent):void {
			releaseCoins();
		}
		private function releaseCoins():void {
			if(rateTimer == rate){
				rateTimer = 0;
				for(var i = 0; i < amount; ++i){
					var coin:Coin = new Coin(mouseX,mouseY);
					addChild(coin);
				}
			}
			++rateTimer;
		}
	}
}