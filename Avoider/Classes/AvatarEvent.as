﻿package {
	import flash.events.Event;
	public class AvatarEvent extends Event {
		public static const DEAD:String = "dead";
		public function AvatarEvent(type:String) {
			super(type);
		}
	}
}