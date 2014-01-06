package asfiles.events

{
	
	import flash.events.Event;
	
	public class MetaEvent extends Event 
	
	{
		
		public var meta:Object;
		
		public static const ON_META:String = "onMetaData";
		
		public function MetaEvent ( pEvent:String, pMeta:Object )
		
		{
			
			super ( pEvent );
			
			meta = pMeta;
			
		}
		
	}
	
}