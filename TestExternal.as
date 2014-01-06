package {
	import flash.display.MovieClip;
	public class TestExternal extends MovieClip {
		public var bullet:BulletClass;
		public function TestExternal() {
			bullet = new BulletClass;
			bullet.x = 100;
			bullet.y = 200;
			addChild(bullet);
		}
	}
}