package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.Font;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	public class SpeechBox extends Sprite {
		private const padding:uint = 10;
		private const shortened:Boolean=true;
		private const maxCharLine:uint=11;
		private const alphaSpeed:Number=.05;

		private var isHenrys:Boolean;
		private var dW:uint;
		private var desX:uint;
		private var canType:Boolean=false;
		private var speechBubble:SpeechBubble;
		private var speechBubbleTail:SpeechBubbleTail;
		private var textBox:TextField = new TextField();
		private var textFormat:TextFormat = new TextFormat();

		private var par:MovieClip;
		public function SpeechBox(msg:String,typable:Boolean,henrys:Boolean,px:int,defaultWidth:uint):void {
			canType = typable;
			isHenrys = henrys;
			desX = px;
			x=px;
			alpha=0;
			dW = defaultWidth;

			textFormat.font="Franklin Gothic Book";
			textFormat.size=32;
			textFormat.align=TextFormatAlign.LEFT;
			textBox.defaultTextFormat=textFormat;
			textBox.text=msg;
			textBox.wordWrap=true;
			
			speechBubble = new SpeechBubble(0,0,dW,0);
			speechBubbleTail = new SpeechBubbleTail();
			if(!henrys){
				speechBubbleTail.scaleX = -1;
			}
			
			addChild(speechBubbleTail);
			addChild(speechBubble);
			addChild(textBox);
			
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
			addEventListener(Event.ENTER_FRAME,alphaUp);
		}
		private function onAdd(e:Event):void {
			par=MovieClip(parent.parent);
			updateEverything();
			if(canType){
				addEventListener(Event.ENTER_FRAME,updateText);
			}
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function updateEverything():void {
			if(canType){
				updateTypable();
			}
			
			textBox.width=dW;
			textBox.height = Number((textFormat.size+7))*textBox.numLines;
			
			if(textBox.text.length==0){
				speechBubble.width = 30+(2*padding);
			} else if(textBox.numLines==1&&textBox.text.length<maxCharLine){
				speechBubble.width = (textBox.text.length*32)+(2.5*padding);
			} else {
				speechBubble.width = textBox.width+(padding*.5);
			}
			speechBubble.height = textBox.height+(2*padding);
			
			textBox.x=padding+speechBubble.x;
			textBox.y=padding;
			
			if(!isHenrys){
				x = desX+dW-speechBubble.width;
				speechBubbleTail.x = speechBubble.width;
			}
			
			par.updateY();
		}
		private function updateText(e:Event):void {
			updateEverything();
		}
		private function updateTypable():void {
			textBox.text=par.ime.reply;
		}
		//Alpha
		private function alphaUp(e:Event):void {
			if (alpha>=1) {
				removeEventListener(Event.ENTER_FRAME,alphaUp);
			} else {
				alpha+=alphaSpeed;
			}
		}
		public function fixReply():void {
			removeEventListener(Event.ENTER_FRAME,updateText);
		}
	}
}