package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Main extends MovieClip {
		//Constants
		private const spacing:uint = 10;//10
		private const size:uint = 8;//8
		private var xLength:uint;
		private var yLength:uint;
		//Dots
		private var dots:Array = new Array();
		//Layers
		private var bg:Bg = new Bg();
		private var dotsLayer:MovieClip = new MovieClip();
		public function Main():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addLayers();
			addDots();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function addLayers():void {
			addChild(bg);
			addChild(dotsLayer);
		}
		private function addDots():void {
			xLength = stage.stageWidth/spacing;
			yLength = stage.stageHeight/spacing;
			for(var a:uint = 0;a<xLength;a++){
				dots[a] = new Array();
				for(var b:uint = 0;b<yLength;b++){
					dots[a][b] = new Dot(a,b,spacing,size);
					dotsLayer.addChild(dots[a][b]);
				}
			}
		}
	}
}