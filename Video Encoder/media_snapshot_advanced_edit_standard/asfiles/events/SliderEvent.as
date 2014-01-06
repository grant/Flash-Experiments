package asfiles.events

{
	
	import flash.events.Event;
	
	public class SliderEvent extends Event 
	
	{
		
		public var value:Number;
			
		public static var CHANGE:String = "change";
		
		public function SliderEvent ( pEvent:String, pValue:Number )
		
		{
			
			super ( pEvent );
			
			value = pValue;
			
		}
		
	}
	
}