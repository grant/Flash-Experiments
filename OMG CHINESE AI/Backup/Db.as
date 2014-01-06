//Static Functions
/*

getPinyin(character:String)
-returns pinyin+tone

getChar(pinyin:String)
-returns character

findWords(word:String,numberOfResults:uint)
-returns array of words

numOfResults(word:String)
-returns number of results

*/
package {
	import flash.events.Event;
	public class Db {//Database
		//Current Knowledge
		public static var book:uint;
		public static var lesson:uint;
		public static var radicals:Boolean;
		public static var strokes:Boolean;
		public static var numbers:Boolean;
		public static var extras:Boolean;

		//Db Arrays
		public static var bookChar:Array;
		public static var bookPinyin:Array;
		public static var bookEnglish:Array;

		public static var char:Array;
		public static var pinyin:Array;
		public static var english:Array;
		public static var pronounce:Array;

		public static var tones:Array;
		public static var toneLetters:Array;
		public static var toneCombos:Array;

		public static var symbols:Array;
		public static var englishPunct:Array;
		public static var chinesePunct:Array;

		//////////////
		//Sub levels//
		//////////////

		//Book 1
		public static var book1Char:Array;
		public static var book1Pinyin:Array;
		public static var book1English:Array;

		//Intro
		public static var radicalChar:Array;
		public static var radicalPinyin:Array;
		public static var radicalEnglish:Array;

		public static var strokeChar:Array;
		public static var strokePinyin:Array;
		public static var strokeEnglish:Array;

		public static var numberChar:Array;
		public static var numberPinyin:Array;
		public static var numberEnglish:Array;

		public static var introChar:Array;
		public static var introPinyin:Array;
		public static var introEnglish:Array;

		//Lesson 1
		public static var l1d1Char:Array;
		public static var l1d1Pinyin:Array;
		public static var l1d1English:Array;

		public static var l1d2Char:Array;
		public static var l1d2Pinyin:Array;
		public static var l1d2English:Array;

		public static var l1ExtraChar:Array;
		public static var l1ExtraPinyin:Array;
		public static var l1ExtraEnglish:Array;

		public static var l1Char:Array;
		public static var l1Pinyin:Array;
		public static var l1English:Array;
		
		//Lesson 2
		public static var l2d1Char:Array;
		public static var l2d1Pinyin:Array;
		public static var l2d1English:Array;

		public static var l2d2Char:Array;
		public static var l2d2Pinyin:Array;
		public static var l2d2English:Array;

		public static var l2ExtraChar:Array;
		public static var l2ExtraPinyin:Array;
		public static var l2ExtraEnglish:Array;

		public static var l2Char:Array;
		public static var l2Pinyin:Array;
		public static var l2English:Array;
		
		//Lesson 3
		public static var l3d1Char:Array;
		public static var l3d1Pinyin:Array;
		public static var l3d1English:Array;

		public static var l3d2Char:Array;
		public static var l3d2Pinyin:Array;
		public static var l3d2English:Array;

		public static var l3ExtraChar:Array;
		public static var l3ExtraPinyin:Array;
		public static var l3ExtraEnglish:Array;

		public static var l3Char:Array;
		public static var l3Pinyin:Array;
		public static var l3English:Array;

		public function Db():void {

		}
		public static function updateVocab():void {
			populateLessons();
			populateChar();
			populatePinyin();
			populateEnglish();
			populateTones();
			populatePronounce();
			populatePunctuation();
			removeDuplicates();
		}
		public static function populateLessons():void {
			//This function: Lowest level to highest level

			/*Organization:
			book>
				>book1>
					>intro>
						>radical
							>char
							>pinyin
							>english
								>definition1
								>definition2
						>stroke
						>number
					>l1>
					  	>d1
						>d2
						>Extra
			*/

			//Intro
			radicalChar=new Array("人","刀","力","又","口","囗","土","夕","大","女","子","寸","小","工","幺","弓","心","戈","手","日","月","木","水","火","田","目","示","糸","耳","衣","言","贝","走","足","钅","门","隹","雨","礻","马");
			radicalPinyin=new Array("ren2","dao1","li4","you4","kou3","wei2","tu3","xi1","da4","nu8","zi3","cun4","xiao3","gong1","yao1","gong1","xin1","ge1","shou3","ri4","yue4","mu4","shui3","huo3","tian2","mu4","shi4","mi4","er3","yi1","yan2","bei4","zou3","zu2","jin1","men2","zhui1","yu3","shi2","ma3");
			radicalEnglish = new Array(new Array("person"),new Array("knife"),new Array("power"),new Array("right hand","again"),new Array("mouth"),new Array("enclose"),new Array("earth"),new Array("sunset"),new Array("big"),new Array("woman"),new Array("son"),new Array("inch"),new Array("small"),new Array("labor","work"),new Array("tiny","small"),new Array("bow"),new Array("heart"),new Array("dagger-axe"),new Array("hand"),new Array("sun"),new Array("moon"),new Array("wood"),new Array("water"),new Array("fire"),new Array("field"),new Array("eye"),new Array("show"),new Array("fine silk"),new Array("ear"),new Array("clothing"),new Array("speech"),new Array("cowrie shell"),new Array("walk"),new Array("foot"),new Array("gold"),new Array("door"),new Array("short-tailed bird"),new Array("rain"),new Array("eat"),new Array("horse"));

			strokeChar=new Array("点","横","竖","撇","捺","提","横钩","竖钩","斜钩","横折","竖折");
			strokePinyin=new Array("dian3","heng2","shu4","pie3","na4","ti2","heng2gou1","shu4gou1","xie2gou1","heng2zhe2","shu4zhe2");
			strokeEnglish = new Array(new Array("dot"),new Array("horizontal"),new Array("vertical"),new Array("downward left"),new Array("downward right"),new Array("upward"),new Array("horizontal hook"),new Array("vertical hook"),new Array("slanted hook"),new Array("horizontal bend"),new Array("vertical bend"));

			numberChar=new Array("一","二","三","四","五","六","七","八","九","十");
			numberPinyin=new Array("yi1","er4","san1","si4","wu3","liu4","qi1","ba1","jiu3","shi2");
			numberEnglish = new Array(new Array("one"),new Array("two"),new Array("three"),new Array("four"),new Array("five"),new Array("six"),new Array("seven"),new Array("eight"),new Array("nine"),new Array("ten"));

			introChar=new Array(radicalChar,strokeChar,numberChar);
			introPinyin=new Array(radicalPinyin,strokePinyin,numberPinyin);
			introEnglish=new Array(radicalEnglish,strokeEnglish,numberEnglish);

			//Lesson 1
			l1d1Char=new Array("你","好","请","问","贵","姓","我","呢","姐","叫","什么","名字","先生","李","友","王","朋");
			l1d1Pinyin=new Array("ni3","hao3","qing3","wen4","gui4","xing4","wo3","ne0","jie3","jiao4","shen2me0","ming2zi4","xian1sheng1","li3","you3","wang2","peng2");
			l1d1English = new Array(new Array("you"),new Array("good","ok"),new Array("please","treat","invite"),new Array("ask"),new Array("honorable","expensive"),new Array("surname"),new Array("I","me"),new Array("question particle"),new Array("Miss","young lady"),new Array("to call"),new Array("what"),new Array("name"),new Array("Mr.","husband","teacher"),new Array("a surname","plum"),new Array("a name"),new Array("king","a surname"),new Array("a name"));

			l1d2Char=new Array("是","老师","吗","不","学生","也","人","中国","北京","美国","纽约");
			l1d2Pinyin=new Array("shi1","lao3shi3","ma0","bu4","xue2sheng0","ye3","ren2","zhong1guo2","bei3jing1","mei3guo2","niu3yue1");
			l1d2English = new Array(new Array("is","to be"),new Array("teacher"),new Array("question particle"),new Array("no","not"),new Array("student"),new Array("too","also"),new Array("people","person"),new Array("China"),new Array("Beijing"),new Array("America"),new Array("New York"));

			l1ExtraChar=new Array("英国","法国","德国","日本","韩国","加拿大","墨西哥","印度","越南","加州","夏葳夷","上海","山景","圣河西","旧金山","问好");
			l1ExtraPinyin=new Array("ying1guo2","fa3guo2","de2guo2","ri4ben3","han2guo2","jia1na2da4","mo4xi1ge1","yin4du4","yue4nan2","jia1zhou1","xia4wei1yi2","shang4hai3","shan1jing3","sheng4he2xi1","jiu4jin1shan","wen4hao3");
			l1ExtraEnglish = new Array(new Array("Britain","England"),new Array("France"),new Array("Germany"),new Array("Japan"),new Array("South Korea"),new Array("Canada"),new Array("Mexico"),new Array("India"),new Array("Vietnam"),new Array("California"),new Array("Hawaii"),new Array("Shanghai"),new Array("Mountain View"),new Array("San Jose"),new Array("San Francisco"),new Array("greetings"));

			l1Char=new Array(l1d1Char,l1d2Char,l1ExtraChar);
			l1Pinyin=new Array(l1d1Pinyin,l1d2Pinyin,l1ExtraPinyin);
			l1English=new Array(l1d1English,l1d2English,l1ExtraEnglish);
			
			//Lesson 2
			l2d1Char = new Array("那","的","照片","这","爸爸","妈妈","个","女","孩子","谁","她","姐姐","男","弟弟","他","大哥","儿子","有","女儿","没","高文中","高");
			l2d1Pinyin = new Array("na4","de0","zhao4pian4","zhe4","ba4ba0","ma1ma0","ge4","nu8","hai2zi0","shei2","ta1","jie3jie0","nan2","di4di0","ta1","da4ge1","er2zi0","you3","nu8er2","mei2","gao1wen2zhong1","gao1");
			l2d1English = new Array(new Array("that"),new Array("of","possessive particle"),new Array("picture","photo"),new Array("this"),new Array("father","dad"),new Array("mother","mom"),new Array("measure word for common things"),new Array("female"),new Array("child"),new Array("who"),new Array("she","her"),new Array("older sister"),new Array("male"),new Array("younger brother"),new Array("he","him"),new Array("eldest brother"),new Array("son"),new Array("have","has","exists"),new Array("daughter"),new Array("not"),new Array("a name"),new Array("tall","high","a surname"));

			l2d2Char = new Array("家","几","口","哥哥","两","妹妹","和","大姐","二姐","做","工作","律师","英文","都","大学生","大学","医生","白英爱");
			l2d2Pinyin = new Array("jia1","ji3","kou3","ge1ge0","liang3","mei4mei0","he2","da4jie3","er4jie3","zuo4","gong1zuo4","lu9shi1","ying1wen2","dou1","da4xue2sheng1","da4xue2","yi1sheng1","bai2ying1ai4");
			l2d2English = new Array(new Array("family","home"),new Array("how many","some","a few"),new Array("measure word for number of family members"),new Array("older brother"),new Array("two","a couple of"),new Array("younger sister"),new Array("and"),new Array("eldest sister"),new Array("second oldest sister"),new Array("to do"),new Array("job","work"),new Array("lawyer"),new Array("English"),new Array("both","all"),new Array("college student"),new Array("college","university"),new Array("doctor","physician"),new Array("a name"));
			
			l2ExtraChar = new Array("商人","军人","教授","经理","工人","工程师","农民","护士","家庭");
			l2ExtraPinyin = new Array("shang1ren2","jun1ren2","jiao4shou4","jing1li3","gong1ren2","gong1cheng2shi1","nong2min2","hu4shi0","jia1ting2");
			l2ExtraEnglish = new Array(new Array("merchant","businessperson"),new Array("soldier","military officer"),new Array("professor"),new Array("manager"),new Array("worker"),new Array("engineer"),new Array("farmer","peasant"),new Array("nurse"),new Array("family"));
			
			l2Char=new Array(l2d1Char,l2d2Char,l2ExtraChar);
			l2Pinyin=new Array(l2d1Pinyin,l2d2Pinyin,l2ExtraPinyin);
			l2English = new Array(l2d1English,l2d2English,l2ExtraEnglish);
			
			//Lesson 3
			l3d1Char = new Array("九月","月","十二","号","星期","星期四","天","生日","生","日","今年","年","多","大","十八","岁","吃","饭","怎么样","太","了","谢谢","喜欢","菜","还是","可是","我们","点","半","晚上","见","再见","再","英国");
			l3d1Pinyin = new Array("jiu3yue4","jue4","shi2er4","hao4","xing1qi1","xing1qi1si4","tian1","sheng1ri4","sheng1","ri4","jin1","nian2","duo1","da4","shi2ba1","sui4","chi1","fan4","zen3me0yang4","tai4","le0","xie4xie0","xi3huan0","cai4","hai2shi0","ke3shi0","wo3men0","dian3","ban4","wan3shang0","jian4","zai4jian4","zai4","ying1guo2");
			l3d1English = new Array(new Array("September"),new Array("month"),new Array("twelve"),new Array("measure word for days of the month"),new Array("week"),new Array("Thursday"),new Array("day"),new Array("birthday"),new Array("born"),new Array("day","sun"),new Array("this year"),new Array("year"),new Array("many","how many","how much"),new Array("big","old"),new Array("eighteen"),new Array("age","years old"),new Array("eat"),new Array("meal","cooked rice"),new Array("Is that O.K.?","How is that?"),new Array("too","extremely"),new Array("past particle"),new Array("thanks"),new Array("like"),new Array("cuisine","dishes"),new Array("or"),new Array("but"),new Array("we"),new Array("o'clock"),new Array("half","half an hour"),new Array("night","evening"),new Array("see"),new Array("bye","goodbye","see you again"),new Array("again"),new Array("Britain","England"));
			
			l3d2Char = new Array("现在","刻","事","今天","很","忙","明天","晚饭","为什么","为","因为","还","同学","认识","朋友");
			l3d2Pinyin = new Array("xian4zai4","ke4","shi4","jin1tian1","hen3","mang2","ming2tian1","wan3fan4","wei3shen2me0","wei4","yin1wei4","hai2","tong2xue2","ren4shi0","peng2you0");
			l3d2English = new Array(new Array("now"),new Array("quarter of an hour"),new Array("event","matter","affair"),new Array("today"),new Array("very"),new Array("busy"),new Array("tomorrow"),new Array("dinner","supper"),new Array("why"),new Array("for"),new Array("because"),new Array("also","too","as well"),new Array("classmate"),new Array("to be acquainted with","to know"),new Array("friend"));
			
			l3ExtraChar = new Array("新年","情人节","母亲节","父亲节","感恩节","时间","周","礼拜");
			l3ExtraPinyin = new Array("xin1nian2","qing2ren2jie2","mu3qin1jie2","fu4qin1jie2","gan3en1jie2","shi2jian1","zhou1","li3bai4");
			l3ExtraEnglish = new Array(new Array("New Year"),new Array("Valentine's Day"),new Array("Mother's Day"),new Array("Father's Day"),new Array("Thanksgiving"),new Array("time"),new Array("week"),new Array("week"));
			
			l3Char=new Array(l3d1Char,l3d2Char,l3ExtraChar);
			l3Pinyin=new Array(l3d1Pinyin,l3d2Pinyin,l3ExtraPinyin);
			l3English = new Array(l3d1English,l3d2English,l3ExtraEnglish);

			//Book 1
			book1Char=new Array(introChar,l1Char,l2Char,l3Char);
			book1Pinyin=new Array(introPinyin,l1Pinyin,l2Pinyin,l3Pinyin);
			book1English=new Array(introEnglish,l1English,l2English,l3English);

			//Book
			bookChar=new Array(book1Char);
			bookPinyin=new Array(book1Pinyin);
			bookEnglish=new Array(book1English);
		}
		public static function populateChar():void {
			char = new Array();
			for (var a:uint = 0; a<bookChar.length; a++) {//1 book1
				for (var b:uint = 0; b<bookChar[a].length; b++) {//2 lessons (intro, l1)
					for (var c:uint = 0; c<bookChar[a][b].length; c++) {//3 parts (d1,d2,extra)
						char=char.concat(bookChar[a][b][c]);
					}
				}
			}
		}
		public static function populatePinyin():void {
			pinyin = new Array();
			for (var a:uint = 0; a<bookPinyin.length; a++) {//1 book1
				for (var b:uint = 0; b<bookPinyin[a].length; b++) {//2 lessons (intro, l1)
					for (var c:uint = 0; c<bookPinyin[a][b].length; c++) {//3 parts (d1,d2,extra)
						pinyin=pinyin.concat(bookPinyin[a][b][c]);
					}
				}
			}
		}
		public static function populateEnglish():void {
			english = new Array();
			for (var a:uint = 0; a<bookEnglish.length; a++) {//1 book1
				for (var b:uint = 0; b<bookEnglish[a].length; b++) {//2 lessons (intro, l1)
					for (var c:uint = 0; c<bookEnglish[a][b].length; c++) {//3 parts (d1,d2,extra)
						english=english.concat(bookEnglish[a][b][c]);
					}
				}
			}
		}
		public static function populateTones():void {
			tones = new Array();
			tones=["0","1","2","3","4","5","6","7","8","9"];
			//tones 5-9 are for the ü symbol (0,1,2,3,4)
			toneLetters = new Array();
			toneLetters=["a","e","i","o","u"];
			toneCombos = new Array();
			toneCombos=["a0","a1","a2","a3","a4","e0","e1","e2","e3","e4","i0","i1","i2","i3","i4","o0","o1","o2","o3","o4","u1","u2","u3","u4","u5","u6","u7","u8","u9"];
			symbols=new Array();
			symbols=["a","ā","á","ǎ","à","e","ē","é","ě","è","i","ī","í","ǐ","ì","o","ō","ó","ǒ","ò","u","ū","ú","ǔ","ù","ü","ǖ","ǘ","ǚ","ǜ"];
		}
		//Populate Pronounce
		public static function populatePronounce():void {
			pronounce = new Array();
			for (var i:uint = 0; i<pinyin.length; i++) {//for all words
				var newPronounce:String="";
				var prevPart:uint=0;
				for (var j:uint = 0; j<pinyin[i].length; j++) {//for all characters
					for (var k:uint = 0; k<tones.length; k++) {//for all tone numbers
						if (pinyin[i].charAt(j)==tones[k]) {//if the current character is a tone number
							var tone:String=pinyin[i].charAt(j);
							var tonePos:uint=j;
							var toneChanged:Boolean=false;
							for (var l:uint = prevPart; l<j; l++) {//for all characters in the single word (not numbers)
								if (toneChanged==false) {//if haven't seen the first vowel
									for (var m:uint = 0; m<toneLetters.length; m++) {
										if (pinyin[i].charAt(l)==toneLetters[m]) {//if the letter is a vowel
											//first part
											for (var n:uint = prevPart; n<l; n++) {
												newPronounce+=pinyin[i].charAt(n);
											}
											//tone
											var toneCombo=pinyin[i].charAt(l)+tone;
											newPronounce+=findToneCharacter(toneCombo);
											//last part
											for (var o:uint = l+1; o<tonePos; o++) {
												newPronounce+=pinyin[i].charAt(o);
											}
											toneChanged=true;
										}
									}
								}
							}
							prevPart=j+1;
							pronounce[i]=newPronounce;
						}
					}
				}
			}
		}
		public static function removeDuplicates():void {
			//Keeps the first instance of a character
			for(var a:uint = 0;a<char.length;a++){
				for(var b:uint = a;b<char.length;b++){
					if(a!=b){
						if(char[a]==char[b]){
							//check if there is another English meaning and merge
							english[a] = mergeArrays(english[a],english[b]);
							removeChar(a);
						}
					}
				}
			}
		}
		public static function mergeArrays(...args):Array {
			var retArr:Array = new Array();
  			for each (var arg:* in args) {
        		if (arg is Array) {
					for each (var value:* in arg) {
						if (retArr.indexOf(value) == -1) {
							retArr.push(value);
						}
    		        }
    		    }
		    }
		    return retArr;
		}
		public static function removeChar(pos:uint):void {
			char.splice(pos,1);
			pinyin.splice(pos,1);
			english.splice(pos,1);
			pronounce.splice(pos,1);
		}
		public static function findToneCharacter(toneCombo:String):String {
			var character:String="Error";
			for (var i:uint = 0; i<toneCombos.length; i++) {
				if (toneCombos[i]==toneCombo) {
					character=symbols[i];
				}
			}
			return character;
		}
		public static function populatePunctuation():void {
			englishPunct = new Array();
			englishPunct=["?",",",".","!"];
			chinesePunct = new Array();
			chinesePunct=["？","，","。","！"];
		}
		//Char
		public static function getChar(query:String):String {
			var character:String="Error";
			var pinyinLocation:int=-1;
			var i:uint=0;
			while (pinyinLocation==-1) {
				if (pinyin[i]==query) {
					pinyinLocation=i;
				} else {
					if (i<pinyin.length) {
						i++;
					}
				}
			}
			if (!(pinyinLocation==-1)) {
				character=char[pinyinLocation];
			}
			return character;
		}
		//Pinyin
		public static function getPinyin(query:String):String {
			var word:String="Error";
			var charLocation:int=-1;
			var i:uint=0;
			while (charLocation==-1) {
				if (char[i]==query) {
					charLocation=i;
				} else {
					if (i<char.length) {
						i++;
					}
				}
			}
			if (!(charLocation==-1)) {
				word=pinyin[charLocation];
			}
			return word;
		}
		//Find Words
		public static function findWords(word:String,numberOfResults:uint):Array {
			var found:Array = new Array();
			var search:String=removeNumbers(word);
			while (search!="") {
				for (var i:uint = 0; i<pinyin.length; i++) {//for all pinyin
					var work:Boolean=true;
					if(removeNumbers(pinyin[i]).substring(0,search.length)!=search){
						work=false;
					}
					if (work) {
						found.push(char[i]);
					}
				}
				//Adds words even if has random letter at the end
				if (found.length==0) {
					//remove last character
					var newSearch:String="";
					for (var j:uint = 0; j<search.length-1; j++) {
						newSearch+=search.charAt(j);
					}
					search=newSearch;
				} else {
					search="";
				}
			}
			found=sortResults(found,search);
			return found;
		}
		//Sort Results
		public static function sortResults(found:Array,search:String):Array {//Sorts by length
			var sorted:Array = new Array();
			//make found pinyin
			var foundPinyin:Array = new Array();
			for(var i:uint = 0;i<found.length;i++){
				foundPinyin[i] = getPinyin(found[i]);
			}
			if (found.length!=0) {
				var len:uint=found.length;
				var currWordLength:uint=0;
				while (len>0) {//while there are still words to be sorted
					for (var a:uint = 0; a<found.length; a++) {//for all found pinyin
						if(foundPinyin[a].length==currWordLength){
							sorted.push(found[a]);
							len--;
						}
					}
					currWordLength++;
				}
			}
			return sorted;
		}
		//Results
		public static function numOfResults(word:String):uint {
			var num:uint=0;
			for (var i:uint = 0; i<pinyin.length; i++) {
				if (pinyin[i]==word) {
					num++;
				}
			}
			return num;
		}
		//getPunct
		public static function getPunct(punctuation:String) {
			var punct:String="Error";
			for (var i:uint = 0; i<englishPunct.length; i++) {
				if (punctuation==englishPunct[i]) {
					punct=chinesePunct[i];
				}
			}
			return punct;
		}
		//getSymbolPinyin
		public static function getSymbolPinyin(toneCombo:String):String {
			var character:String="Error";
			for (var i:uint = 0; i<pinyin.length; i++) {
				if (toneCombo==pinyin[i]) {
					character=pronounce[i];
				}
			}
			return character;
		}
		//removeNumbers
		public static function removeNumbers(string:String):String {
			var newString:String="";
			for (var i:uint = 0; i<string.length; i++) {
				var notANumber:Boolean=true;
				for (var j:uint = 0; j<Db.tones.length; j++) {
					if (string.charAt(i)==Db.tones[j]) {
						notANumber=false;
					}
				}
				if (notANumber) {
					newString+=string.charAt(i);
				}
			}
			return newString;
		}
		//getMeanings
		public static function getMeanings(character:String):String {
			var answer:String = "";
			var a:uint = 0;
			while(answer===""){
				if(char[a]==character){
					for(var b:uint = 0;b<english[a].length;b++){
						if(b!==0){
							answer += ", ";
						}
						answer += english[a][b];
					}
				}
				a++;
			}
			return answer;
		}
	}
}