/*
Bugs Id . Current State . Description
1       : Solved        : Fading sound doesn't work if a key is pressed more than once
*/
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	public class Piano extends MovieClip {
		private const beginningStart:uint = 300;//250 ms+ start on mp3
		private const lowerVolumeRate:Number = .1;
		private const NUM_SOUNDS:uint = 54;
		private const base:String = "/Sounds/Notes/";
		private var loadedSounds:uint = 0;
		private var sounds:Vector.<Sound> = new Vector.<Sound>();
		private var scale:Vector.<String>;
		private var keyOn:Vector.<Boolean>;
		private var loweringVolume:Vector.<Boolean>;
		private var channels:Vector.<SoundChannel>;
		private var lastKey:String="";//stops bug 1
		public function Piano():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			//Functions
			setPianoScale();
			setKeyOn();
			setLoweringVolume();
			createSoundChannels();
			loadSounds();
			//Events
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyIsDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyIsUp);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function setPianoScale():void {
			scale = new Vector.<String>();
			scale.push("z","x","c","v","b","n","m",",",".","/","a","s","d","f","g","h","j","k","l",";","\'","q","w","e","r","t","y","u","i","o","p","[","]","\\","1","2","3","4","5","6","7","8","9","0","-","=");
		}
		private function setKeyOn():void {
			keyOn = new Vector.<Boolean>;
			for(var i:uint = 0;i<scale.length;i++){
				keyOn[i] = false;
			}
		}
		private function setLoweringVolume():void {
			loweringVolume = new Vector.<Boolean>();
			for(var i:uint = 0;i<NUM_SOUNDS;i++){
				loweringVolume[i] = false;
			}
		}
		private function createSoundChannels():void {
			channels = new Vector.<SoundChannel>;
			for(var i:uint = 0;i<NUM_SOUNDS;i++){
				channels[i] = new SoundChannel();
			}
		}
		private function loadSounds():void {
			sounds[loadedSounds] = new Sound();
			var url:String = base+"note"+uint(loadedSounds)+".mp3";
			sounds[loadedSounds].load(new URLRequest(url));
			sounds[loadedSounds].addEventListener(IOErrorEvent.IO_ERROR, soundIOError);  
			sounds[loadedSounds].addEventListener(Event.COMPLETE, onComplete);
		}
		private function soundIOError(e:IOErrorEvent):void {
			trace("There was a problem when loading the sounds.");
			trace("Error on sound: "+loadedSounds);
		}
		private function onComplete(e:Event):void {
			trace("Loaded sound: "+loadedSounds);
			loadedSounds++;
			if(loadedSounds==NUM_SOUNDS){
				allSoundsLoaded();
			} else {
				loadSounds();
			}
		}
		private function allSoundsLoaded():void {
			addEventListener(Event.ENTER_FRAME,adjustifyVolume);
			trace("Done");
		}
		private function keyIsDown(e:KeyboardEvent):void {
			var character:String = String.fromCharCode(e.charCode);
			var index = findCharacterIndex(character);
			if(index!=-1){//if a keyboard key
				lastKey = character;
				if(!keyOn[index]){//if not playing
					keyOn[index] = true;
					if(lastKey==character){//prevents glitch
						//stops key playing if it was the last key playing
						channels[index].stop();
						loweringVolume[index] = false;
					}
					channels[index] = sounds[index].play(beginningStart);
				}
			}
		}
		private function keyIsUp(e:KeyboardEvent):void {
			var character:String = String.fromCharCode(e.charCode);
			var index = findCharacterIndex(character);
			if(index!=-1){
				keyOn[index] = false;
				loweringVolume[index] = true;
				//channels[index].stop();
			}
		}
		private function adjustifyVolume(e:Event):void {
			for(var i:uint = 0;i<NUM_SOUNDS;i++){
				if(loweringVolume[i]){
					var tr:SoundTransform = channels[i].soundTransform;
					var vol:Number = tr.volume;
					vol-=lowerVolumeRate;
					if(vol<=0){
						vol = 0;
						channels[i].stop();
						loweringVolume[i] = false;
					}
					tr.volume = vol;
  					channels[i].soundTransform = tr;
				}
			}
		}
		private function findCharacterIndex(char:String):int {
			var answer:int = -1;
			//loop
			var i:uint = 0;
			var done:Boolean = false;
			while(!done){
				if(i==scale.length){
					done = true;
				} else {
					if(char==scale[i]){
						answer = i;
					}
					i++;
				}
			}
			return answer;
		}
	}
}