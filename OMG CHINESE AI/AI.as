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
	import flash.net.SharedObject;
	public class AI {//Artificial Intellegence
		//Shared Info
		public static var savedInfo:SharedObject;
		
		//Personal Information (henry's)
		public static const lastName:String = "王";
		public static const firstName:String = "朋";
		public static const henrysProfession:String = "学生";
		public static const HENRYS_TYPING_SPEED:uint = 60;//words per minute (wpm)
		
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
		public static var currentUserLocation:uint = 0;//who the current user is in the userfamily
		public static var currentSubject:uint = 0;//the current subject/topic is the user
		public static var currentVerb:String= "";//the current verb in use
		public static var choices:Array;
		
		//Family
		//Organized by tree (Ex. userFamily>user>age,sex,relationship (teacher,friend,chef), ect.
		//if person from different family, create a new userFamily
		public static var userFamily:Array = new Array();
		//who is "he" in the conversation (reference a person in the userFamily)
		public static var he:Array;
		public static var she:Array;
		public static var he_them:Array;
		public static var she_them:Array;
		
		//Henry's statements/questions
		public static var greeted:Boolean = false;
		public static var introduced:Boolean = false;
		public static var profession:Boolean = false;
		
		///////////////////
		//Other Variables//
		///////////////////
		
		//subjects are from l1 to l10
		public static var subjects:Array = new Array("你","您","我","我们","你们","她","他","王","王朋","李","李友","常老师","高文中","师傅","高小音","白英爱","老师","学生","爸爸","妈妈","爸","妈","哥哥","女孩子","男孩子","孩子","姐姐","弟弟","妹妹","大哥","高","大姐","大学生","医生","商人","军人","经理","教授","工人","工程师","农民","护士服务员","女人","男人","大家","朋友","小姐","先生","别人","二姐","儿子");
		public static var questionWords:Array = new Array("哪","什么","怎么","谁","吗");
		//need to update professions
		public static var professions:Array = new Array("老师","学生","工人","师傅","医生","律师");
		public static var now:Date;
		
		public function AI():void {
			populateData();
			updateDatabase();
		}
		//populateData (Gets previously saved data)
		private function populateData():void {			
			savedInfo = SharedObject.getLocal("ChineseAI");
			if(savedInfo.data.userFamily==undefined){//if new user
				userFamily.push(new Array("user1"));//create a new user
			} else {
				userFamily = savedInfo.data.userFamily;//save the current family array in local memory
			}
			choices = new Array();
		}
		//updateDatabase (updates vocab)
		private function updateDatabase():void {
			Db.book = book;
			Db.lesson = lesson;
			Db.radicals = radicals;
			Db.strokes = strokes;
			Db.numbers = numbers;
			Db.extras = extras;
			Db.updateVocab();
		}
		//findReply
		//MAIN METHOD IN FINDING HENRYS REPLY
		public static function findReply(userMsg:String,numOfLines:uint):String {
			//Methodology:
			//
			// Check if you already have talked to henry
			// If the user asks a question, then postpone all this until the questions stop
			// Some of these steps are optional
			// Spaces between steps are different scenarios henry may ask the user
			//
			// Question order (make random?)
			//
			//1. Greet
			//
			//2. Introduce self
			//3. Ask for other person's name
			//4. If doesn't supply full name, ask for full name
			//
			//5. Ask if the user is a student/ask profession
			//6. Ask what nationality is the user from
			//
			//7. Ask number of family members
			//8. Ask each family member relation, name, and profession
			//
			//9. Ask date (now or future)
			//
			//10. Ask age/birthday
			//
			//11. Ask favorite type of food
			//12. Ask about hobbies
			//
			//13. Ask if the user if busy at a date (now,future)
			//14. Ask what the user is doing on the weekend
			//15. Invite to eat food or do a hobby together
			//
			//16. Ask how are you
			//
			//17. Pretend to have a party
			//18. Offer beverages
			//
			//19. Ask user location
			//
			//20. Ask if the user has a question/problem
			//21. Ask what time to meet up
			//
			//22. Ask when is convinient to talk
			//
			//23. Ask if you know someone
			//
			//24. Ask what they feel about Chinese (grammar, writing characters, vocab)
			//25. Ask about their favorite subject
			//
			//26. Ask about sleep
			//
			//27. Ask about girlfriend/boyfriend
			//
			//28. Ask about a diary
			// 
			//29. Ask about music/concerts
			//
			//30. Ask about favorite color
			//31. Ask about clothes (size, color, expensiveness)
			//32. Ask about how to pay for clothes
			//
			//33. Ask about winter vacation
			//34. Ask about if have subway, and if, how to use it
			//35. Ask how the user feels about airplanes
			//36. Ask about taxis
			//
			//37. Ask about e-mail
			//38. Ask about cellphone
			//
			//39. Ask about recent holidays
			//
			//ENDED AT END OF BOOK 1 LESSON 10
			var reply:String="";
			var currentLine = numOfLines+1;
			choices = [];
			var userSentences:Array = toSentences(userMsg);
			var possibleReplies:Array = new Array();
			var hasQuestion:Boolean = false;//if there is at least one question in the reply
			if(currentLine==1){//very first line
				reply = greet();//greet
			} else {//if not the very first line
				//check if the user typed a question in the reply
				for(var b:uint = 0;b<userSentences.length;b++){
					if(question(userSentences[b])){
						hasQuestion=true;
					}
				}
				for(var a:uint = 0;a<userSentences.length;a++){
					//interpret reply
					var replyPrompt:Array = new Array();
					replyPrompt.push(interpretReply(userMsg,getHenrysLastMsg()));
					if(question(userMsg)){//if the message recieved is a question
						//answer the question
						possibleReplies.push(answerQuestion(userMsg,getHenrysLastMsg()));
					} else {//if the message recieved is not a question
						if(!hasQuestion){
							//ask a question
							possibleReplies.push(askQuestion(userMsg,getHenrysLastMsg()));
						}
					}
				}
				reply = randomChoice(possibleReplies);
			}
			if(reply==""){
				reply = "need reply (Error)";
			}
			return reply;
		}
		//greet
		public static function greet():String {
			greeted = true;
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
			greeting = randomChoice(choices);
			greeting+=randomEndingPunctuation(greeting);
			return greeting;
		}
		//getTimeOfDay
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
		//randomChoice
		public static function randomChoice(choice:Array) {
			var rand:uint = Math.ceil(Math.random()*(choice.length-1));
			return choice[rand];
		}
		//chance
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
		//randomEndingPunctuation
		public static function randomEndingPunctuation(sentence:String=""):String {
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
		//question (boolean)
		public static function question(userMsg:String):Boolean {
			var answer:Boolean = false;
			if(userMsg.indexOf("？")!=-1){//if there is a question mark
				answer = true;
			} else {
				var hasQuestionWord:Boolean = false;
				for(var a:uint = 0;a<questionWords.length;a++){//for all question words
					for(var b:uint = 0;b<userMsg.length-questionWords[a].length+1;b++){//for all possible indexes for the word
						if(has(userMsg.substr(b,questionWords[a].length),questionWords)!=-1){//if the substring is part of the questionWords
							hasQuestionWord = true;
						}
					}
				}
				if(hasQuestionWord){
					answer = true 
				} else {
					answer = false;
				}
			}
			return answer;
		}
		//answerQuestion
		public static function answerQuestion(userMsg:String,henrysMsg:String):String {
			//
			//GET SENTENCE DATA
			//
			//subject [0]name,[1]positioning in sentence
			var subject:Array = findSubjects(userMsg);//user's message's subjects
			var verb:Array = findVerb(userMsg);//user's message's verbs
			var verbPos:int = has(verb[0],verb);
			//
			var reply:String = "";
			reply = "answer";//default
			if(removePunct(userMsg)=="你呢"){
				//find previous sentence verb
				//make individual function for each question
			} else {
				if(subject.length!=0&&subject[0][0]=="你"){//ni (you)
					if(verb.length!=0&&verb[0]=="叫"){//jiao (called)
						//my name is ...
						introduced = true;
						reply = "我叫"+lastName+firstName+randomEndingPunctuation();
						//if doesn't know user's name, ask
						if(userFamily[0][1]==undefined){
							reply += "你呢？";//nine (and you?)
						}
					} else if(verb.length!=0&&verb[0]=="是"){//shi (is)
						//my profession is
						profession = true;
						if(userFamily[0][3]==henrysProfession){
							reply = "我也是"+henrysProfession+randomEndingPunctuation();
						} else {
							reply = "我是"+henrysProfession+randomEndingPunctuation();
						}
						//if doesn't know user's profession, ask
						if(userFamily[0][3]==undefined){
							reply += "你呢？";//nine (and you?)
						}
					}
				}
			}
			//var subject:String = findSubject(userMsg);
			return reply;
		}
		//askQuestion
		public static function askQuestion(userMsg:String,henrysMsg:String):String {
			var reply:String = "";
			if(userFamily[currentUserLocation][1]==undefined){//if henry doesn't know the user's name
				//to do: check if the userMsg states the person's name
				reply = "你叫什么名字？";
				currentSubject = 0;//the user
				currentVerb = "叫";
			} else {
				if(!profession){
					profession = true;
					if(!introduced){
						introduced = true;
						reply = "你好"+userFamily[currentUserLocation][1]+"，我叫"+lastName+firstName+"。你是学生吗？";
					} else {
						reply = "你好。你是学生吗？";
					}
				} else {
					
				}
			}
			return reply;
		}
		//findSubjects ([0] subject, [1] indirect object)
		public static function findSubjects(sentence:String):Array {
			var subject:Array = new Array();//[0]subject (string literal),[1] indirect object
			var a:uint = 0;
			while(a<subjects.length){//for all possible subjects
				var b:uint = 0;
				while(b<sentence.length){//for all words in the sentence
					if(sentence.substring(b,b+subjects[a].length)==subjects[a]){//if the part of the sentence is a possible subject
						subject.push(new Array(subjects[a],b));
					}
					b++;
				}
				a++;
			}
			//sort subjects
			subject = sortWords(subject);
			//delete duplicates
			subject = deleteDuplicates(subject);
			
			return subject;
		}
		//findVerb
		public static function findVerb(sentence:String):Array {
			var verbs:Array = new Array();//([0] word, [1] position)
			for(var a:uint = 0;a<sentence.length;a++){//for all words in the sentence
				for(var b:uint = 0;b<Db.char.length;b++){//for all possible characters in db
					if(sentence.charAt(a)==Db.char[b]){//if found the sentence word in the db
						//check if the word is a verb
						for(var c:uint = 0;c<Db.grammar[b].length;c++){//for all possible grammar uses for this word (in the db)
							if(Db.grammar[b][c]=="v"){//if a verb
								verbs.push(Db.char[b],a);
							}
						}
					}
				}
			}
			return verbs;
		}
		//getHenrysLastMsg
		public static function getHenrysLastMsg():String {
			var currentSpeechBox:uint = Application.speechBoxes.length-2;
			while(!Application.speechBoxes[currentSpeechBox].isHenrys){
				currentSpeechBox--;
			}
			return Application.speechBoxes[currentSpeechBox].textMessage;
		}
		public static function interpretReply(userMsg:String,henrysMsg:String):Array {
			//
			//GET SENTENCE DATA
			//
			//subject [0]name,[1]positioning in sentence
			var subject:Array = findSubjects(userMsg);//user's message's subjects
			var verb:Array = findVerb(userMsg);//user's message's verbs
			var verbPos:int = has(verb[0],verb);//if there i
			//
			//RETURN DATA
			//
			var replyPrompt:Array = new Array();
			//
			//NAMES
			//
			if(verb[0]=="叫"){//if the first verb is (jiao:call)
				if(subject[0][0]=="我"){//if the subject is the user
					//check if already has name
					if(userFamily[0][1]!=undefined){
						//already has name
						
					}
					//add name to user
					userFamily[0][1]=removePunct(userMsg.substring(verbPos+1,userMsg.length));
				}
			}
			//
			//PROFESSIONS
			//
			if(verb[0]=="是"){//if the first verb is (shi:is)
				if(subject[0][0]=="我"){//if the subject is the user
					//check if already has profession
					if(userFamily[0][2]!=undefined){
						//already has profession
						
					}
					//add name to profession
					if(has(removePunct(userMsg.substring(verbPos+1,userMsg.length)),professions)){
						userFamily[0][2]=removePunct(userMsg.substring(verbPos+1,userMsg.length));
					} else {
						//is it a profession?
						
					}
				}
			}
			//
			//CHECK IF ANSWERED QUESTION
			//
			if(question(userMsg)){//if the user types a question
				if(question(henrysMsg)){//if henrys previous message was a qustion
					//Interpretation: get annoyed if the user isn't polite, maybe remark about it
				}
			} else {//the reply isn't a question
				if(question(henrysMsg)){//if the last message was a question
					//check if the user answered the question
					
					//if so.. then
					
					//recieve answer from question
					//store the information into data
					
					//else...
					
					//get annoyed and ask if the user understands the question
				
				} else {
					//get information about the user's statement
					
				}
			}
			return replyPrompt;
		}
		//sortWords || parameters: Array of [0] word [1] positioning (index)
		public static function sortWords(words:Array):Array {
			var sorted:Array = new Array();
			var toBeSorted:uint = words.length;
			var index:uint = 0;
			while(toBeSorted!=0){
				for(var c:uint = 0;c<words.length;c++){
					if(words[c][1]==index){
						sorted.push(words[c]);
						toBeSorted--;
					}
				}
				index++;
			}
			return sorted;
		}
		//deleteDuplicates || parameters: Array of [0] word [1] positioning (index)
		public static function deleteDuplicates(words:Array):Array {
			for(var d:uint = 0;d<words.length-1;d++){//for all subjects not including the last one
				if(words[d][1]==words[d+1][1]){
					if(words[d][0].length<words[d+1][0]){
						words.splice(d+1,1);
					} else {
						words.splice(d,1);
					}
				}
			}
			return words;
		}
		//has (has specified string in array)
		public static function has(string:String,array:Array):int {
			var answer:Boolean = false;
			var i:int = 0;
			while(i!=array.length&&!answer){//while haven't found string
				if(array[i]==string){
					answer=true;
				}
				i++
			}
			if(!answer){//not found
				i = -1;
			}
			return i;
		}
		//removePunct (removes chinese punctuation)
		public static function removePunct(string:String):String {
			var answer:String = "";
			for(var i:uint = 0;i<string.length;++i){//for all characters
				var good:Boolean = true;
				for(var j:uint = 0;j<Db.chinesePunct.length;++j){//for all punctuation
					if(string.charAt(i)==Db.chinesePunct[j]){//if the character equals the punctuation
						good = false;
					}
				}
				if(good){
					answer+=string.charAt(i);//add the character
				}
			}
			return answer;
		}
		//typingDelay (delay in frames of henrys typing)
		public static function typingDelay(string:String):uint {
			var answer:Number =((string.length)/(HENRYS_TYPING_SPEED))*(60*Application.FPS);
			return Math.ceil(answer);
		}
		//toSentence (returns sentences in arrays)
		public static function toSentences(msg:String):Array {
			var sentenceEnds:Array = new Array();
			for(var a:uint = 0;a<msg.length;a++){//for all characters in the message
				if(msg.charAt(a)==Db.chinesePunct[0]||msg.charAt(a)==Db.chinesePunct[2]||msg.charAt(a)==Db.chinesePunct[3]){//if !,?,.
					sentenceEnds.push(a);//add position/index in array
				}
			}
			var sentences:Array = new Array();//sentences in an array
			for(var b:uint = 0;b<sentenceEnds.length;b++){//for all ends to the sentence, not including the last one
				if(b==0) {//first sentence
					sentences.push(msg.substring(0,sentenceEnds[b]+1));
				} else {//middle sentence
					sentences.push(msg.substring(sentenceEnds[b-1]+1,sentenceEnds[b]+1));
				}
			}
			if(sentenceEnds.length==0){//no punctuation
				sentences.push(msg);
			} else if(msg.length-1!=sentenceEnds[sentenceEnds.length-1]) {//if the last character isn't punctuated
				sentences.push(msg.substring(sentenceEnds[sentenceEnds.length-1]+1,msg.length));
			}
			return sentences;
		}
	}
}