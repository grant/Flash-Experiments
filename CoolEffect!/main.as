package {
	import flash.display.Sprite;
	public class main extends Sprite {
		private const xAmount:uint = 50;
		private const yAmount:uint = 50;
		private const blockWidth:int = 9;
		private const blockHeight:int = 9;
		//maxDis: Distance from center (where mouse is) to corner of the blocks
		public const maxDisOffset:int = 10;//this makes the edges not as slow
		public const maxDis:Number = Math.sqrt((((xAmount/2)*blockWidth)*((xAmount/2)*blockWidth))+(((yAmount/2)*blockHeight)*((yAmount/2)*blockHeight)))+maxDisOffset;
		public function main() {
			for(var a = 0; a < xAmount; a++){
				var xPos:int = (a*blockWidth)-(blockWidth*xAmount/2)+(blockWidth/2);
				for(var b = 0; b < yAmount; b++){
					var yPos:int = (b*blockHeight)-(blockHeight*yAmount/2)+(blockHeight/2);
					var block:Block = new Block(blockWidth,blockHeight,xPos,yPos);
					addChild(block);
				}
			}
		}
	}
}