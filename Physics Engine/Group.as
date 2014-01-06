package {
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.geom.Rectangle;
	public class Group extends MovieClip {
		//internal changeables
		private const fillColor:uint=0x000000;
		//given args
		private var arg:Array = new Array();
		//internal vars
		public var totalMass:uint=0
		public var cob:Array=new Array();
		public function Group(... args):void {
			for(var a:uint = 0;a<args.length;a++){
				arg[a] = args[a];
			}
			begin();
		}
		private function begin():void {
			if (arg.length%4==0) {
				addRects();
				calcCob();
			}
		}
		private function addRects():void {
			var numberOfRects:uint=arg.length/4;
			var group:Shape=new Shape  ;
			for (var a:uint=0; a<numberOfRects; a++) {
				//get x, y, wid, hei
				var xPos:uint=arg[a*4];
				var yPos:uint=arg[a*4+1];
				var wid:uint=arg[a*4+2];
				var hei:uint=arg[a*4+3];
				var mass:uint = wid*hei;
				//add to total mass
				totalMass += mass;
				//add Shape graphicially
				group.graphics.beginFill(fillColor);
				group.graphics.drawRect(xPos,yPos,wid,hei);
				group.graphics.endFill();
				//add x COB, y COB, and mass in an array
				cob[a]=new Array();
				cob[a][0]=xPos+wid/2;
				cob[a][1]=yPos+hei/2;
				cob[a][2]=wid*hei;
			}
			addChild(group);
		}
		private function calcCob():void {
			var temp:Number=0;
			for(var a:uint=0;a<numberOfRects;a++){
				temp+=cob[a][0]
			}
			(1/totalMass)(
		}
	}
}