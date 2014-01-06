/**
 * Video menu controls
 **/
package {
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	public class VideoMenu extends MovieClip {
		
		private var selectionID:uint = 0;
		
		private var irisColor:uint = 0;
		private var irisColorRect:Shape;
		
		private var selectionDot:SelectionDot;
		
		public function VideoMenu():void {
			drawIrisColorRect();
			createSelectionDot();
			addEventListener(MouseEvent.CLICK,onClick);
		}
		
		/**
		 * Draws the iris color rectangle
		 **/
		private function drawIrisColorRect():void {
			irisColorRect = new Shape();
			irisColorRect.graphics.beginFill(irisColor);
			irisColorRect.graphics.drawRect(100,7,30,30);
			irisColorRect.graphics.endFill();
			addChild(irisColorRect);
		}
		
		/**
		 * Creates the selectionDot
		 **/
		private function createSelectionDot():void {
			selectionDot = new SelectionDot();
			addChild(selectionDot);
			updateSelectionDot();
		}
		
		/**
		 * Selects a menu item
		 **/
		private function onClick(e:MouseEvent):void {
			if(mouseY>120) {
				selectionID = 2;
			} else if(mouseY>40) {
				selectionID = 1;
			} else {
				selectionID = 0;
			}
			updateSelectionDot();
		}
		
		/**
		 * Updates the selection dot
		 **/
		private function updateSelectionDot():void {
			switch(selectionID) {
				case 0:
					selectionDot.x = 10;
					selectionDot.y = 22;
					break;
				case 1:
					selectionDot.x = 35;
					selectionDot.y = 52;
					break;
				case 2:
					selectionDot.x = 30;
					selectionDot.y = 128;
					break;
			}
		}
		
		/**
		 * Gets the current selected value id
		 **/
		public function getSelection():uint {
			return selectionID;
		}
		
		/**
		 * Sets the iris color
		 **/
		public function setIris(color:uint):void {
			irisColor = color;
			var colorChanger:ColorTransform = irisColorRect.transform.colorTransform;
			colorChanger.color = irisColor;
			irisColorRect.transform.colorTransform = colorChanger;
		}
	}
}