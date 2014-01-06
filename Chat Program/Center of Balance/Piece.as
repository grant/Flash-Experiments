package {
	import flash.display.MovieClip;
	public class Piece extends MovieClip {
		private var px:uint;
		private var py:uint;
		private var wid:uint;
		private var hei:uint;
		private var weight:Number;
		public function Piece(px:uint,py:uint,wid:uint,hei:uint,weight:Number):void {
			this.px = px;
			this.py = py;
			this.wid = wid;
			this.hei = hei;
			this.weight = weight;
			weight_text.selectable = false;
			updatePosition();
			updateText();
		}
		private function updatePosition():void {
			x = px*width;
			y = py*height;
		}
		private function updateText():void {
			weight_text.text = String(weight);
		}
		public function updateWeight(amount:uint):void {
			weight = amount;
			updateText();
		}
		public function getWeight():Number {
			return weight;
		}
	}
}