package  
{
	import flash.events.Event;
	public class AvatarEvent extends Event 
	{
		public static const DEAD:String = "dead";
		
		public function AvatarEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false ) 
		{ 
			super( type, bubbles, cancelable );
			
		} 
		
		public override function clone():Event 
		{ 
			return new AvatarEvent( type, bubbles, cancelable );
		} 
		
		public override function toString():String 
		{ 
			return formatToString( "AvatarEvent", "type", "bubbles", "cancelable", "eventPhase" ); 
		}
	}
}