package {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	public class Main extends MovieClip {
		private var timer:Timer;
		private var soundChannel:SoundChannel;
		public function Main():void {
			soundChannel = new SoundChannel();
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			loopSound();
		}
		private function loopSound():void {
			playSound();
			//soundChannel.addEventListener(Event.SOUND_COMPLETE,onSoundDone);
		}
		private function playSound():void {
			var sound:Bo1 = new Bo1();
			soundChannel = sound.play();
			timer = new Timer(sound.length/2);
			timer.addEventListener(TimerEvent.TIMER,timeListener);
			timer.start();
		}
		private function timeListener(e:TimerEvent):void {
			timer.removeEventListener(TimerEvent.TIMER,timeListener);
			loopSound();
		}
		private function onSoundDone(e:Event):void {
			loopSound();
		}
	}
}
/*
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	public class Main extends MovieClip {
		private var soundChannel:SoundChannel;
		public function Main():void {
			soundChannel = new SoundChannel();
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			loopSound();
		}
		private function loopSound():void {
			playSound();
			soundChannel.addEventListener(Event.SOUND_COMPLETE,onSoundDone);
		}
		private function playSound():void {
			var sound:Bo1 = new Bo1();
			soundChannel = sound.play();
		}
		private function onSoundDone(e:Event):void {
			loopSound();
		}
	}
}
*/