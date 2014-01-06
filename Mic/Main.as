package {
    import flash.display.Sprite;
    import flash.events.*;
    import flash.media.Microphone;
    import flash.system.Security;
    import flash.system.SecurityPanel;

    public class Main extends Sprite {
		private var mic:Microphone = Microphone.getMicrophone();
		private var loudBar:Loudness = new Loudness(0,400,20,400);
        public function Main() {
			addChild(loudBar);
			trace(loudBar.x);
			
            Security.showSettings(SecurityPanel.MICROPHONE);
            mic.setLoopBack(true);
            mic.gain = 10000;
            if (mic != null) {
                mic.setUseEchoSuppression(true);
				addEventListener(Event.ENTER_FRAME,updateActivity);
            }
        }
		private function updateActivity(e:Event):void {
			loudBar.changeLevel(mic.activityLevel);
		}
    }
}