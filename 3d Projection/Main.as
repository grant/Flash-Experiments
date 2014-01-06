/*
To Do:

- Erase equasions
- Fix angle conversions

Summary:

- Evaluate correct X and Y positions of a point.
- Set up eye point
- Set new pane

Data:

Aspect Ratio (AR1,AR2): 3:2
Pane Width = 600 (from aspect ratio)
Pane Height = 400 (from aspect ratio)
View Angle Width (VAW) = 100 degrees
View Angle Height = 82 degrees = atan((AR2/2)/((AR1/2)*(VAW)))*2

Methodology:
- Set eye x,y,z point
- Set direction of eye | 3 degrees of rotation (YZ axis rotation is usually 0)(by another point:direction point)
  - find XY rotation only using X and Y
  - find YZ rotation ...
  - find XZ rotation ...
- Calculate view pane's top horizontal line in an equasion (but make it go through the eye point| same slope)
  - eye point satisfies the equasion
  - use direction point as a point perpendicular to line equasion
- Create less than or greater than symbol by plugging in the direction point

- for all points
  - check if it satifies the equasion
    - if it does then...
	- calculate X and Y based on direction equasion (rotation equasion) (angle is in relation to the normal XZ plane)
	  - x = ((eyeX-oldX)*cos(angle)-(eyeZ-oldZ)*sin(angle))+ eyeX
	  - Z = ((eyeX-oldX)*sin(angle)+(eyeZ-oldZ)*cos(angle))+ eyeZ
	- var pointZDis = eyeZ-Z
	- var pointXDis = eyeX-X
	- var paneWidth = pointZDis*tan(viewAngleWidth) (relative to the position where the point is)
	- var xProportion = (paneWidth-pointXDis)/paneWidth (value -.5 to .5)
	- var paneHeight = 
	

Links:

http://en.wikipedia.org/wiki/Rotation_(mathematics)
http://en.wikipedia.org/wiki/3D_projection
http://www.flashandmath.com/advanced/simple3d/math.html
*/
package {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		public const STAGE_WIDTH:uint = 900;
		public const STAGE_HEIGHT:uint = 600;
		//
		//Typical fov is 76:46 degrees
		private const horizontalViewAngle:Number = 50;//100 degrees X viewing (pane width)
		private var verticalViewAngle:Number;//pane height  Y view angle
		private const paneAspectRatio:Array = new Array(3,2);//3:2
		//X is Left/Right
		//Y is Up/Down
		//Z is In/Out
		public var eye:Array = new Array(0,0,0);
		public var target:Array = new Array(1,0,0);//does nothing yet (used to direct the camera to a cetain position
		public var points:Array = new Array();//new Array(new Array(0,0,1),new Array(0,1,1),new Array(0,1,2),new Array(0,0,2));
		//in front is (0,0,1)
		
		public var polygons:Array = new Array();//new Array(new Array(new Array(0,0,1),new Array(0,1,1),new Array(0,1,2),new Array(0,0,2)));	
		public var targetEquasion:Array = new Array();//parametic form (not cartesian form) line from eye to target
		//Rotations 0-359 (Think of rotations like a cannon) (Roll is rotating the camera in the same direction)
		//Eye
		public var eyeDirectionRot:Number = 0;//0 = (1,0,0) (Yaw)
		public var eyeRiseRot:Number = 0;//0 = (0,1,0) (Pitch) (90 to -90) Positive = up
		public var eyeRollRot:Number = 0;//0 = (0,0,1) (Roll) Commonly 0; Plane perpendicular to targetEquasion
		//EyeEdges
		public var eyeLeftRot:Number;
		public var eyeRightRot:Number;
		public var eyeUpRot:Number;
		public var eyeDownRot:Number;
		//MovieClip Holder
		public var pointList:Array;
		public var polygonList:Array;
		public function Main():void {
			var spacing:uint = 10;
			var mult:uint = 3;
			for(var i:uint = 0;i<mult;i++){
				for(var j:uint = 0;j<mult;j++){
					for(var k:uint = 0;k<mult;k++){
						points[points.length] = new Array(i*spacing,j*spacing,k*spacing);
					}
				}
			}
			//trace(points);
			calculateVerticalViewAngle();
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			pointList = new Array();
			polygonList = new Array();
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onDown);
			//stage.addEventListener(KeyboardEvent.KEY_UP,onUp);
			addEventListener(Event.ENTER_FRAME,onLoop);
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onLoop(e:Event):void {
			xyz.text = eye[0]+","+eye[1]+","+eye[2];
			rot.text = eyeDirectionRot+","+eyeRiseRot+","+eyeRollRot;
			//remove points
			for(var a:uint = 0;a<pointList.length;a++){
				if(pointList[a]!=undefined){
					pointList[a].remove();
				}
			}
			//remove polygons
			for(var b:uint = 0;b<polygonList.length;b++){
				if(polygonList[b]!=undefined){
					polygonList[b].remove();
				}
			}
			findRotations();
			targetEquasion = find3dLineEquasion(eye,target);//array of c values,array of slopes
			findPointsXY();
			findPolygonsXY();
		}
		private function onDown(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 38://up
					eyeRiseRot = rotate(eyeRiseRot,1,5);
					break;
				case 37://left
					eyeDirectionRot = rotate(eyeDirectionRot,-1,5);
					break;
				case 40://down
					eyeRiseRot = rotate(eyeRiseRot,-1,5);
					break;
				case 39://right
					eyeDirectionRot = rotate(eyeDirectionRot,1,5);
					break;
				case 87://w
					eye[2] += 5;
					break;
				case 65://a
					eye[0] -= 5;
					break;
				case 83://s
					eye[2] -= 5;
					break;
				case 68://d
					eye[0] += 5;
					break;
				case 81://q
					eye[1] -= 5;
					break;
				case 69://e
					eye[1] += 5;
					break;
			}
		}
		private function calculateVerticalViewAngle():void {
			var distanceToPaneCenter:Number = (paneAspectRatio[0]/2)/Math.tan(toRadians(horizontalViewAngle/2));
			verticalViewAngle = toDegrees(2*(Math.atan((paneAspectRatio[1]/2)/distanceToPaneCenter)));
		}
		private function findRotations():void {
			eyeLeftRot = rotate(eyeDirectionRot,-1,horizontalViewAngle/2);
			eyeRightRot = rotate(eyeDirectionRot,1,horizontalViewAngle/2);
			eyeUpRot = rotate(eyeRiseRot,1,verticalViewAngle/2);
			eyeDownRot = rotate(eyeRiseRot,-1,verticalViewAngle/2);
		}
		private function findPointsXY():void {
			for(var a:uint = 0;a<points.length;a++){//for all points
				var pxy:Array = findXY(points[a][0],points[a][1],points[a][2]);
				var dis:Number = Math.sqrt((points[a][0]-eye[0])^2+(points[a][1]-eye[1])^2+(points[a][2]-eye[2])^2);
				if(pxy.length==2){
					pointList.push(new Dot(pxy[0],pxy[1],dis));
					addChild(pointList[pointList.length-1]);
				}
			}
		}
		private function findPolygonsXY():void {
			for(var a:uint = 0;a<polygons.length;a++){//for all pongons
				var works:Boolean = true;
				var points:Array = new Array();
				for(var b:uint = 0;b<polygons[a].length;b++){//for all points on the polygon
					points[b] = findXY(polygons[a][b][0],polygons[a][b][1],polygons[a][b][2]);
					if(points[b].length!=2){
						works = false;
					}
				}
				if(works){
					var bitmap:Array = new Array();
					bitmap[0] = new Array(0x000000,0x333333);
					bitmap[1] = new Array(0x999999,0xCCCCCC);
					
					polygonList.push(new Polygon(bitmap,points[0],points[1],points[2],points[3]));
					addChild(polygonList[polygonList.length-1]);
				}
			}
		}
		private function findXY(px:Number,py:Number,pz:Number):Array {
			var xy:Array = new Array();
			//relative distances
			var xdis:Number = px-eye[0];
			var ydis:Number = py-eye[1];
			var zdis:Number = pz-eye[2];
			//Pythagorean's Theorm
			var distance:Number = Math.sqrt((xdis*xdis)+(ydis*ydis)+(zdis*zdis));
			var horizontalDistance:Number = Math.sqrt((xdis*xdis)+(zdis*zdis));
				
			var pointDirectionRot:Number = calcDirectionAngle(eye[0],px,eye[2],pz);
			var pointRiseRot:Number = calcRiseAngle(horizontalDistance,ydis,side(eyeDirectionRot,pointDirectionRot));
				
			var range:Array = inRange(eyeLeftRot,eyeRightRot,eyeUpRot,eyeDownRot,pointDirectionRot,pointRiseRot);
				
			if(range.length==2){//if the point is in range
				xy[0] = range[0]*STAGE_WIDTH;
				xy[1] = Math.abs((range[1]*STAGE_HEIGHT)-STAGE_HEIGHT);//b/c non-cartesian coordinate system
			}
			return xy;
		}
		//calcDirectionAngle
		private function calcDirectionAngle(a1:Number,a2:Number,b1:Number,b2:Number):Number{
			//a1 = eye x
			//a2 = pt x
			//b1 = eye y
			//b2 = pt y
			var answer:Number;
			
			var aDiff:Number = a2-a1;
			var bDiff:Number = b2-b1;
			if(aDiff>0&&bDiff>0){//1-89
				answer = Math.atan(aDiff/bDiff);
			} else if(aDiff>0&&bDiff<0){//91-179
				answer = Math.atan(bDiff/aDiff)+90;
			} else if(aDiff<0&&bDiff<0){//181-269
				answer = Math.atan(aDiff/bDiff)+180;
			} else if(aDiff<0&&bDiff>0){//271-359
				answer = Math.atan(bDiff/aDiff)+270;
			} else if(aDiff==0&&bDiff>0){//0
				answer = 0;
			} else if(aDiff>0&&bDiff==0){//90
				answer = toRadians(90);
			} else if(aDiff==0&&bDiff<0){//180
				answer = toRadians(180);
			} else if(aDiff<0&&bDiff==0){//270
				answer = toRadians(270);
			} else if(aDiff==0&&bDiff==0){//same point
				answer = 0;//default = 0
			}
			answer = toDegrees(answer);
			
			return answer;
		}
		//calcRiseAngle
		private function calcRiseAngle(adj:Number,opp:Number,onSide:Boolean):Number {
			var riseRot:Number;
			if(opp==0){
				riseRot = 0;
			} else if(opp<0){//negative
				if(eyeDownRot<270&&eyeDownRot>90&&!onSide){
					riseRot = toDegrees(Math.atan(Math.abs(opp)/adj));
					riseRot = riseRot+180;
				} else {
					riseRot = -1*toDegrees(Math.atan(Math.abs(opp)/adj));
				}
			} else if(opp>0){//positive
				if(eyeUpRot>90&&eyeUpRot<270&&!onSide){
					riseRot = toDegrees(Math.atan(Math.abs(opp)/adj));
					riseRot = 180-riseRot;
				} else {
					riseRot = toDegrees(Math.atan(Math.abs(opp)/adj));
				}
			}
			return rotate(riseRot,1,0);
		}
		//side
		private function side(eyeDir:Number,ptDir:Number):Boolean {
			var side:Boolean = false;
			if(eyeDir<90){
				if(ptDir<=eyeDir+90||ptDir>=eyeDir+270){
					side = true;
				}
			} else if(eyeDir>270){
				if(ptDir>=eyeDir-90||ptDir<=eyeDir-270){
					side = true;
				}
			} else {
				if(ptDir<=eyeDir+90&&ptDir>=eyeDir-90){
					side = true;
				}
			}
			return side;
		}
		//ect...
		private function find3dLineEquasion(pt1:Array,pt2:Array):Array{
			var equasion:Array = new Array();
			var vector:Array = new Array(pt2[0]-pt1[0],pt2[1]-pt1[1],pt2[2]-pt1[2]);
			equasion[0] = pt1;
			equasion[1] = vector;
			return equasion;
		}
		private function getCoordinatesHaveX(px:Number,equasion:Array):Array {
			var coordinates = new Array();
			var t:Number = (px-equasion[0][0])/equasion[1][0];
			coordinates[0] = px;
			coordinates[1] = equasion[0][1]+(t*equasion[1][1]);
			coordinates[2] = equasion[0][2]+(t*equasion[1][2]);
			return coordinates;
		}
		private function getCoordinatesHaveY(py:Number,equasion:Array):Array {
			var coordinates = new Array();
			var t:Number = (py-equasion[0][1])/equasion[1][1];
			coordinates[0] = equasion[0][0]+(t*equasion[1][0]);
			coordinates[1] = py;
			coordinates[2] = equasion[0][2]+(t*equasion[1][2]);
			return coordinates;
		}
		private function getCoordinatesHaveZ(pz:Number,equasion:Array):Array {
			var coordinates = new Array();
			var t:Number = (pz-equasion[0][2])/equasion[1][2];
			coordinates[0] = equasion[0][0]+(t*equasion[1][0]);
			coordinates[1] = equasion[0][1]+(t*equasion[1][1]);
			coordinates[2] = pz;
			return coordinates;
		}
		//rotate
		private function rotate(current:Number,dir:int,amount:Number):Number {
			var answer:Number = current+(dir*amount);
			while(answer<0){
				answer+=360;
			}
			while(answer>=360){
				answer-=360;
			}
			return answer;
		}
		//inRange
		private function inRange(leftRot:Number,rightRot:Number,topRot:Number,bottomRot:Number,pointDirectionRot:Number,pointRiseRot:Number):Array {
			var answer:Array = new Array();
			var pointRiseRange:Number = betweenDegrees(pointRiseRot,bottomRot,topRot,verticalViewAngle);
			if(pointRiseRange!=1000){//vertical test
				answer[1] = pointRiseRange;
				var pointDirectionRange:Number = betweenDegrees(pointDirectionRot,leftRot,rightRot,horizontalViewAngle);
				//trace(leftRot,rightRot,horizontalViewAngle);
				if(pointDirectionRange,leftRot,rightRot!=1000){
					answer[0] = pointDirectionRange;
				}
			}
			return answer;
		}
		//betweenSmallBig
		private function betweenSmallBig(testerRot:Number,small:Number,big:Number):Boolean {
			if(testerRot>=small && testerRot<=big){
				return true;
			} else {
				return false;
			}
		}
		//betweenDegrees
		private function betweenDegrees(testerRot:Number,rot1:Number,rot2:Number,viewAngle:Number):Number {
			var answer:Number;
			if(rot1>rot2){//passes through 0
				if(testerRot>rot1){//if on rot1-360 side
					answer = (testerRot-rot1)/viewAngle;
				} else {
					answer = (360-rot1+testerRot)/viewAngle;
				}
			} else {
				answer = (testerRot-rot1)/viewAngle;
			}
			if(answer > 1){
				answer = 1000;
			}
			return answer;
		}
		//toRadians
		private function toRadians(number:Number):Number {
			return 0.0174532925*number;
		}
		//toDegrees
		private function toDegrees(number:Number):Number {
			return 57.2957795*number;
		}
	}
}

/*
var bitmap:Array = new Array();
			bitmap[0] = new Array(0x000000,0x333333);
			bitmap[1] = new Array(0x999999,0xCCCCCC);
			var p1:Array = new Array(100,100);
			var p2:Array = new Array(200,100);
			var p3:Array = new Array(200,200);
			var p4:Array = new Array(100,200);
			for(var i:uint = 0;i<100000;i++){
				var poly:Polygon = new Polygon(bitmap,new Array((Math.random()*550),(Math.random()*400)),new Array((Math.random()*550),(Math.random()*400)),new Array((Math.random()*550),(Math.random()*400)),new Array((Math.random()*550),(Math.random()*400)));
				addChild(poly);
			}
			*/