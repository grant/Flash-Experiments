package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Projectile extends MovieClip {
		private const gravity:Number = 1;
		private const speed:Number = .5;
		private var xs:Number = 0;
		private var ys:Number = 0;
		public function Projectile(px:uint,py:uint):void {
			x = px;
			y = py;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			addEventListener(Event.ENTER_FRAME,update);
			stage.addEventListener(MouseEvent.MOUSE_UP,mouseIsUp);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function mouseIsUp(e:MouseEvent):void {
			xs= (stage.mouseX-x)*speed;
			ys = (stage.mouseY-y)*speed;
			addEventListener(Event.ENTER_FRAME,updateMove);
			removeEventListener(Event.ENTER_FRAME,update);
			stage.removeEventListener(MouseEvent.MOUSE_UP,mouseIsUp);
		}
		private function update(e:Event):void {
			var myRadians:Number = Math.atan2(stage.mouseY-y, stage.mouseX-x);
			var myDegrees:Number = Math.round((myRadians*180/Math.PI))+90;
			rotation = myDegrees;
			if(stage.mouseX-x==0){
				rotation = 0;
			}
		}
		private function updateMove(e:Event):void {
			ys += gravity;
			x += xs;
			y += ys;
			rotation += xs;
			//ground
			if(y> stage.stageHeight){
				ys = -Math.abs(ys);
				y = stage.stageHeight;//-(height/2);
			}
			MovieClip(parent.parent).dots.addChild(new Dot(x,y));
			/*
			//top
			if(y-(height/2)<0){
				ys = Math.abs(ys);
				y = 0+(height/2);
			}
			//left
			if(x+(width/2)<0){
				xs = Math.abs(xs);
				x = 0 +(width/2);
			}
			//right
			if(x-(width/2)>stage.stageWidth){
				xs = -Math.abs(xs);
				x = stage.stageWidth-(width/2);
			}
			*/
		}
	}
}