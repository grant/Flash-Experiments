package {
	import flash.display.Sprite;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class Main extends Sprite {
		private var sound:Sound;
		private var channel:SoundChannel;

		private var phaseA4:Number=0;
		private var phaseCsharp4:Number=0;
		private var phaseE4:Number=0;

		private var A4:Number=110.0*Math.pow(2,4+0/12)/44100;
		private var Csharp4:Number=110.0*Math.pow(2,4+4/12)/44100;
		private var E4:Number=110.0*Math.pow(2,4+7/12)/44100;
		public function Main():void {
			sound = new Sound();
			sound.addEventListener(SampleDataEvent.SAMPLE_DATA, writeData);
			channel=sound.play();
		}
		private function writeData(e:SampleDataEvent):void {
			for (var i:Number = 0; i<8192; i++) {

				/*
				//Channel (-1 to 1)
				//Math.random()*2-1
				var lc:Number = Math.cos(i/8192)*2 - 1;
				var rc:Number = Math.cos(i/8192)*2 - 1;
				
				//Left Channel
				e.data.writeFloat(lc);
				
				//RightChannel
				e.data.writeFloat(rc);
				*/

				/*
				var n:Number = Math.sin((i + e.position) * Math.PI / 100);
				e.data.writeFloat(n); 
				e.data.writeFloat(n); 
				*/


				var amplitudeA4:Number=Math.sin(phaseA4);
				var amplitudeCsharp4:Number=Math.sin(phaseCsharp4);
				var amplitudeE4:Number=Math.sin(phaseE4);

				phaseA4+=A4;
				phaseCsharp4+=Csharp4;
				phaseE4+=E4;

				e.data.writeFloat(amplitudeA4+amplitudeCsharp4+amplitudeE4);
				e.data.writeFloat(amplitudeA4+amplitudeCsharp4+amplitudeE4);
			}
		}
	}
}