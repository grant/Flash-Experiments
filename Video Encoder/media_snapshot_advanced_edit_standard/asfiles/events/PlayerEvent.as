package asfiles.events

{
	
	import flash.events.Event;
	
	public class PlayerEvent extends Event 
	
	{
		
		public var time:Number;
		
		public static const ON_PROGRESS:String = "onProgress";
		
		public function PlayerEvent ( pEvent:String, pTime:Number )
		
		{
			
			super ( pEvent );
			
			time = pTime;
			
		}
		
	}
	
}