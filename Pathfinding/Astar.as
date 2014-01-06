//http://www.policyalmanac.org/games/aStarTutorial.htm
package {
	import flash.display.MovieClip;
	public class Astar extends MovieClip {
		//construction parameters
		//start
		private var x1:uint;
		private var y1:uint;
		//end
		private var x2:uint;
		private var y2:uint;
		//map
		private var map:Array;

		//pathfinding variables

		//openNodes
		private var openNodes:Array = new Array();
		//clodesNodes
		private var closedNodes:Array = new Array();
		//currentNode
		private var currentNode:Array = new Array();
		//organization:
		//element:
		//[0] parent x (-1 if no parent)
		//[1] parent y (-1 if no parent)
		//[2] x
		//[3] y
		//[4] G = movement distance from tile to parent tile (10 for orthogonal movment, 14 for diagonal movement)
		//[5] H = Manhattan distance from node to end tile (vertical and horizontal disance only, Math.abs(x2-x1)+Math.abs(y2-y1))
		//[6] F = G + H

		public function Astar(map:Array):void {
			this.map=map;
		}
		public function getPath(x1:uint,y1:uint,x2:uint,y2:uint):Array {
			//set parameters
			this.x1=x1;
			this.y1=y1;
			this.x2=x2;
			this.y2=y2;

			//set methods//
			var path:Array = new Array();

			//update the current node
			currentNode[0]=-1;
			currentNode[1]=-1;
			currentNode[2]=x1;
			currentNode[3]=y1;
			currentNode[4]=0;
			currentNode[5]=0;
			currentNode[6]=0;

			//add starting position to closed list
			closedNodes.push(currentNode);


			//for (var i:uint = 0; i<2; i++) {

				//add 8 adjacent nodes
				for (var px:int = -1; px<2; px++) {
					for (var py:int = -1; py<2; py++) {
						var cx:int=currentNode[2]+px;
						var cy:int=currentNode[3]+py;
						//current = the current node
						//"current" = the current adjacent node
						if (cy>=0&&cx>=0) {//if the "current" node is on the map
							var closedIndex:int=findClosed(cx,cy);//index in the closedNodes array
							if (map[cy][cx]==0&&closedIndex==-1) {//if the "current" node is walkable
								if (!(cx==0&&cy==0)) {//if not the current node
									var openIndex:int=findOpen(cx,cy);//index in the openNodes array
									var cnx:uint=currentNode[2];//current node x
									var cny:uint=currentNode[3];//current node y
									var nodeGHF:Array=findGHF(new Array(cnx,cny,cx,cy));//"current" node GHF
									var thisNode:Array=new Array(cnx,cny,cx,cy,nodeGHF[0],nodeGHF[1],nodeGHF[2]);
									if (openIndex!=-1) {//if the "current" node exists
										//find the current g costs to the start node
										var currentGCost:uint=getGCost(openNodes[openIndex]);
										var thisGCost:uint=getGCost(thisNode);
										if (thisGCost<currentGCost) {
											replace(thisNode,"open",openIndex);
										}
									} else {//if the "current" node doesn't exist
										openNodes.push(thisNode);
									}
								}
							}
						}
					}
				}

				//update current node
				currentNode=openNodes[0];
				for (var a:uint = 1; a<openNodes.length; a++) {
					if (openNodes[a][6]<currentNode[6]) {
						currentNode=openNodes[a];
					}
				}

				openNodes.splice(findOpen(currentNode[2],currentNode[3]),1);
				closedNodes.push(currentNode);
			//}

			trace("Open Nodes");
			print_r(openNodes);
			trace("Closed Nodes");
			print_r(closedNodes);
			//path.push(currentNode[2],currentNode[3]);

			//print_r(openNodes);
			return path;
		}
		//findClosed
		private function findClosed(x1:uint,y1:uint):int {
			var answer:int=-1;
			for (var a:uint = 0; a<closedNodes.length; a++) {
				if (closedNodes[a][2]==x1&&closedNodes[a][3]==y1) {
					answer=a;
				}
			}
			return answer;
		}
		//findOpen
		private function findOpen(x1:uint,y1:uint):int {
			var answer:int=-1;
			for (var a:uint = 0; a<openNodes.length; a++) {
				if (openNodes[a][2]==x1&&openNodes[a][3]==y1) {
					answer=a;
				}
			}
			return answer;
		}
		//findGHF
		private function findGHF(node:Array):Array {
			var ghf:Array = new Array();
			ghf[0] = (Math.abs((node[0]-node[2])+(node[1]-node[3]))==1)?10:14;
			ghf[1] = (Math.abs(x2-node[2])+Math.abs(y2-node[3]))*10;
			ghf[2]=ghf[0]+ghf[1];
			return ghf;
		}
		//print_r
		private function print_r(a:Array):void {
			for (var i:uint = 0; i<a.length; i++) {
				trace("Parent X:",a[i][0],"Parent Y:",a[i][1],"X:",a[i][2],"Y:",a[i][3],"G:",a[i][4],"H:",a[i][5],"F:",a[i][6]);
			}
		}
		//getGCost
		private function getGCost(node:Array):uint {
			var answer:uint=0;
			var currentNode:Array=node;
			while (currentNode[0]!=-1) {//while there is a parent node
				answer+=currentNode[4];//add the g cost to the total
				currentNode=openNodes[findOpen(currentNode[0],currentNode[1])];
			}
			return answer;
		}
		//replace
		private function replace(node:Array,type:String,replaceIndex:uint):void {
			if (type=="open") {
				for (var a:uint = 0; a<node.length; a++) {
					openNodes[replaceIndex][a]=node[a];
				}
			} else {
				for (var b:uint = 0; b<node.length; b++) {
					closedNodes[replaceIndex][b]=node[b];
				}
			}
		}
	}
}