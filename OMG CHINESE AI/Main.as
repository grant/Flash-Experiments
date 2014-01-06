/*
To Do:

More IM chat-like conversation (reply based on time)
Improve Graphics
Change Arrays to Vectors
Rebuff IME search
Sort Chinese characters by most used first
Add reply to AI
Check if character exsist in limited database for replies
Able to select lessons
Pinyin tone markers are not on the right spot (check book, and check online for rules)

*/
package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		private var app:Application = new Application();
		public function Main():void {
			addChild(app);
		}
	}
}