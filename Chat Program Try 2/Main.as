/*
Note: Couldn't get specific data downloading right so you download all the data every time you update.
IMPORTANT: Use absolute location when in debug mode, relative url location in live mode
*/
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.navigateToURL;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	public class Main extends MovieClip {
		private const DEBUG:Boolean = true;
		//USER VARIABLES
		private const defaultUsername:String = "Guest";
		private var usernameText:String = defaultUsername;
		private const emptyMessage:String = "Type something here as a message.";
		private var msgText:String = "Type your message here...";
		//OTHER VARIABLES
		private var lastUpdate:Date;
		//BUTTONS
		private var submit:Submit = new Submit(450,350);
		public function Main():void {
			//DEFAULT TEXTS
			username.text = usernameText;
			input.text = msgText;
			//PLACE BUTTON
			addChild(submit);
			//DOWNLOAD
			//postChat();
			//getChat();
			addEventListener(Event.ENTER_FRAME,onLoop);
		}
		private var timer:uint = 0;
		private const timeCount:uint = 10;
		private function onLoop(e:Event):void {
			if(timer==timeCount){
				timer=0;
				getChat();
			} else {
				timer++;
			}
		}
		private function getChat():void {
			var shortUrl:String = "/getChat.php";
			var getChatUrl:String = "http://www.granttimmerman.com/getChat.php";
			var scriptLoader:URLLoader = new URLLoader();
			var scriptRequest:URLRequest;
			if(DEBUG){
				scriptRequest = new URLRequest(getChatUrl);
			} else {
				scriptRequest = new URLRequest(shortUrl);
			}
			var scriptVars:URLVariables = new URLVariables();
			scriptLoader.addEventListener(Event.COMPLETE, downloadSuccess);
			scriptLoader.addEventListener(IOErrorEvent.IO_ERROR, handleLoadError);
			if(lastUpdate == null){
				scriptVars.many = "All";
				scriptVars.since = "Unset";//Date
			}/* else {
				trace("SDF");
				scriptVars.many = "SinceDate";
				scriptVars.since = dateFormat(lastUpdate);
			}
			*/
			scriptVars.now = dateFormat(new Date());
			scriptRequest.method = URLRequestMethod.POST;
			scriptRequest.data = scriptVars;
			scriptLoader.load(scriptRequest);
			//lastUpdate = new Date();
		}
		private function postChat():void {
			var shortUrl:String = "/postChat.php";
			var postChatUrl:String = "http://www.granttimmerman.com/postChat.php";
			var scriptLoader:URLLoader = new URLLoader();
			var scriptRequest:URLRequest;
			if(DEBUG){
				scriptRequest = new URLRequest(postChatUrl);
			} else {
				scriptRequest = new URLRequest(shortUrl);
			}
			var scriptVars:URLVariables = new URLVariables();
			scriptLoader.addEventListener(Event.COMPLETE, uploadSuccess);
			scriptLoader.addEventListener(IOErrorEvent.IO_ERROR, handleLoadError);
			scriptVars.username = usernameText;
			scriptVars.msg = msgText;
			scriptRequest.method = URLRequestMethod.POST;
			scriptRequest.data = scriptVars;
			scriptLoader.load(scriptRequest);
		}
		private function downloadSuccess(e:Event):void {
			//DOWNLOAD TXT FROM URL
			var loader:URLLoader = URLLoader(e.target);
			if(DEBUG){
				//out.htmlText = loader.data;
				out.htmlText = interpretText(loader.data);
			} else {
				out.htmlText = interpretText(loader.data);
			}
		}
		private function uploadSuccess(e:Event):void {
			//UPLOAD MESSAGE TO DB
			var loader:URLLoader = URLLoader(e.target);
			//trace("Success in upload");
			//trace(loader.data);
		}
		private function handleLoadError($evt:IOErrorEvent):void {
			trace("Message failed.");
		}
		public function submitMessage():void {
			//get input text
			usernameText = username.text;
			msgText = input.text;
			//Strip Slashes and Spaces
			usernameText = strip(usernameText);
			msgText = strip(msgText);
			//Replace if empty
			if(usernameText.length == 0){
				usernameText = defaultUsername;
			}
			if(msgText.length == 0){//ADD ERROR IN MESSAGES BOX NOT MSG BOX
				msgText = emptyMessage;
			}
			//Update text boxes
			username.text = usernameText;
			input.text = msgText;
			//fix text
			postChat();
		}
		private function strip(txt:String):String {
			var fixed:String = txt;
			fixed = fixed.replace(/^[ \t]+|[ \t]+$/,"");//trim white spaces
			fixed = fixed.replace(/([|]+)/,"");//replace unauthorized delimiters
			if(fixed.length>=2){
				if(fixed.substr(0,2)=="\r"){
					fixed.slice(2,fixed.length);
				}
			}
			return fixed;
		}
		private function dateFormat(date:Date):String {
			var answer:String = "";
			answer += date.fullYear;
			answer += "-";
			answer += twoDigits(date.monthUTC+1);
			answer += "-";
			answer += date.dateUTC;
			answer += " ";
			answer += twoDigits(date.hoursUTC);
			answer += ":";
			answer += twoDigits(date.minutesUTC);
			answer += ":";
			answer += twoDigits(date.secondsUTC);
			return answer;
		}
		private function twoDigits(num:uint):String {
			var answer:String = "";
			if(num<10){
				answer = "0"+String(num);
			}else {
				answer = String(num);
			}
			return answer;
		}
		private function interpretText(txt:String):String {
			var answer:String = "";
			var splitText:Array = new Array();
			var msgs:Array = new Array();
			var lastPos:uint = 0;
			for(var pos:uint = 0;pos<txt.length-9;pos++){//||START||
				if(txt.substr(pos,9)=="||START||"&&pos!=0){
					splitText.push(txt.substring(lastPos,pos));
					lastPos = pos;
				}
			}
			splitText.push(txt.substring(lastPos,txt.length));
			//messages
			for(var a:uint = 0;a<splitText.length;a++){
				msgs[a] = new Array();
				msgs[a] = splitText[a].split("||");
				msgs[a] = msgs[a].slice(2,6);
			}
			//rearrange 2d array to long string
			for(var b:uint = 0;b<msgs.length;b++){
				answer += "<b>"+msgs[b][1]+"</b>: "
				answer += msgs[b][2];
				if(b<msgs.length-1){
					answer += "\n";
				}
			}
			return answer;
		}
	}
}