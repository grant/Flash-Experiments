package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	[SWF( backgroundColor='0x000000', frameRate='24', width='600', height='400')]
	public class Main extends MovieClip {
		//Base Holders
		public var base:Base;
		//Scroller Holders
		private var sHeight:uint = 20;
		public var scroller:Scroller;
		public function Main():void {
			addBase();
			addScroller();
		}
		private function addBase():void {
			base = new Base(0,sHeight);
			addChild(base);
		}
		private function addScroller():void {
			scroller = new Scroller(0,0);
			addChild(scroller);
		}
	}
}