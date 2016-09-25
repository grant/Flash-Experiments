package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Frame extends MovieClip {
		public var backgrounds:Array = new Array();
		
		private var pos:String;
		private var bgNumber:uint;
		
		private var px:int;
		private var py:int;
				
		private var xdes:int = 0;
		private var ydes:int = 0;
		
		private var end:Boolean = false;
		private const ease:Number = .2;
		
		private var par:MovieClip;
		public function Frame(position:String,bgNum):void {
			pos = position;
			bgNumber = bgNum;
			
			addBackgroundPlaces();
			addChild(backgrounds[bgNum]);
			
			switch(position){
				case "Middle":
					px = 0;
					py = 0;
					break;
				case "Up":
					px = 0;
					py = height;
					break;
				case "Left":
					px = width;
					py = 0;
					break;
				case "Right":
					px = -width;
					py = 0;
					break;
				case "Down":
					px = 0;
					py = -height;
					break;
			}
			
			x = px;
			y = py;
			
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function addBackgroundPlaces():void {
			backgrounds[0] = new Bg1();
			backgrounds[1] = new Bg2();
			backgrounds[2] = new Bg3();
			backgrounds[3] = new Bg4();
		}
		public function easeMove(dir:String):void {
			switch(dir){
				case "Down":
					ydes = height;
					break;
				case "Up":
					ydes = -height;
					break;
				case "Left":
					xdes = -width;
					break;
				case "Right":
					xdes = width;
					break;
				case "Middle":
					xdes = 0;
					ydes = 0;
					moveXY();//fix white space glitch
					break;
			}
			end = true;
			addEventListener(Event.ENTER_FRAME,translate);
		}
		private function translate(e:Event):void {
			if(end){
				if(Math.abs(xdes-x)<1&&Math.abs(ydes-y)<1){
					remove();
				}
			}
			moveXY();
		}
		private function moveXY():void {
			x += (xdes-x)*ease;
			y += (ydes-y)*ease;
		}
		private function remove():void {
			removeEventListener(Event.ENTER_FRAME,translate);
			//par.removeChild(this);
		}
	}
}