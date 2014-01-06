//par:Main

//structure:
//game->alliance
//alliance->team
package {
	import flash.display.MovieClip;
	public class Game extends MovieClip {
		private var alliances:Array;//sets groups of teams. Each team in a group is peaceful to teams in the same alliance, but against teams of different alliances. Organized by WHO'S AGAINST WHO
		private var teams:Array;//A group of gameObjects controlled by a single person/AI. (ex. Player 1, Player 2, neutral, AI 1, AI 2), organized by WHO CAN CONTROL
		public function Game():void {
			setAlliances();
			setTeams();
		}
		
		//
		//Setters
		//
		
		//sets up the alliances
		private function setAlliances():void {
			alliances = new Array();
			alliances[0] = new Alliance(00,"red");
			alliances[1] = new Alliance(01,"blue");
			alliances[2] = new Alliance(02,"black");
		}
		
		//sets up the teams
		private function setTeams():void {
			teams = new Array();
			teams[0] = new Team(00,"Player 1",getAllianceId("red"));
			teams[1] = new Team(01,"Player 2",getAllianceId("blue"));
			teams[2] = new Team(02,"Neutral",getAllianceId("black"));
			teams[3] = new Team(03,"AI 1",getAllianceId("red"));
			teams[4] = new Team(04,"AI 2",getAllianceId("blue"));
		}
		
		//
		//Getters
		//
		
		//gets the id of an alliance from the color
		//return: id or -1
		private function getAllianceId(color:String) {
			var id:int = -1;
			var i:int = 0;
			while(id==-1&&i!=alliances.length) {
				if(alliances[i].getColor()==color) {
					id = i;
				}
				i++;
			}
			return id;
		}
	}
}