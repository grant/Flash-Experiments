package  
{
	import com.kelvinluck.audio.MP3Player;
	
	import org.audiofx.mp3.MP3FileReferenceLoader;
	import org.audiofx.mp3.MP3SoundEvent;
	
	import mx.controls.Button;
	import mx.controls.HSlider;
	import mx.controls.Label;
	import mx.core.Application;
	import mx.events.FlexEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;	

	/**
	 * @author Kelvin Luck
	 */
	public class MP3PlayerUIClass extends Application 
	{

		public var loadMp3Button:Button;
		public var rangeSlider:HSlider;
		public var speedLabel:Label;

		private var fr:FileReference;
		private var mp3Player:MP3Player;
		private var mp3Loader:MP3FileReferenceLoader;

		public function MP3PlayerUIClass()
		{
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}

		private function onCreationComplete(event:FlexEvent):void
		{
			mp3Player = new MP3Player();
			mp3Loader = new MP3FileReferenceLoader();
			mp3Loader.addEventListener(MP3SoundEvent.COMPLETE, onMp3LoadComplete);
			loadMp3Button.addEventListener(MouseEvent.CLICK, onLoadMp3);
			rangeSlider.addEventListener(Event.CHANGE, onSliderChange);

		}

		private function onSliderChange(event:Event):void
		{
			mp3Player.playbackSpeed = rangeSlider.value;
		}

		private function onLoadMp3(event:MouseEvent):void
		{
			fr = new FileReference();

			fr.addEventListener(Event.SELECT, onFileSelect);
			fr.addEventListener(Event.CANCEL, onCancel);
			
			fr.browse([new FileFilter('Mp3 files', '*.mp3')]);
		}

		private function onFileSelect(e:Event):void
		{
			mp3Player.stop();
			mp3Loader.getSound(fr);
		}

		private function onCancel(e:Event):void
		{
			trace("File Browse Cancelled");
			fr = null;
		}
		
		private function onMp3LoadComplete(event:MP3SoundEvent):void
		{
			mp3Player.playLoadedSound(event.sound);
		}
	}
}
