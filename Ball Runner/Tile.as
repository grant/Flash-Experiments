//par1:Holder
//par2:DisplayMap
//desc:A display of a map tile
package {
	import flash.display.MovieClip;
	public class Tile extends MovieClip {
		//variables
		private var id:uint;//id and frame number
		private var px:uint;//x position on displayMap
		private var py:uint;//y position on displayMap
		private var wid:uint;//width of tile
		private var hei:uint;//height of tile
		public function Tile(id:uint,px:uint,py:uint,wid:uint,hei:uint):void {
			this.id = id;
			this.px = px;
			this.py = py;
			this.wid = wid;
			this.hei = hei;
			//
			gotoAndStop(id);
			x = px;
			y = py;
			width = wid;
			height = hei;
		}
		
		//toString
		public override function toString():String {
			return "Tile: id:"+id+
						 " x:"+px+
						 " y:"+py+
					  " wid:"+wid+
					  " hei:"+hei;
		}
	}
}