//Emotion Combinations
/*
Codes:
s = surprise
j = joy
t = trust
i = interest
k = kindness
a = anger

+ = high in value
- = low in value
//////////////
60 Combinations:

s+j+ awe
s+j- shock
s+t+ excitement
s+t- alarm
s+i+ fascination
s+i- disturb
s+k+ amazed
s+k- startle
s+a+ antagonize
s+a- distress

s-j+ content
s-j- depressed
s-t+ hope
s-t- dispair
s-i+ interest
s-i- bored
s-k+ acceptance
s-k- gloom
s-a+ disappointment
s-a- expecting

j+t+ love
j+t- zest
j+i+ optimism
j+i- happy
j+k+ gratitude
j+k- relief
j+a+ vexed
j+a- guilt

j-t+ dismay
j-t- disbelief
j-i+ pride
j-i- scorn
j-k+ passive
j-k- bitterness
j-a+ jealous
j-a- scared

t+i+ belief
t+i- disinterest
t+k+ compatable
t+k- carelessness
t+a+ annoyed
t+a- worried

t-i+ curious
t-i- skepticism
t-k+ mysterious
t-k- ignorance
t-a+ agrivation
t-a- afraid

i+k+ interested
i+k- overconfident
i+a+ anticipation
i+a- nervous

i-k+ uninformed
i-k- contempt
i-a+ irritation
i-a- horror

k+a+ torment
k+a- frustration

k-a+ rage
k-a- in denial
//AI Philosophy
- Henry will react based only on what the user types.
- Henry will feel what the user feels. (via replies)
//AI Conversation order
- Greet
- Introduce (Age, nationality, sex, occupation)
- Ask about family
*/
package {
	public class AI {//Artificial Intellegence
		//Personal Information
		public static const lastName:String = "王";
		public static const firstName:String = "朋";
		
		//Human Properties (0-100)
		public static var surprise:uint = 50;//anticipation
		public static var joy:uint = 50;//sadness
		public static var trust:uint = 50;//disgust
		public static var interest:uint = 50;//disinterest
		public static var kindness:uint = 50;//rudeness
		public static var anger:uint = 50;//fear
		
		//Vocabulary
		public static var book:uint = 1;
		public static var lesson:uint = 1;
		public static var radicals:Boolean = true;
		public static var strokes:Boolean = true;
		public static var numbers:Boolean = true;
		public static var extras:Boolean = true;
		
		/////////////////////
		//Conversation Data//
		/////////////////////
		
		//General
		
		public static var choices:Array;
		
		//Family
		//Organized by tree (Ex. userFamily>user>age,sex,ect.
		public static var userFamily:Array = new Array();
		
		//Greeted
		public static var greeted:Boolean = false;
		
		///////////////////
		//Other Variables//
		///////////////////
		
		public static var now:Date;
		
		public function AI():void {
			populateData();
			updateDatabase();
		}
		private function populateData():void {
			userFamily.push(new Array("user"));
			choices = new Array();
		}
		private function updateDatabase():void {
			Db.book = book;
			Db.lesson = lesson;
			Db.radicals = radicals;
			Db.strokes = strokes;
			Db.numbers = numbers;
			Db.extras = extras;
			Db.updateVocab();
		}
		public static function findReply(userMsg:String,numOfLines:uint):String {
			var reply:String="";
			var currentLine = numOfLines+1;
			choices = [];
			if(currentLine==1){//first line
				reply = greet();
			} else {
				for(var a:uint = 0;a<choices.length;a++){
					if(choices[a].indexOf(userMsg)){
						reply = "A";  
					}
				}
				reply = "ASDF";
			}
			return reply;
		}
		public static function greet():String {
			//http://en.wikibooks.org/wiki/Chinese_(Mandarin)/Greetings
			var greeting:String = "";
			var time = getTimeOfDay("Chinese");
			switch(time){
				case "上":
					choices.push("早上好");
					choices.push("早");
					choices.push("早安");
					break;
				case "中":
					choices.push("中午好");
					break;
				case "下":
					choices.push("下午好");
					choices.push("午安");
					break;
				case "晚":
					choices.push("晚上好");
					choices.push("晚安");
					break;
			}
			choices.push("你好");
			choices.push("你好吗?");
			if(chance(kindness/100)){
				choices.push("您好");
				choices.push("您好吗?");
			}
			
			//Check if the choice's characters are in the lesson (if the user knows them)
			
			
			var rand:uint = Math.ceil(Math.random()*(choices.length-1));
			greeting = choices[rand];
			greeting+=randomEndingPunctuation(greeting);
			return greeting;
		}
		public static function getTimeOfDay(lang:String):String {
			now = new Date();
			var timeOfDay:String = "";
			if(now.getHours()>=18){
				timeOfDay = "night";
			} else if(now.getHours()<12){
				timeOfDay = "morning";
			} else if(now.getHours()==12){
				timeOfDay = "noon";
			} else {
				timeOfDay = "afternoon";
			}
			if(lang=="Chinese"){
				switch(timeOfDay){
					case "morning":
						timeOfDay = "上";
						break;
					case "noon":
						timeOfDay = "中";
						break;
					case "afternoon":
						timeOfDay = "下";
						break;
					case "night":
						timeOfDay = "晚";	
						break;
				}
			} else {
				timeOfDay = "language error";
			}
			return timeOfDay;
		}
		public static function chance(probability:Number):Boolean {
			var rand:Number = Math.random();
			var answer:Boolean;
			if(rand<probability){
				answer = true;
			} else {
				answer = false;
			}
			return answer;
		}
		public static function randomEndingPunctuation(sentence:String):String {
			var end:String = "";
			if(sentence.charAt(sentence.length-1)!="?"){
				var rand2:Number = Math.random();
				if(chance(joy/100)){
					end="！";
				} else {
					end="。";
				}
			}
			return end;
		}
	}
}