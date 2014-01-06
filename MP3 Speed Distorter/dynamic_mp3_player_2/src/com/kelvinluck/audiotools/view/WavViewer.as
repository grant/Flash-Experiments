package com.kelvinluck.audiotools.view 
{
	import mx.containers.Canvas;
	import mx.core.ScrollPolicy;

	import flash.media.Sound;
	import flash.utils.ByteArray;		

	/**
	 * @author Kelvin Luck
	 */
	public class WavViewer extends Canvas 
	{

		private var _sound:Sound;

		public function get sound():Sound
		{
			return _sound;
		}

		public function set sound(value:Sound):void
		{
			if (value != _sound) {
				_sound = value;
				var bytes:ByteArray = new ByteArray();
				value.extract(bytes, int(value.length * 44.1));
				soundBytes = bytes;
			}
		}

		private var _soundBytes:ByteArray;

		public function get soundBytes():ByteArray
		{
			return _soundBytes;
		}

		public function set soundBytes(value:ByteArray):void
		{
			if (value != _soundBytes) {
				_soundBytes = value;
				if (renderer) {
					renderer.soundBytes = value;
				}
			}
		}

		private var renderer:WavRenderer;

		public function WavViewer()
		{
			super();
			percentWidth = percentHeight = 100;
			horizontalScrollPolicy = ScrollPolicy.AUTO;
			setStyle('backgroundColor', 0x000000);
		}

		override protected function createChildren():void
		{
			super.createChildren();
			var fwr:FlexWavRenderer = new FlexWavRenderer();
			addChild(fwr);
			renderer = fwr.renderer;
			if (_soundBytes) {
				renderer.soundBytes = _soundBytes;
			}
		}
	}
}

import mx.core.UIComponent;

import com.kelvinluck.audiotools.view.WavRenderer;

import flash.events.Event;

internal class FlexWavRenderer extends UIComponent 
{

	private var _renderer:WavRenderer;

	public function get renderer():WavRenderer
	{
		return _renderer;
	}

	public function FlexWavRenderer()
	{
		super();
		percentWidth = percentHeight = 100;
	}

	override protected function createChildren():void
	{
		super.createChildren();
		_renderer = new WavRenderer();
		_renderer.addEventListener(Event.RESIZE, onRendererResize);
		addChild(_renderer);
	}
	
	private function onRendererResize(event:Event):void
	{
		width = renderer.width;
		height = renderer.height;
	}
}