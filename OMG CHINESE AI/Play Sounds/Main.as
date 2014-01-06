package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class Main extends MovieClip {
		private var numbers:Array = new Array("0","1","2","3","4","5","6","7","8","9");
		public function Main():void {
			input.text = "bo1";//"Type pinyin with tone and press the blue below.";
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			stage.addEventListener(MouseEvent.CLICK,onClick);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			if(stage.mouseY>=100){
				var pinyin:Vector.<String> = separatePinyin(input.text);
				if(pinyin.length!=0){
					var playSound:PlaySound = new PlaySound(pinyin);
					addChild(playSound);
				}
			}
		}
		private function separatePinyin(pinyin:String):Vector.<String> {
			var answer:Vector.<String> = new Vector.<String>();
			var end:uint = pinyin.length;
			var lastEnd:uint = 0;
			for(var a:uint = 0;a<end;a++){//for all characters
			
				//If Number
				var num:Boolean = false;
				for(var b:uint = 0;b<numbers.length;b++){//for all numbers
					if(pinyin.charAt(a)==numbers[b]){
						num=true;
					}
				}
				if(num){
					if(answer.length==0){
						answer.push(pinyin.substring(lastEnd,a+1));
					} else {
						answer.push(pinyin.substring(lastEnd+1,a+1));
					}
					lastEnd=a;
				}
			}
			return answer;
		}
	}
}