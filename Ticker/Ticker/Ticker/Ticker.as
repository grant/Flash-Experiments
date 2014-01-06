package {
	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	public class Ticker extends MovieClip {
		/*
		Layering:
		bg Color
		numbers
		number border design
		commas
		border/shaws
		*/
		public var sW:uint;
		public var sH:uint;
		//XML
		public var xmlFile:String;
		public var xmlLoader:URLLoader = new URLLoader();
		public var xmlData:XML = new XML();
		//XML Date Data
		public var startNumber:uint;
		public var startYear:uint;
		public var startMonth:uint;
		public var startDay:uint;
		public var startHour:uint;
		public var startMinute:uint;
		public var startSec:uint;
		//XML Ticker Data
		//speed in Ms
		public var speed:Number;
		public var switchSpeed:Number;
		public var numberOfPlaces:uint;
		public var commas:Boolean;
		public var commaSize:Number;
		public var bgColor:uint;
		public var borderColor:uint;
		public var borderSize:uint;
		public var separate:Boolean;
		//Date
		public var now:Date;
		public var startDate:Date;
		public var difference:Number;
		//Display
		public var numMC:MovieClip;
		public var display:Number=0;
		public var readyToDisplay:Boolean=false;
		public function Ticker(xPos:int,yPos:int,xml:String):void {
			x = xPos;
			y = yPos;
			xmlFile=xml;
			SetXml();
		}
		private function SetXml():void {
			xmlLoader.addEventListener(Event.COMPLETE, LoadXML);
			xmlLoader.load(new URLRequest(xmlFile));
		}
		private function LoadXML(e:Event):void {
			xmlData=new XML(e.target.data);
			startNumber=xmlData.startNumber.text();
			startYear=xmlData.startYear.text();
			startMonth=xmlData.startMonth.text()-1;
			startDay=xmlData.startDay.text();
			startHour=xmlData.startHour.text();
			startMinute=xmlData.startMinute.text();
			startSec=xmlData.startSec.text();
			speed=xmlData.speed.text()*1000;//Milliseconds
			switchSpeed=xmlData.switchSpeed.text();
			if (switchSpeed<=0) {
				switchSpeed=.05;
			}
			numberOfPlaces=xmlData.numberOfPlaces.text();
			if (xmlData.commas.text()=="true") {
				commas=true;
			} else {
				commas=false;
			}
			commaSize=xmlData.commaSize.text();
			bgColor=xmlData.bgColor.text();
			borderColor=xmlData.borderColor.text();
			borderSize=xmlData.borderSize.text();
			if (xmlData.separate.text()=="true") {
				separate = true;
			} else {
				separate = false;
			}
			
			sW=stage.stageWidth;
			sH=stage.stageHeight;
			
			startDate=new Date(startYear,startMonth,startDay,startHour,startMinute,startSec,0);

			SetBg();
			
			numMC = new MovieClip();
			addChild(numMC);
			
			if (commas) {
				SetCommas();
			}
			if (separate){
				SetSeparators();
			}
			SetBorder();

			addEventListener(Event.ENTER_FRAME,updateTime);
			addEventListener(Event.ENTER_FRAME,waitForDisplay);
		}
		private function SetBg():void {
			var bg:Background = new Background();
			addChild(bg);
		}
		private function SetBorder():void {
			var border:Border = new Border();
			addChild(border);
		}
		private function SetCommas():void {
			var numberOfCommas:uint = (numberOfPlaces-((numberOfPlaces-1)%3))/3;
			trace(numberOfCommas);
			for (var i:uint = 0; i<numberOfCommas; i++) {
				var temp:Number
				if(commaSize==0){
					temp = sH/2;
				}
				var comma:Comma = new Comma(sW-borderSize-(((sW-(2*borderSize))/numberOfPlaces)*3*(i+1)),sH*.8,temp*.9,temp);
				addChild(comma);
			}
		}
		private function SetSeparators():void {
			var numberOfSeparators:uint = numberOfPlaces+1;
			for(var i:uint = 0;i<numberOfSeparators;i++){
				var separator:Separator = new Separator(borderSize+(((sW-(2*borderSize))/numberOfPlaces)*i),0,((sW-(2*borderSize))/numberOfPlaces)+1,sH);
				addChild(separator);
			}
		}
		private function updateTime(e:Event):void {
			now = new Date();
			difference = (now.valueOf()-startDate.valueOf());
			display = Math.ceil(startNumber + (difference/speed));
			addEventListener(Event.ENTER_FRAME,updateNumberArray);
		}
		public var numArray:Array = new Array();
		private var t:Number;
		private function updateNumberArray(e:Event):void {
			t=display;
			for (var i:uint = 0; i<numberOfPlaces; i++) {
				var number:uint=Math.pow(10,numberOfPlaces-1);
				for (var a:uint = 0; a<i; a++) {
					number/=10;
				}
				numArray[i]=Math.floor(t/number);
				t-=Math.floor(t/number)*number;
			}
		}
		private function waitForDisplay(e:Event):void {
			if (numArray.length>0) {
				addNumbers();
				removeEventListener(Event.ENTER_FRAME,waitForDisplay);
			}
		}
		public var numHolder:Array = new Array();
		private function addNumbers():void {
			for (var i:uint = 0; i<numberOfPlaces; i++) {
				addNum(i);
			}
			var bgShading:BgShading=new BgShading(borderSize,borderSize,sW-(2*borderSize),sH-(2*borderSize));
			addChild(bgShading);
		}
		public function addNum(place:uint):void {
			if(display < Math.pow(10,numberOfPlaces)){
				numHolder[place] = new DisplayNumber(place,numArray[place],borderSize+(((sW-(2*borderSize))/numberOfPlaces)*place),Math.ceil((sW-(2*borderSize))/numberOfPlaces),sH-(2*borderSize));
			} else {
				numHolder[place] = new DisplayNumber(place,numArray[place],(borderSize+(((sW-(2*borderSize))/numberOfPlaces)*place))-5,Math.ceil((sW-(2*borderSize))/numberOfPlaces),sH-(2*borderSize));
			}
			numMC.addChild(numHolder[place]);
		}
	}
}