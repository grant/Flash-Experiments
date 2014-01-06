package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class PieSlice extends MovieClip {
		private const moveEase:uint = 4;//larger = more ease
		private var xDes:uint;//Des = destination
		private var yDes:uint;
		private var xClick:uint;
		private var yClick:uint;
		private var averageAngle:uint;
		public function PieSlice(colorNumber:uint,startAngle:uint,endAngle:uint){
			x = 100;
			y = 100;
			averageAngle = (startAngle+endAngle)/2;
			for(var i = startAngle;i<endAngle;i++){
				var slice:Slice = new Slice(colorNumber,i);
				addChild(slice);
			}
			addEventListener(MouseEvent.MOUSE_DOWN,mouseIsDown);
		}
		/*
		Note:
		Next feature to be added: Able to drag pie slice and drag out. Like the Apple Ipad.
		Find grabbing point.
		If dis between x grabbing pt and center is smaller, then x = mouseX -grabbing pt
		else do opposite.
		The opposite value that is chosen is deturmined by trigonometry
		you need to know the: averageAngle and x or y pos
		*/
		/*
		Summary:
		1st checks if this is clicked
		2nd sets the destined x and y
		3rd moves the x and y
		4th checks if mouse is up, then stop setting the destined x and y, BUT STILL MOVE THE X AND Y
		*/
		public function mouseIsDown(e:MouseEvent):void {
			xClick = stage.mouseX-x;//pos relative to pie slice
			yClick = stage.mouseY-y;//^same^
			addEventListener(Event.ENTER_FRAME,setDes);
			addEventListener(Event.ENTER_FRAME,movePos);
			stage.addEventListener(MouseEvent.MOUSE_UP,mouseIsUp);
		}
		public function setDes(e:Event):void {
			xDes = stage.mouseX-xClick;//so destinataion is same as EXACT POSITION where clicked on slice
			yDes = stage.mouseY-yClick;//^same^
		}
		public function movePos(e:Event):void {
			x += (xDes-x)/moveEase;
			y += (yDes-y)/moveEase;
		}
		public function mouseIsUp(e:MouseEvent):void {
			removeEventListener(Event.ENTER_FRAME,setDes);
		}
	}
}