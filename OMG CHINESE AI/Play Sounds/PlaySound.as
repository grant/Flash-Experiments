package {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	public class PlaySound extends MovieClip {
		private const startDelay:uint = 0;//how far in the mp3 you should start
		private const endDelay:uint = 100;//how far before the previous mp3 ends should you start
		private const base:String="../Sounds/Words/";
		
		private var error:Boolean = false;
		
		private var loadedSounds:uint = 0;
		private var currentWord:uint = 0;
		private var currentTone:String = "";
		
		private var words:Vector.<String>;
		
		private var sounds:Vector.<Sound>;
		private var soundLengths:Vector.<Number>;
		private var extraSoundLength:Vector.<Number>;
		private var soundTimes:Vector.<Number>;
		private var channel:SoundChannel;
		
		public function PlaySound(pinyin:Vector.<String>):void {
			//Words
			words = pinyin;
			//Extra Sound Length (added ms with all tones);
			extraSoundLength = new Vector.<Number>();
			extraSoundLength.push(0,0,0,0,300,0,0,0,0,0);//4th tone has +300 ms
			//Create new Vectors
			sounds = new Vector.<Sound>();
			soundLengths = new Vector.<Number>();
			soundTimes = new Vector.<Number>();
			
			loadSounds();
			
			channel = new SoundChannel();
		}
		private function loadSounds():void {
			currentTone = words[loadedSounds].substring(words[loadedSounds].length-1,words[loadedSounds].length);
			sounds[loadedSounds] = new Sound();
			sounds[loadedSounds].load(new URLRequest(base+words[loadedSounds]+".mp3"));
			sounds[loadedSounds].addEventListener(IOErrorEvent.IO_ERROR, sndIOError);  
			sounds[loadedSounds].addEventListener(Event.COMPLETE, onComplete);
		}
		private function allSoundsLoaded():void {
			calculateSoundTimes(soundLengths);
			
			//Play sounds
			sounds[0].play(startDelay);
			currentWord++;
			for(var a:uint = 1;a<soundTimes.length;a++) {
				var timer:Timer = new Timer(soundTimes[a]);
				timer.addEventListener(TimerEvent.TIMER,timeUp);
				timer.start();
			}
		}
		private function timeUp(e:TimerEvent):void {
			sounds[currentWord].play(startDelay);
			e.target.stop();
			currentWord++;
			removeEventListener(TimerEvent.TIMER,timeUp);
		}
		private function onComplete(e:Event):void {
			soundLengths.push(e.target.length+extraSoundLength[currentTone]);
			loadedSounds++;
			if(loadedSounds==words.length){
				allSoundsLoaded();
			} else {
				loadSounds();
			}
		}
		private function calculateSoundTimes(lengths:Vector.<Number>):void {
			var times:Vector.<Number> = new Vector.<Number>();
			var lengthSum:Number = 0;
			times.push(0);
			for(var a:uint = 1;a<lengths.length;a++){
				lengthSum+=lengths[a-1];
				times.push(lengthSum-((endDelay+startDelay)*a));
			}
			soundTimes = times;
		}
		//Errors 
		private function sndIOError(e:IOErrorEvent):void {
			error = true;
			trace("An error occured when loading the sound.");
			trace("Testing all words for errors...");
			for(var a:uint = 0;a<words.length;a++){
				sounds[a] = new Sound();
				trace(a+": "+words[a]);
				sounds[a].load(new URLRequest(base+words+".mp3"));
			}
		}

		private function sndProgress(e:ProgressEvent):void {
			trace("Loading: " + Math.round(100 * e.bytesLoaded / e.bytesTotal));
		}

		private function sndComplete(e:Event):void {
			trace("Sound loaded - click the stage to play and stop");
			//s.play();
		}
	}
}