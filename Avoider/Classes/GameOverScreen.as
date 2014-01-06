package {
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	public class GameOverScreen extends MovieClip {
		public function GameOverScreen(){
			restartButton.addEventListner(MouseEvent.CLICK, onClickRestart);
		}
		public function onClickRestart(mouseEvent:MouseEvent):void {
			dispatchEvent(new NavigationEvent(NavigationEvent.RESTART));
		}
	}
}