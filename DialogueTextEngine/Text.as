package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	public class Text extends Sprite {
		
		public var textBackground:TextBackground;
		public var nextButton:SimpleButton;
		public var textBox:TextField;
		private var format:TextFormat;
		
		private const padding:uint = 20;
		private const posY:uint = 300;
		
		public var textDatabase:Array = new Array();
		public const lineNumberStart:uint = 0;
		public var textDisplay:String;
		public var lineNumber:uint;
		
		private var i:uint = 0; //for speed
		private const speed:uint = 1; //lower = faster
		private const alphaSpeed:Number = .2;
		public function Text() {
			
			lineNumber = lineNumberStart;
			textDatabase[0] = "Hello person.";
			textDatabase[1] = "How are you?";
			textDatabase[2] = "This is my dream. I create my dreams. Tell me about your dreams.";
			textDatabase[3] = "Do you want to create a memory?";
			textDisplay = textDatabase[lineNumber];
			
			textBackground = new TextBackground();
			textBackground.x = 10;
			textBackground.y = 300;
			textBackground.alpha = 0;
			addChild(textBackground);
			
			format = new TextFormat();
			format.bold = true;
			format.size = 20;
			format.color = 0xFF4444;
			format.font = "Raavi";
			
			textBox = new TextField;
			textBox.x = padding;
			textBox.y = posY;
			textBox.width = 550-(padding*2);
			textBox.height = 400-posY-padding;
			textBox.wordWrap = true;
			textBox.alpha = 0;
			textBox.defaultTextFormat = format;
			textBox.text = "";
			addChild(textBox);
			
			nextButton = new Next();
			nextButton.x = 520;
			nextButton.y = 370;
			nextButton.alpha = 0;
			addChild(nextButton);
			addEventListener(Event.ENTER_FRAME,increaseAlpha);
		}
		public function increaseAlpha(e:Event):void {
			if(nextButton.alpha < 1 || alpha < 1 || textBackground.alpha < 1){
				nextButton.alpha += alphaSpeed;
				textBox.alpha += alphaSpeed;
				textBackground.alpha += alphaSpeed;
			} else {
				textBackground.alpha = 1;
				nextButton.alpha = 1;
				textBox.alpha = 1;
				addEventListener(Event.ENTER_FRAME,addChars);
				removeEventListener(Event.ENTER_FRAME,increaseAlpha);
			}
		}
		public function buttonPress():void {
			if(i!=0){//so doesn't automatically
				if(i/speed < textDatabase[lineNumber].length){//not done
					addRestOfText();
				} else {
					nextLine();
				}
			}
		}
		public function addRestOfText():void {
			i = textDatabase[lineNumber].length*speed;
			textBox.text = textDatabase[lineNumber];
			removeEventListener(Event.ENTER_FRAME,addChars);
		}
		public function nextLine():void {
			if(textDatabase[lineNumber+1]!=null){
				textBox.text = "";//erase
				i = 0;
				lineNumber++;
				textDisplay = textDatabase[lineNumber];
				addEventListener(Event.ENTER_FRAME,addChars);
			} else {
				addEventListener(Event.ENTER_FRAME,end);
			}
		}
		public function addChars(e:Event):void {
			if(i/speed==Math.ceil(i/speed)){
				if(textDisplay.charAt(i/speed)!=""){
					textBox.appendText(textDisplay.charAt(i/speed));
				} else {
					removeEventListener(Event.ENTER_FRAME,addChars);
				}
			}
			if(i/speed < textDatabase[lineNumber].length){
				i++;
			}
		}
		public function end(e:Event):void {
			if(nextButton.alpha <=0){
				nextButton.alpha = 0;
				textBox.alpha = 0;
				textBackground.alpha = 0;
				removeEventListener(Event.ENTER_FRAME,end);
				removeChild(nextButton);
				parent.removeChild(this);
			} else {
				nextButton.alpha-=alphaSpeed;
				textBox.alpha-=alphaSpeed;
				textBackground.alpha-=alphaSpeed;
			}
		}
	}
}