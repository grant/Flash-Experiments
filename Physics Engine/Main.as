package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public function Main() {
			var group:Group = new Group(0,0,10,10,
										10,10,10,10
										);
			addChild(group);
		}
	}
}