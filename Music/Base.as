package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	public class Base extends MovieClip {
		//Sound Holders
		private var channel:SoundChannel = new SoundChannel();
		private var trans:SoundTransform = new SoundTransform();
		
		private var a:Sound = new MiddleA();
		private var b:Sound = new MiddleB();
		private var c:Sound = new MiddleC();
		private var d:Sound = new MiddleD();
		private var e:Sound = new MiddleE();
		private var f:Sound = new MiddleF();
		private var g:Sound = new MiddleG();
		private var sa:Sound = new SharpA();
		private var sc:Sound = new SharpC();
		private var sd:Sound = new SharpD();
		private var sf:Sound = new SharpF();
		private var sg:Sound = new SharpG();
		public var note:Array = new Array(c,sc,d,sd,e,f,sf,g,sg,a,sa,b);
		//Blocks Changables
		public var xsize:uint = 112;
		public var ysize:uint = 12;
		public var size:uint = 30;
		//Block Holders
		public var h:Array;//block array
		public var off:Boolean;
		public var changing:Boolean;
		//Bar Holders
		private var bar:Bar;
		public function Base(xpos:uint,ypos:uint):void {
			x = xpos;
			y = ypos;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		public function onAdd(e:Event):void {
			addEventListener(MouseEvent.MOUSE_UP,notChanging);
			addBlocks();
			addBar();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function notChanging(e:MouseEvent):void {
			changing=false;
		}
		private function addBlocks():void {
			h = new Array();
			for(var a:uint = 0;a<xsize;a++){
				h[a] = new Array();
				for(var b:uint = 0;b<ysize;b++){
					h[a][b] = new Block(a,b,size,false);
					addChild(h[a][b]);
				}
			}
		}
		private function addBar():void {
			bar = new Bar(0,size,stage.stageHeight);
			addChild(bar);
		}
		public function playSound(note:Sound,v:Number,p:Number):void {
			channel = note.play();
			//trans.volume = v;
			//trans.pan = p;
			//channel.soundTransform = trans;
		}
	}
}