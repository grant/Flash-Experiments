package {
	import flash.display.MovieClip;

	import flash.display.LoaderInfo;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.system.Security;
	public class Main extends MovieClip {
		// Pull the API path from the FlashVars
		public var paramObj:Object=LoaderInfo(root.loaderInfo).parameters;
		// The API path. The "shadow" API will load if testing locally.
		public var apiPath:String = paramObj.kongregate_api_path ||
		  "http://www.kongregate.com/flash/API_AS3_Local.swf";
		public var request:URLRequest=new URLRequest(apiPath);
		public var loader:Loader = new Loader();
		// Kongregate API reference
		public var kongregate:*;
		// This function is called when loading is complete
		public function Main() {
			// Allow the API access to this SWF
			Security.allowDomain(apiPath);
			// Load the API
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			loader.load(request);
			this.addChild(loader);
		}
		private function loadComplete(event:Event):void {
			// Save Kongregate API reference
			kongregate=event.target.content;
			// Connect to the back-end
			kongregate.services.connect();
			var username:String = kongregate.services.getUsername();
			var user_id:Number = kongregate.services.getUserId();
			kongregate.stats.submit("test",1); // The user collected a coin
			textBox.text=String(username+"\n"+user_id+"\nSubmitted");
			// You can now access the API via:
			// kongregate.services
			// kongregate.user
			// kongregate.scores
			// kongregate.stats
			// etc...
		}
	}
}