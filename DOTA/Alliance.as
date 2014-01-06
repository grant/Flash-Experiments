//par:Game
package {
	import flash.display.MovieClip;
	public class Alliance extends MovieClip {
		private var idNumber:uint;
		private var color:String;
		public function Alliance(idNumber:uint,color:String) {
			this.idNumber = idNumber;
			this.color = color;
		}
		
		//
		//Getters
		//
		
		//gets the idNumber
		public function getIdNumber():uint {
			return idNumber;
		}
		
		//gets the color
		public function getColor():String {
			return color;
		}
	}
}