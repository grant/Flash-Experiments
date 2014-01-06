package {
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Application extends MovieClip {
		
		private const newBlankDelay:uint = 50;
		private const replyDelay:uint = 5;
		private const topOffset:uint = 10;
		private const speechSeparation:uint = 10;
		
		private var ai:AI = new AI();
		private var db:Db = new Db();
		private var bg:Bg = new Bg();
		
		private var henry:Henry = new Henry(70,150);
		public var ime:InputMethodEditor = new InputMethodEditor(10,10,300,25);
		public var speechBoxes:Array;
		private var speeches:MovieClip=new MovieClip();
		private var speechDesY:int=speechSeparation;
		private var ease:Number = .1;//.1
		
		private var addingSpeech:Boolean=false;
		private var timer:uint = 0;
		private var timer2:uint = 0;
		
		public function Application():void {
			speechBoxes = new Array();
			addChild(bg);
			addChild(henry);
			speeches.y = -200;
			addChild(speeches);
			addChild(ime);
			addEventListener(Event.ENTER_FRAME,moveSpeeches);
		}
		public function addSpeech(msg:String,typeable:Boolean,henrys:Boolean,px:uint,w:uint):void {
			if(msg!=""){
				speechBoxes.push(new SpeechBox(msg,typeable,henrys,px,w));
				speeches.addChild(speechBoxes[speechBoxes.length-1]);
			}
		}
		public function updateY():void {
			var totalSize:uint = 0;
			for(var i:uint = 1;i<speechBoxes.length;i++){
				totalSize += speechBoxes[i].height;
				totalSize += speechSeparation;
			}
			speechDesY = totalSize;
			speechBoxes[speechBoxes.length-1].y = -totalSize+topOffset;
		}
		private function moveSpeeches(e:Event):void {
			speeches.y += (speechDesY-speeches.y)*ease;
		}
		public function replyToMessage(reply:String):void {
			if(addingSpeech==false&&reply.length!=0){
				addingSpeech=true;
				addEventListener(Event.ENTER_FRAME,addReply);
			}
		}
		public function addEmptySpeech():void {
			addEventListener(Event.ENTER_FRAME,addBlank);
		}
		private function addBlank(e:Event):void {
			if(timer==newBlankDelay){
				timer=0;
				addingSpeech=false;
				addSpeech(" ",true,false,330,370);
				removeEventListener(Event.ENTER_FRAME,addBlank);
			} else {
				timer++;
			}
		}
		private function addReply(e:Event):void {
			if(timer2==replyDelay){
				timer2=0;
				speechBoxes[speechBoxes.length-1].fixReply();
				addSpeech(AI.findReply(ime.reply,speechBoxes.length),false,true,330,370);
				ime.reply = "";
				addEmptySpeech();
				removeEventListener(Event.ENTER_FRAME,addReply);
			} else {
				timer2++;
			}
		}
	}
}