package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Main extends MovieClip {
		private const spacing:uint = 20;//10
		private const size:uint = 16;//8
		private var xLength:uint;
		private var yLength:uint;
		//Dots
		private var dots:Array = new Array();
		//OnOff
		public var onOff:Array = new Array();
		private const defaultOnOff:Boolean = true;//changes if connected to sides
		private const chanceOn:Number = 0.3;
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
			//onOff
			for(var a:uint = 0;a<xLength;a++){
				onOff[a] = new Array();
				for(var b:uint = 0;b<yLength;b++){
					onOff[a][b] = chance(chanceOn);
				}
			}
			//dots
			for(var c:uint = 0;c<xLength;c++){
				dots[c] = new Array();
				for(var d:uint = 0;d<yLength;d++){
					dots[c][d] = new Dot(c,d,spacing,size,onOff[c][d]);//last = chance of selected
					dotsLayer.addChild(dots[c][d]);
				}
			}
		}
		private function chance(probability:Number):Boolean {
			var answer:Boolean;
			var rand:Number = Math.random();
			if(rand<probability){
				answer = true;
			} else {
				answer = false;
			}
			return answer;
		}
		public function getNeighbors(px:uint,py:uint):Array {
			var neighbors:Array = new Array();//top,right,down,left
			if(py!=0){//top
				neighbors.push(onOff[px][py-1]);
			} else {
				neighbors.push(defaultOnOff);
			}
			if(px!=xLength-1){//right
				neighbors.push(onOff[px+1][py]);
			} else {
				neighbors.push(defaultOnOff);
			}
			if(py!=yLength-1){
				neighbors.push(onOff[px][py+1]);
			} else {
				neighbors.push(defaultOnOff);
			}
			if(px!=0){
				neighbors.push(onOff[px-1][py]);
			} else {
				neighbors.push(defaultOnOff);
			}
			return neighbors;
		}
	}
}