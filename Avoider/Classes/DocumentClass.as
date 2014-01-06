package {
	import flash.display.MovieClip;
	public class DocumentClass extends MovieClip {
		public var playScreen:AvoiderGame;
		public var gameOverScreen:GameOverScreen;
		public function DocumentClass() {
			playScreen = new AvoiderGame();
			playScreen.addEventListener(AvatarEvent.DEAD, onAvatarDeath);
			playScreen.x = 0;
			playScreen.y = 0;
			addChild(playScreen);
		}
		public function onAvatarDeath(avatarEvent:AvatarEvent):void {
			gameOverScreen = new GameOverScreen();
			gameOverScreen.addEventListener(NavigationEvent.RESTART, onRequestRestart);
			gameOverScreen.x = 0;
			gameOverScreen.y = 0;
			addChild(gameOverScreen);
			playScreen = null;
		}
		public function restartGame():void {
			playScreen = new AvoiderGame();
			playScreen.addEventListener(AvatarEvent.DEAD, onAvatarDeath);
			playScreen.x = 0;
			playScreen.y = 0;
			addChild(playScreen);
			gameOverScreen = null;
		}
		public function onRequestRestart(navigationEvent:NavigationEvent):void {
			restartGame();
		}
	}
}