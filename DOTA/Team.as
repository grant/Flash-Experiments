package {
	import flash.display.MovieClip;
	public class Team extends MovieClip {
		private var idNumber:uint;
		private var displayName:String;
		private var allianceId:uint;
		public function Team(idNumber:uint,displayName:String,allianceId:uint):void {
			this.idNumber = idNumber;
			this.displayName = displayName;
			this.allianceId = allianceId;
		}
		
		//
		//Getters
		//
		
		//gets the id number
		public function getIdNumber():int {
			return idNumber;
		}
		
		//gets the display name
		public function getDisplayName():String {
			return displayName;
		}
		
		//gets the alliance id
		public function getAllianceId():uint {
			return allianceId;
		}
	}
}