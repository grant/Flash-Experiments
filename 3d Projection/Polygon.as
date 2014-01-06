package {
	import flash.display.MovieClip;
	import flash.display.Shape;
	public class Polygon extends MovieClip{
		private var bitmap:Array = new Array();
		private var pixels:Array = new Array();
		private var pixelMap:Array;
		public function Polygon(bm:Array,p1:Array,p2:Array,p3:Array,p4:Array) {
			bitmap = bm;
			//Edges and Pixel Map//
			fillEdges(p1,p2,p3,p4);
			//Render Pixels
			renderPixels();
		}
		//fillEdges (4 points)
		private function fillEdges(p1:Array,p2:Array,p3:Array,p4:Array):void {
			//Edges
			//p1p2Edge
			var p1p2Edge:Array = new Array();
			var p1p2Dis:Array = new Array(p1[0]-p2[0],p1[1]-p2[1]);
			var p1p2PartialDis:Array = new Array(p1p2Dis[0]/bitmap[0].length,p1p2Dis[1]/bitmap[0].length);//distance to the first bitmap point
			for(var a:uint = 0;a<bitmap[0].length+1;a++){
				p1p2Edge[a] = new Array(p1[0]-(p1p2PartialDis[0]*a),p1[1]-(p1p2PartialDis[1]*a));
			}
			//p2p3Edge
			var p2p3Edge:Array = new Array();
			var p2p3Dis:Array = new Array(p2[0]-p3[0],p2[1]-p3[1]);
			var p2p3PartialDis:Array = new Array(p2p3Dis[0]/bitmap.length,p2p3Dis[1]/bitmap.length);//distance to the first bitmap point
			for(var b:uint = 0;b<bitmap.length+1;b++){
				p2p3Edge[b] = new Array(p2[0]-(p2p3PartialDis[0]*b),p2[1]-(p2p3PartialDis[1]*b));
			}
			//p3p4Edge
			var p3p4Edge:Array = new Array();
			var p3p4Dis:Array = new Array(p4[0]-p3[0],p4[1]-p3[1]);
			var p3p4PartialDis:Array = new Array(p3p4Dis[0]/bitmap[0].length,p3p4Dis[1]/bitmap[0].length);//distance to the first bitmap point
			for(var c:uint = 0;c<bitmap[0].length+1;c++){
				p3p4Edge[c] = new Array(p4[0]-(p3p4PartialDis[0]*c),p4[1]-(p3p4PartialDis[1]*c));
			}
			//p4p1Edge
			var p4p1Edge:Array = new Array();
			var p4p1Dis:Array = new Array(p1[0]-p4[0],p1[1]-p4[1]);
			var p4p1PartialDis:Array = new Array(p4p1Dis[0]/bitmap.length,p4p1Dis[1]/bitmap.length);//distance to the first bitmap point
			for(var d:uint = 0;d<bitmap.length+1;d++){
				p4p1Edge[d] = new Array(p1[0]-(p4p1PartialDis[0]*d),p1[1]-(p4p1PartialDis[1]*d));
			}
			//Fill Pixel Map Points//
			fillMap(p1p2Edge,p2p3Edge,p3p4Edge,p4p1Edge);
		}
		//fillMap (4 points)
		private function fillMap(e1:Array,e2:Array,e3:Array,e4:Array){
			pixelMap = new Array();
			for(var a:uint = 0;a<e2.length;a++){//vertical pts
				pixelMap[a] = new Array();
				var e4pt:Array = new Array(e4[a][0],e4[a][1]);//left
				var e2pt:Array = new Array(e2[a][0],e2[a][1]);//right
				var dis:Array = new Array(e2[a][0]-e4[a][0],e2[a][1]-e4[a][1]);
				var partialDis:Array = new Array(dis[0]/bitmap[0].length,dis[1]/bitmap[0].length);//distance to the first bitmap point
				for(var b:uint = 0;b<e1.length;b++){//horizontal pts
					pixelMap[a][b] = new Array(e4pt[0]+(partialDis[0]*b),e4pt[1]+(partialDis[1]*b));
				}
			}
		}
		//renderPixels
		private function renderPixels():void {
			for(var a:uint = 0;a<pixelMap.length-1;a++){//vertical
				pixels[a] = new Array();
				for(var b:uint = 0;b<pixelMap[0].length-1;b++){//horizontal
					pixels[a][b] = new Shape();
					pixels[a][b].graphics.beginFill(bitmap[a][b]);
					pixels[a][b].graphics.moveTo(pixelMap[a][b][0],pixelMap[a][b][1]);
					pixels[a][b].graphics.lineTo(pixelMap[a+1][b][0],pixelMap[a+1][b][1]);
					pixels[a][b].graphics.lineTo(pixelMap[a+1][b+1][0],pixelMap[a+1][b+1][1]);
					pixels[a][b].graphics.lineTo(pixelMap[a][b+1][0],pixelMap[a][b+1][1]);
					pixels[a][b].graphics.endFill();
					addChild(pixels[a][b]);
				}
			}
		}
		public function remove():void {
			this.visible = false;
		}
	}
}