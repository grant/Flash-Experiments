package com.kelvinluck.audiotools.view 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.ByteArray;	

	/**
	 * @author Kelvin Luck
	 */
	public class WavRenderer extends Sprite 
	{

		public static const COLOUR_BACKGROUND:int = 0x000000;
		public static const COLOUR_WAV:int = 0x00FF00;

		private var _soundBytes:ByteArray;
		public function set soundBytes(value:ByteArray):void
		{
			if (value != _soundBytes) {
				_soundBytes = value;
				draw();
			}
		}
		
		override public function get width():Number
		{
			return displayWidth;
		}
		
		override public function get height():Number
		{
			return displayHeight;
		}

		private var displayWidth:int;
		private var displayHeight:int;
		private var displayChannelHeight:int;
		private var leftChannelCentreY:int;
		private var rightChannelCentreY:int;

		public function WavRenderer()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function draw():void
		{
			graphics.clear();
			graphics.beginFill(COLOUR_BACKGROUND);
			graphics.drawRect(0, 0, displayWidth, displayHeight);
			graphics.lineStyle(1, 0xffffff);
			graphics.moveTo(0, leftChannelCentreY);
			graphics.lineTo(displayWidth, leftChannelCentreY);
		
			_soundBytes.position = 0;
		
			var len:int = _soundBytes.length;
		
			var samplesPerPixel:Number = _soundBytes.length / displayWidth;
		
			var l:Number;
			var r:Number;
		
			var leftChannel:Vector.<Number> = new Vector.<Number>();
			var rightChannel:Vector.<Number> = new Vector.<Number>();
		
			var currentLSign:int;
			var currentL:Number;
			var currentRSign:int;
			var currentR:Number;
		
			var currentPixel:int = 0;
		
			var nextPixelBoundry:Number = samplesPerPixel;
		
			var i:int = 0;
			while (i < len) {
				l = _soundBytes.readFloat();
			
				if (l > currentL) {
					currentL = l;
					currentLSign = 1;
				} else if (l < -currentL) {
					currentL = -l;
					currentLSign = -1;
				}
			
				r = _soundBytes.readFloat();
			
				if (r > currentR) {
					currentR = l;
					currentRSign = 1;
				} else if (r < -currentR) {
					currentR = -l;
					currentRSign = -1;
				}
			
				i += 8;
				if (i >= nextPixelBoundry) {
					nextPixelBoundry += samplesPerPixel;
					l = currentL * currentLSign;
					graphics.moveTo(currentPixel, leftChannelCentreY);
					graphics.lineTo(currentPixel, leftChannelCentreY + (l * displayChannelHeight / 2));
					leftChannel.push(l);
					currentL = -1;
				
					r = currentR * currentRSign;
					graphics.moveTo(currentPixel, rightChannelCentreY);
					graphics.lineTo(currentPixel, rightChannelCentreY + (r * displayChannelHeight / 2));
					rightChannel.push(r);
					currentR = -1;
				
					currentPixel++;
				}
			}
			
			dispatchEvent(new Event(Event.RESIZE));
		}

		private function onAddedToStage(event:Event):void
		{
			displayWidth = parent.width;
			// dodgyness to allow space for the scrollbar if necessary...
			displayHeight = parent.height - 16;
			displayChannelHeight = Math.floor(displayHeight / 2);
			leftChannelCentreY = Math.round(displayHeight / 4);
			rightChannelCentreY = Math.round(displayHeight / 4 * 3);
		}
	}
}
