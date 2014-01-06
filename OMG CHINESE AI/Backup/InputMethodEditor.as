package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	public class InputMethodEditor extends MovieClip {

		public var reply:String="";

		private const maxLetters:uint=20;
		private const numberOfResults:uint=5;

		private var resultHolder:Array = new Array();

		private var textFormat:TextFormat = new TextFormat();
		private var inputBox:TextField = new TextField();

		public function InputMethodEditor(px:uint,py:uint,w:uint,h:uint):void {
			x=px;
			y=py;
			textFormat.font="Franklin Gothic Book";
			textFormat.bold=false;
			textFormat.size=18;
			textFormat.align=TextFormatAlign.LEFT;
			inputBox.defaultTextFormat=textFormat;
			inputBox.width=w;
			inputBox.height=h;
			inputBox.type=TextFieldType.INPUT;
			inputBox.restrict=". , ! ? a-z 0-"+String(numberOfResults);
			inputBox.condenseWhite=true;
			inputBox.htmlText="Click Here to Start";
			inputBox.addEventListener(MouseEvent.CLICK,onClick);
			inputBox.addEventListener(Event.CHANGE,onInput);
			addChild(inputBox);
			for (var a:uint = 0; a<numberOfResults; a++) {
				resultHolder.push(new TextField());
				resultHolder[a].defaultTextFormat=textFormat;
				resultHolder[a].width=w;
				resultHolder[a].height=h;
				resultHolder[a].x=px;
				resultHolder[a].y = py+((a+1)*(h-5));
				addChild(resultHolder[a]);
			}
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN,checkForKeys);
			//stage.addEventListener(MouseEvent.CLICK,selectTextField);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onClick(e:MouseEvent):void {
			clearAll();
		}
		private var found:Array = new Array();
		private function onInput(e:Event):void {
			found=[];
			//Populate Choises
			found=Db.findWords(inputBox.text,numberOfResults);
			for (var j:uint = 0; j<numberOfResults; j++) {
				var foundPinyin:String=Db.getSymbolPinyin(Db.getPinyin(found[j]));
				if (found[j]==undefined) {
					resultHolder[j].text="";
				} else {
					var lengthOfTyped:uint = findLength(inputBox.text,removeNumbers(Db.getPinyin(found[j])));
					var boldedWord:String = " <b>"+foundPinyin.substring(0,lengthOfTyped)+"</b>"+foundPinyin.substring(lengthOfTyped,foundPinyin.length);
					var englishMeaning:String = Db.getMeanings(found[j]);
					resultHolder[j].htmlText = (j+1)+": "+found[j]+boldedWord+" | "+englishMeaning;
				}
			}
			//Check If Number
			for (var k:uint = 0; k<10; k++) {//for all numbers
				if (Number(inputBox.text.charAt(inputBox.text.length-1))==k) {//if put in number
					if (Db.numOfResults(inputBox.text)==1&&found.length<k) {//if the current text is a word and if the tone of the word isn't a possible choice
						reply+=Db.getChar(inputBox.text);
						clearAll();
					} else {
						if (found[k-1]!=undefined&&k!=0) {
							reply+=found[k-1];
							clearAll();
						}
					}
					inputBox.text = removeNumbers(inputBox.text);
				}
			}
			//Check If Punctuation
			for (var l:uint = 0; l<Db.englishPunct.length; l++) {//for all punctuation
				if (inputBox.text.charAt(inputBox.length-1)==Db.englishPunct[l]) {//if the last character is punctuation
					if (found.length>0) {
						reply+=Db.getChar(found[0]);
					}
					reply+=Db.getPunct(inputBox.text.charAt(inputBox.length-1));//get last character and convert punctuation
					clearAll();
				}
			}
			//Check If Space
			if (inputBox.text.charAt(inputBox.text.length-1)==" ") {
				if (found.length>0) {
					reply+=found[0];//add the first character
					clearAll();
				} else {
					removeSpaces();
				}
			}
			//Max Character Check
			if (inputBox.length>maxLetters) {
				deleteLastCharacter();
			}
		}
		private function checkForKeys(e:KeyboardEvent):void {
			//Delete
			if (e.keyCode==8&&inputBox.text=="") {
				var newReply:String="";
				for (var i:uint = 0; i<reply.length-1; i++) {
					newReply+=reply.charAt(i);
				}
				reply=newReply;
			}
			//Enter
			if (e.keyCode==13) {
				MovieClip(parent).replyToMessage(reply);
			}
		}
		private function selectTextField(e:MouseEvent):void {
			focus();
		}
		private function focus():void {
			stage.focus=inputBox;
		}
		private function clearAll():void {
			inputBox.text="";
			for (var l:uint = 0; l<numberOfResults; l++) {
				resultHolder[l].text="";
			}
		}
		private function deleteLastCharacter():void {
			var input:String="";
			for (var i:uint = 0; i<maxLetters; i++) {
				input+=inputBox.text.charAt(i);
			}
			inputBox.text=input;
		}
		private function removeNumbers(string:String):String {
			var newString:String = "";
			for(var i:uint = 0;i<string.length;i++){
				var notANumber:Boolean=true;
				for(var j:uint = 0;j<Db.tones.length;j++){
					if(string.charAt(i)==Db.tones[j]){
						notANumber=false;										  
					}
				}
				if(notANumber){
					newString+=string.charAt(i);	
				}
			}
			return newString;
		}
		private function removeSpaces():void {
			var newString:String = "";
			for(var i:uint = 0;i<inputBox.text.length;i++){
				if(inputBox.text.charAt(i)!=" "){
					newString+= inputBox.text.charAt(i);
				}
			}
			inputBox.text = newString;
		}
		private function findLength(piece:String,whole:String):uint {
			var leng:uint = 0;
			var long:uint = whole.length;
			while(leng==0){
				if(piece.substring(0,long)==whole.substring(0,long)){
					leng = long;
				} else {
					long--;
				}
			}
			return long;
		}
	}
}