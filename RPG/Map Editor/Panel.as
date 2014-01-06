package {
	import flash.display.Sprite;
	import flash.display.Shape;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldType;
	
	import fl.controls.Button;

	public class Panel extends Sprite {
		//Properties
		private const panelColor:uint=0x333333;
		private const buttonPadding:uint = 10;
		private const defaultMapSize:String = "10";
		private const retractWidth:uint=30;
		private const ease:Number=.5;
		//Variables
		private var expand:Boolean=false;
		private var desX:Number;
		private var id:String;
		public function Panel(panelID:String):void {
			id=panelID;
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			create();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function create():void {
			switch (id) {
				case "Left" :
					//Background
					var bg:Shape = new Shape();
					bg.graphics.beginFill(panelColor);
					bg.graphics.drawRect(0,0,200,stage.stageHeight);
					bg.graphics.endFill();
					addChild(bg);
					
					//Map Width/Height
					var regFont:TextFormat = new TextFormat();
					regFont.size=15;
					regFont.align=TextFormatAlign.CENTER;
					regFont.color=0x000000;
					
					var labelFont:TextFormat = new TextFormat();
					labelFont.size=15;
					labelFont.align=TextFormatAlign.CENTER;
					labelFont.color=0xFFFFFF;
					
					//Map Width/Height
					var mapWidth:TextField = new TextField();
					mapWidth.background = true;
					mapWidth.backgroundColor=0xFFFFFF;
					mapWidth.defaultTextFormat=regFont;
					mapWidth.type = TextFieldType.INPUT;
					mapWidth.text=defaultMapSize;
					mapWidth.border=true;
					mapWidth.wordWrap=true;
					mapWidth.width=(((width-retractWidth)-(buttonPadding*3))/2);
					mapWidth.height=20;
					mapWidth.x=buttonPadding;
					mapWidth.y=buttonPadding*2;
					addChild(mapWidth);
					
					var mapHeight:TextField = new TextField();
					mapHeight.background = true;
					mapHeight.backgroundColor=0xFFFFFF;
					mapHeight.defaultTextFormat=regFont;
					mapHeight.type = TextFieldType.INPUT;
					mapHeight.text=defaultMapSize;
					mapHeight.border=true;
					mapHeight.wordWrap=true;
					mapHeight.width=(((width-retractWidth)-(buttonPadding*3))/2);
					mapHeight.height=20;
					mapHeight.x=(width-retractWidth)-buttonPadding-mapWidth.width;
					mapHeight.y=buttonPadding*2;
					addChild(mapHeight);
					
					//Width/Height labels
					var widthLabel:TextField = new TextField();
					widthLabel.defaultTextFormat=labelFont;
					widthLabel.selectable = false;
					widthLabel.text=defaultMapSize;
					widthLabel.border=false;
					widthLabel.wordWrap=true;
					widthLabel.width=(((width-retractWidth)-(buttonPadding*3))/2);
					widthLabel.height=20;
					widthLabel.x=buttonPadding;
					widthLabel.y=0;
					widthLabel.text = "Width";
					addChild(widthLabel);
					
					var heightLabel:TextField = new TextField();
					heightLabel.defaultTextFormat=labelFont;
					heightLabel.selectable=false;
					heightLabel.text=defaultMapSize;
					heightLabel.border=false;
					heightLabel.wordWrap=true;
					heightLabel.width=(((width-retractWidth)-(buttonPadding*3))/2);
					heightLabel.height=20;
					heightLabel.x=(width-retractWidth)-buttonPadding-mapWidth.width;
					heightLabel.y=0;
					heightLabel.text = "Height";
					addChild(heightLabel);
					
					//Buttons
					var create:Create = new Button();
					create.label = "Create Map";
					create.x = buttonPadding;
					create.y = mapWidth.y + mapWidth.height+buttonPadding;
					create.width = (width-retractWidth)-(2*buttonPadding);
					create.height = 20;
					create.addEventListener(MouseEvent.CLICK,createMap);
					addChild(create);
					
					//Properties
					desX=retractWidth-width;
					x=desX;
					break;
				case "right" :

					break;
			}
			addEventListener(MouseEvent.MOUSE_OVER,mouseIsOver);
			addEventListener(MouseEvent.MOUSE_OUT,mouseIsOut);
			addEventListener(Event.ENTER_FRAME,movePanel);
		}
		private function mouseIsOver(e:MouseEvent):void {
			expand=true;
		}
		private function mouseIsOut(e:MouseEvent):void {
			expand=false;
		}
		private function movePanel(e:Event):void {
			if (expand==true) {
				desX=0;
			} else {
				desX=retractWidth-width;
			}
			x += (desX-x)*ease;
		}
		private function createMap(e:MouseEvent):void {
			
		}
	}
}