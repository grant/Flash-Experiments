//How to use:

//var characters are the characters you want in the array

//include commas between characters if you have multi-character words

package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Main extends MovieClip {
		var commas:Boolean;
		var array:Boolean=false;
		//Ex. "人刀"
		//Ex2. "人,刀"
		//pinyin with commas also works
		var characters:String = "";
		public function Main():void {
			addEventListener(Event.ENTER_FRAME,onLoop);
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			stage.addEventListener(MouseEvent.MOUSE_WHEEL,onWheel);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onWheel(e:MouseEvent):void {
			if(array){
				array = false;
			} else {
				array = true;
			}
		}
		private function onLoop(e:Event):void {
			updateOutput();
		}
		private function updateOutput():void {
			characters = inputBox.text;
			//check if there are commas
			commas = false;
			for(var a:uint = 0;a<characters.length;a++){
				if(characters.charAt(a)==","||characters.charAt(a)=="，"){
					commas = true;
				}
			}
			
			//Create string
			var output:String = "";
			if(array){
				output+=" = new Array(new Array(\"";
			} else {
				output+=" = new Array(\"";
			}
			if(commas){
				for(var i:uint = 0;i<characters.length;i++){
					if(characters.charAt(i)==","||characters.charAt(i)=="，"){
						if(array){
							output+="\"),new Array(\"";
						} else {
							output+="\",\"";
						}
					} else if(characters.charAt(i)=="|"){
						output+="\",\"";
					} else {
						output+=characters.charAt(i);
					}
				}
			} else {
				for(var j:uint = 0;j<characters.length;j++){
					output+=characters.charAt(j);
					if(j!=characters.length-1){
						if(array){
							output+="\"),new Array(\"";
						} else {
							output+="\",\"";
						}
					}
				}
			}
			if(array){
				output+="\"));";
			} else {
				output+="\");";
			}
			//Trace
			textBox.text = output;
		}
	}
}