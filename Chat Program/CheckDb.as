package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.navigateToURL;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	public class CheckDb extends MovieClip {
		//Get Chat
		private var url:String = "http://www.granttimmerman.com/getChat.php";
		private var scriptRequest:URLRequest = new URLRequest(url);
		private var scriptLoader:URLLoader = new URLLoader();
		private var scriptVars:URLVariables = new URLVariables();
		//Parent
		private var par:MovieClip;
		public function CheckDb():void {
			//Parent
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
			//UPLOAD
			scriptLoader.addEventListener(Event.COMPLETE, handleLoadSuccessful);
			scriptLoader.addEventListener(IOErrorEvent.IO_ERROR, handleLoadError);
			scriptVars.returns = "All";
			scriptRequest.method = URLRequestMethod.POST;
			scriptRequest.data = scriptVars;
			scriptLoader.load(scriptRequest);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function handleLoadSuccessful($evt:Event):void {
			var link:URLRequest = new URLRequest(url);
			
			//DOWNLOAD TXT FROM URL
			var loader:URLLoader = URLLoader($evt.target);
			par.updateMessages(loader.data);
			remove();
		}
		private function handleLoadError($evt:IOErrorEvent):void {
			par.postError();
			remove();
		}
		private function remove():void {
			par.removeChild(this);
		}
	}
}