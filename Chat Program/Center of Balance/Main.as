//first row and column don't work (sometimes)
package {
	import flash.display.MovieClip;
	public class Main extends MovieClip {
		private const PIECE_WIDTH = 50;
		private const PIECE_HEIGHT = 50;
		private var objects:Array;
		private var objectMap:Array;
		private var objectMapDisplay:MovieClip = new MovieClip();
		private var currObject:Array;
		private var cob:Object;
		private var cobDisplay:Cob;
		public function Main():void {
			createObjects();
			setCurrentObject(0);
			createObjectMap(6,5);
			displayObjectMap();
			displayCurrentObject();
			createCOB();
			setCOB();
			displayCOB();
		}
		//createObjects
		private function createObjects():void {
			objects = new Array();
			var currentObject:Array;
			
			currentObject = new Array();
			
			currentObject[0] = new Array(0,0,0,0,0,0);
			currentObject[1] = new Array(0,1,1,1,0,0);
			currentObject[2] = new Array(0,0,0,0,0,0);
			currentObject[3] = new Array(0,0,0,0,0,0);
			currentObject[4] = new Array(0,0,0,0,0,0);
			
			objects[0] = currentObject;
		}
		//setCurrentObject
		private function setCurrentObject(index:uint):void {
			currObject = objects[index];
		}
		//createObjectMap
		private function createObjectMap(wid:uint,hei:uint):void {
			objectMap = new Array();
			for(var a:uint = 0;a<hei;a++) {
				objectMap[a] = new Array();
				for(var b:uint = 0;b<wid;b++) {
					objectMap[a][b] = new Piece(b,a,PIECE_WIDTH,PIECE_HEIGHT,0);
					objectMapDisplay.addChild(objectMap[a][b]);
				}
			}
		}
		//displayObjectMap
		private function displayObjectMap():void {
			addChild(objectMapDisplay);
		}
		//displayCurrentObject
		private function displayCurrentObject():void {
			setMap(currObject);
		}
		//setMap
		private function setMap(obj:Array):void {
			for(var a:uint = 0;a<objectMap.length;a++) {
				for(var b:uint = 0;b<objectMap[0].length;b++) {
					objectMap[a][b].updateWeight(obj[a][b]);
				}
			}
		}
		//createCOB 
		private function createCOB():void {
			cob = new Object();
			cob.px = 0;
			cob.py = 0;
			cobDisplay = new Cob(cob.px,cob.py,PIECE_WIDTH,PIECE_HEIGHT);
		}
		//setCOB
		private function setCOB():void {
			//1. find total weights
			
			
			//weightY = weight per horizontal line
			var weightY:Array = new Array();
			for(var a:uint = 0;a<objectMap.length;a++) {
				var weightSumY:Number = 0;
				for(var b:uint = 0;b<objectMap[0].length;b++) {
					weightSumY+=objectMap[a][b].getWeight();
				}
				weightY.push(weightSumY);
			}
			
			//weightX = weight per vertical line
			var weightX:Array = new Array();
			for(var c:uint = 0;c<objectMap[0].length;c++) {
				var weightSumX:Number = 0;
				for(var d:uint = 0;d<objectMap.length;d++) {
					weightSumX+=objectMap[d][c].getWeight();
				}
				weightX.push(weightSumX);
			}
			
			//totalWeight
			var totalWeight:Number = 0;
			for (var index in weightY) {
				totalWeight += weightY[index];
			}
			var halfWeight:Number = totalWeight/2;
			
			//2. Find the COB
			var doneY:Boolean = false;
			var cobY:Number = 0;
			var currSumY:Number = 0;
			var prevSumY:Number = 0;
			var prevWeightY:uint = 0;
			var currWeightY:uint = prevWeightY;
			//doesn't work for 1. single column weights 2. 1st currSum > halfWeight on first try
			while(!doneY){
				currSumY+=weightY[currWeightY];
				//normal
				if(currSumY>halfWeight) {
					if(prevWeightY==0){//if over half on first try
						cobY = (currWeightY-1)+(halfWeight/currSumY);
					} else {
						var hei:Number = (currWeightY-prevWeightY);
						cobY = (prevWeightY-.5)+((totalWeight-prevSumY)/totalWeight)*hei;
					}
					doneY = true;
				}
				//singular column
				if(currSumY==totalWeight&&prevWeightY==0) {
					cobY = currWeightY-.5;
					doneY = true;
				}
				prevWeightY = (weightY[currWeightY]!=0)?currWeightY:prevWeightY;
				prevSumY = currSumY;
				currWeightY++;
			}
			cobY++;
			
			//cobX
			var doneX:Boolean = false;
			var cobX:Number = 0;
			var currSumX:Number = 0;
			var prevSumX:Number = 0;
			var prevWeightX:uint = 0;
			var currWeightX:uint = 0;
			//doesn't work for 1. single column weights 2. 1st currSum > halfWeight on first try
			while(!doneX){
				currSumX+=weightX[currWeightX];
				//normal
				if(currSumX>halfWeight) {
					if(prevWeightX==0){//if over half on first try
						cobX = (currWeightX-1)+(halfWeight/currSumX);
					} else {
						var wid:Number = (currWeightX-prevWeightX);
						cobX = (prevWeightX-.5)+((totalWeight-prevSumX)/totalWeight)*wid;
					}
					doneX = true;
				}
				//singular column
				if(currSumX==totalWeight&&prevWeightX==0) {
					cobX = currWeightX-.5;
					doneX = true;
				}
				prevWeightX = (weightX[currWeightX]!=0)?currWeightX:prevWeightX;
				prevSumX = currSumX;
				currWeightX++;
			}
			cobX++;
			
			cob.px = cobX;
			cob.py = cobY;
			
			cobDisplay.updatePosition(cob.px,cob.py);
		}
		//displayCOB
		private function displayCOB():void {
			objectMapDisplay.addChild(cobDisplay);
		}
	}
}