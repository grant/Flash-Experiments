package
{
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.system.Security;
    import flash.display.Loader;
    import flash.display.LoaderInfo;
 
    public class  Kong
    {
        private static var allowInstance:Boolean;
        private static var instance:Kong;
 
        private  static var kongregate:*;
        public static var inKong:Boolean;
 
        public function Kong(a:*, wrap:Boolean = false )
        {
            startTrue(a, wrap);
            if (!Kong.allowInstance)
            {
                throw new Error("USE KONG.START()");
            }
        }
 
        public static function start(a:*, wrap:Boolean = false ):void
        {
            if (kongregate == null)
            {
                Kong.allowInstance = true;
                Kong.instance = new Kong(a, wrap);
                Kong.allowInstance = false;
            }
 
        }
 
        private function startTrue(a:*, wrap:Boolean = false ):void
        {
            inKong = false;
            var allowed_site:String = "kongregate.com"
            var domain:String = a.root.loaderInfo.url.split("/")[2];
            var domain_idx:int = domain.indexOf(allowed_site);
            if (domain_idx != -1 && domain_idx == (domain.length - allowed_site.length))
            {
                inKong = true;
            }
            if (inKong)
            {
                if (wrap)
                {
                    var wrapper:DisplayObjectContainer = DisplayObjectContainer(a.parent).stage
                    var paramObj:Object = LoaderInfo(wrapper.loaderInfo).parameters;
                    var api_url:String = paramObj.kongregate_api_path || "http://www.kongregate.com/flash/API_AS3_Local.swf&amp;#8221";
                    Security.allowDomain(api_url);
                    var loader:Loader = new Loader();
                    loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                    loader.load( new URLRequest(api_url) );
                    wrapper.addChild(loader);
                } else
                {
                    paramObj = LoaderInfo((a as DisplayObject).root.loaderInfo).parameters;
                    api_url = paramObj.kongregate_api_path  || "http://www.kongregate.com/flash/API_AS3_Local.swf";
                    Security.allowDomain(api_url);
                    var request:URLRequest= new URLRequest ( api_url );
                    loader = new Loader();
                    loader.contentLoaderInfo.addEventListener ( Event.COMPLETE, loadComplete );
                    loader.load ( request );
                    a.addChild ( loader );
                }
            }
        }
 
        private function loadComplete ( event:Event ):void
        {
            kongregate = event.target.content;
            kongregate.services.connect();
        }
 
        public static function submit(table:String, amount:int):void
        {
            if(inKong)kongregate.stats.submit(table, amount);
        }
 
    }
 
}
