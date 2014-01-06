//Static Functions
/*

getPinyin(character:String)
-returns pinyin+tone

getChar(pinyin:Strin+g)
-returns character

findChineseWords(word:String,numberOfResults:uint)
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
		public static var dbChar:Array;
		public static var dbPinyin:Array;
		public static var dbEnglish:Array;
		public static var dbGrammar:Array;

		public static var char:Array;//all db characters
		public static var pinyin:Array;//all db pinyin + tone
		public static var english:Array;//all db english
		public static var pronounce:Array;//all symbol pinyin
		public static var grammar:Array;//all grammar uses per character
		//Grammar:
		/*
		adj adjective
		adv adverb
		conj conjunction
		excl exclamatory particle
		interj interjection
		mw measure word
		mv modal verb
		n noun
		nu numeral
		p particle
		pn proper noun
		pr pronoun
		prefix prefix
		prep preposition
		qp question particle
		qpr question pronoun
		t time word
		v verb
		vc verb plus compliment
		vo verb pluc object
		na not available
		*/

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
		public static var book1Grammar:Array;

		//Book 1 Lessons
		//Intro
		public static var b1radicalChar:Array;
		public static var b1radicalPinyin:Array;
		public static var b1radicalEnglish:Array;
		public static var b1radicalGrammar:Array;

		public static var b1strokeChar:Array;
		public static var b1strokePinyin:Array;
		public static var b1strokeEnglish:Array;
		public static var b1strokeGrammar:Array;

		public static var b1numberChar:Array;
		public static var b1numberPinyin:Array;
		public static var b1numberEnglish:Array;
		public static var b1numberGrammar:Array;

		public static var b1introChar:Array;
		public static var b1introPinyin:Array;
		public static var b1introEnglish:Array;
		public static var b1introGrammar:Array;

		//Lesson 1
		public static var b1l1d1Char:Array;
		public static var b1l1d1Pinyin:Array;
		public static var b1l1d1English:Array;
		public static var b1l1d1Grammar:Array;

		public static var b1l1d2Char:Array;
		public static var b1l1d2Pinyin:Array;
		public static var b1l1d2English:Array;
		public static var b1l1d2Grammar:Array;

		public static var b1l1ExtraChar:Array;
		public static var b1l1ExtraPinyin:Array;
		public static var b1l1ExtraEnglish:Array;
		public static var b1l1ExtraGrammar:Array;

		public static var b1l1Char:Array;
		public static var b1l1Pinyin:Array;
		public static var b1l1English:Array;
		public static var b1l1Grammar:Array;
		
		//Lesson 2
		public static var b1l2d1Char:Array;
		public static var b1l2d1Pinyin:Array;
		public static var b1l2d1English:Array;
		public static var b1l2d1Grammar:Array;

		public static var b1l2d2Char:Array;
		public static var b1l2d2Pinyin:Array;
		public static var b1l2d2English:Array;
		public static var b1l2d2Grammar:Array;

		public static var b1l2ExtraChar:Array;
		public static var b1l2ExtraPinyin:Array;
		public static var b1l2ExtraEnglish:Array;
		public static var b1l2ExtraGrammar:Array;

		public static var b1l2Char:Array;
		public static var b1l2Pinyin:Array;
		public static var b1l2English:Array;
		public static var b1l2Grammar:Array;
		
		//Lesson 3
		public static var b1l3d1Char:Array;
		public static var b1l3d1Pinyin:Array;
		public static var b1l3d1English:Array;
		public static var b1l3d1Grammar:Array;

		public static var b1l3d2Char:Array;
		public static var b1l3d2Pinyin:Array;
		public static var b1l3d2English:Array;
		public static var b1l3d2Grammar:Array;

		public static var b1l3ExtraChar:Array;
		public static var b1l3ExtraPinyin:Array;
		public static var b1l3ExtraEnglish:Array;
		public static var b1l3ExtraGrammar:Array;

		public static var b1l3Char:Array;
		public static var b1l3Pinyin:Array;
		public static var b1l3English:Array;
		public static var b1l3Grammar:Array;
		
		//Lesson 4
		public static var b1l4d1Char:Array;
		public static var b1l4d1Pinyin:Array;
		public static var b1l4d1English:Array;
		public static var b1l4d1Grammar:Array;

		public static var b1l4d2Char:Array;
		public static var b1l4d2Pinyin:Array;
		public static var b1l4d2English:Array;
		public static var b1l4d2Grammar:Array;

		public static var b1l4ExtraChar:Array;
		public static var b1l4ExtraPinyin:Array;
		public static var b1l4ExtraEnglish:Array;
		public static var b1l4ExtraGrammar:Array;

		public static var b1l4Char:Array;
		public static var b1l4Pinyin:Array;
		public static var b1l4English:Array;
		public static var b1l4Grammar:Array;
		
		//Lesson 5
		public static var b1l5d1Char:Array;
		public static var b1l5d1Pinyin:Array;
		public static var b1l5d1English:Array;
		public static var b1l5d1Grammar:Array;

		public static var b1l5d2Char:Array;
		public static var b1l5d2Pinyin:Array;
		public static var b1l5d2English:Array;
		public static var b1l5d2Grammar:Array;

		public static var b1l5ExtraChar:Array;
		public static var b1l5ExtraPinyin:Array;
		public static var b1l5ExtraEnglish:Array;
		public static var b1l5ExtraGrammar:Array;

		public static var b1l5Char:Array;
		public static var b1l5Pinyin:Array;
		public static var b1l5English:Array;
		public static var b1l5Grammar:Array;
		
		//Lesson 6
		public static var b1l6d1Char:Array;
		public static var b1l6d1Pinyin:Array;
		public static var b1l6d1English:Array;
		public static var b1l6d1Grammar:Array;

		public static var b1l6d2Char:Array;
		public static var b1l6d2Pinyin:Array;
		public static var b1l6d2English:Array;
		public static var b1l6d2Grammar:Array;

		public static var b1l6ExtraChar:Array;
		public static var b1l6ExtraPinyin:Array;
		public static var b1l6ExtraEnglish:Array;
		public static var b1l6ExtraGrammar:Array;

		public static var b1l6Char:Array;
		public static var b1l6Pinyin:Array;
		public static var b1l6English:Array;
		public static var b1l6Grammar:Array;
		
		//Lesson 7
		public static var b1l7d1Char:Array;
		public static var b1l7d1Pinyin:Array;
		public static var b1l7d1English:Array;
		public static var b1l7d1Grammar:Array;

		public static var b1l7d2Char:Array;
		public static var b1l7d2Pinyin:Array;
		public static var b1l7d2English:Array;
		public static var b1l7d2Grammar:Array;

		public static var b1l7ExtraChar:Array;
		public static var b1l7ExtraPinyin:Array;
		public static var b1l7ExtraEnglish:Array;
		public static var b1l7ExtraGrammar:Array;

		public static var b1l7Char:Array;
		public static var b1l7Pinyin:Array;
		public static var b1l7English:Array;
		public static var b1l7Grammar:Array;
		
		//Lesson 8
		public static var b1l8d1Char:Array;
		public static var b1l8d1Pinyin:Array;
		public static var b1l8d1English:Array;
		public static var b1l8d1Grammar:Array;

		public static var b1l8d2Char:Array;
		public static var b1l8d2Pinyin:Array;
		public static var b1l8d2English:Array;
		public static var b1l8d2Grammar:Array;

		public static var b1l8ExtraChar:Array;
		public static var b1l8ExtraPinyin:Array;
		public static var b1l8ExtraEnglish:Array;
		public static var b1l8ExtraGrammar:Array;

		public static var b1l8Char:Array;
		public static var b1l8Pinyin:Array;
		public static var b1l8English:Array;
		public static var b1l8Grammar:Array;
		
		//Lesson 9
		public static var b1l9d1Char:Array;
		public static var b1l9d1Pinyin:Array;
		public static var b1l9d1English:Array;
		public static var b1l9d1Grammar:Array;

		public static var b1l9d2Char:Array;
		public static var b1l9d2Pinyin:Array;
		public static var b1l9d2English:Array;
		public static var b1l9d2Grammar:Array;

		public static var b1l9ExtraChar:Array;
		public static var b1l9ExtraPinyin:Array;
		public static var b1l9ExtraEnglish:Array;
		public static var b1l9ExtraGrammar:Array;

		public static var b1l9Char:Array;
		public static var b1l9Pinyin:Array;
		public static var b1l9English:Array;
		public static var b1l9Grammar:Array;
		
		//Lesson 10
		public static var b1l10d1Char:Array;
		public static var b1l10d1Pinyin:Array;
		public static var b1l10d1English:Array;
		public static var b1l10d1Grammar:Array;

		public static var b1l10d2Char:Array;
		public static var b1l10d2Pinyin:Array;
		public static var b1l10d2English:Array;
		public static var b1l10d2Grammar:Array;
		
		public static var b1l10ExtraChar:Array;
		public static var b1l10ExtraPinyin:Array;
		public static var b1l10ExtraEnglish:Array;
		public static var b1l10ExtraGrammar:Array;

		public static var b1l10Char:Array;
		public static var b1l10Pinyin:Array;
		public static var b1l10English:Array;
		public static var b1l10Grammar:Array;
		
		//Book 2
		public static var book2Char:Array;
		public static var book2Pinyin:Array;
		public static var book2English:Array;
		public static var book2Grammar:Array;
		
		//Book 2 Lessons
		//Lesson 11
		public static var b2l11d1Char:Array;
		public static var b2l11d1Pinyin:Array;
		public static var b2l11d1English:Array;
		public static var b2l11d1Grammar:Array;

		public static var b2l11d2Char:Array;
		public static var b2l11d2Pinyin:Array;
		public static var b2l11d2English:Array;
		public static var b2l11d2Grammar:Array;

		public static var b2l11ExtraChar:Array;
		public static var b2l11ExtraPinyin:Array;
		public static var b2l11ExtraEnglish:Array;
		public static var b2l11ExtraGrammar:Array;

		public static var b2l11Char:Array;
		public static var b2l11Pinyin:Array;
		public static var b2l11English:Array;
		public static var b2l11Grammar:Array;
		
		//Lesson 12
		public static var b2l12d1Char:Array;
		public static var b2l12d1Pinyin:Array;
		public static var b2l12d1English:Array;
		public static var b2l12d1Grammar:Array;

		public static var b2l12d2Char:Array;
		public static var b2l12d2Pinyin:Array;
		public static var b2l12d2English:Array;
		public static var b2l12d2Grammar:Array;

		public static var b2l12ExtraChar:Array;
		public static var b2l12ExtraPinyin:Array;
		public static var b2l12ExtraEnglish:Array;
		public static var b2l12ExtraGrammar:Array;

		public static var b2l12Char:Array;
		public static var b2l12Pinyin:Array;
		public static var b2l12English:Array;
		public static var b2l12Grammar:Array;
		
		//Lesson 13
		public static var b2l13d1Char:Array;
		public static var b2l13d1Pinyin:Array;
		public static var b2l13d1English:Array;
		public static var b2l13d1Grammar:Array;

		public static var b2l13d2Char:Array;
		public static var b2l13d2Pinyin:Array;
		public static var b2l13d2English:Array;
		public static var b2l13d2Grammar:Array;

		public static var b2l13ExtraChar:Array;
		public static var b2l13ExtraPinyin:Array;
		public static var b2l13ExtraEnglish:Array;
		public static var b2l13ExtraGrammar:Array;

		public static var b2l13Char:Array;
		public static var b2l13Pinyin:Array;
		public static var b2l13English:Array;
		public static var b2l13Grammar:Array;

		public function Db():void {
		}
		public static function updateVocab():void {
			populateLessons();
			populateChar();
			populatePinyin();
			populateEnglish();
			populateGrammar();
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

			//Book 1 Lessons
			//Intro
			b1radicalChar=new Array("人","刀","力","又","口","囗","土","夕","大","女","子","寸","小","工","幺","弓","心","戈","手","日","月","木","水","火","田","目","示","糸","耳","衣","言","贝","走","足","钅","门","隹","雨","礻","马");
			b1radicalPinyin=new Array("ren2","dao1","li4","you4","kou3","wei2","tu3","xi1","da4","nu8","zi3","cun4","xiao3","gong1","yao1","gong1","xin1","ge1","shou3","ri4","yue4","mu4","shui3","huo3","tian2","mu4","shi4","mi4","er3","yi1","yan2","bei4","zou3","zu2","jin1","men2","zhui1","yu3","shi2","ma3");
			b1radicalEnglish = new Array(new Array("person"),new Array("knife"),new Array("power"),new Array("right hand","again"),new Array("mouth"),new Array("enclose"),new Array("earth"),new Array("sunset"),new Array("big"),new Array("woman"),new Array("son"),new Array("inch"),new Array("small"),new Array("labor","work"),new Array("tiny","small"),new Array("bow"),new Array("heart"),new Array("dagger-axe"),new Array("hand"),new Array("sun"),new Array("moon"),new Array("wood"),new Array("water"),new Array("fire"),new Array("field"),new Array("eye"),new Array("show"),new Array("fine silk"),new Array("ear"),new Array("clothing"),new Array("speech"),new Array("cowrie shell"),new Array("walk"),new Array("foot"),new Array("gold"),new Array("door"),new Array("short-tailed bird"),new Array("rain"),new Array("eat"),new Array("horse"));
			b1radicalGrammar = new Array(new Array("n"),new Array("n"),new Array("n"),new Array("n","adv"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("adj"),new Array("n"),new Array("n"),new Array("n"),new Array("adj"),new Array("n"),new Array("adj"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("v"),new Array("n"));
			
			b1strokeChar=new Array("点","横","竖","撇","捺","提","横钩","竖钩","斜钩","横折","竖折");
			b1strokePinyin=new Array("dian3","heng2","shu4","pie3","na4","ti2","heng2gou1","shu4gou1","xie2gou1","heng2zhe2","shu4zhe2");
			b1strokeEnglish = new Array(new Array("dot"),new Array("horizontal"),new Array("vertical"),new Array("downward left"),new Array("downward right"),new Array("upward"),new Array("horizontal hook"),new Array("vertical hook"),new Array("slanted hook"),new Array("horizontal bend"),new Array("vertical bend"));
			b1strokeGrammar = new Array(new Array("n"),new Array("adj"),new Array("adj"),new Array("adv"),new Array("adv"),new Array("adv"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"));
			
			b1numberChar=new Array("一","二","三","四","五","六","七","八","九","十");
			b1numberPinyin=new Array("yi1","er4","san1","si4","wu3","liu4","qi1","ba1","jiu3","shi2");
			b1numberEnglish = new Array(new Array("one"),new Array("two"),new Array("three"),new Array("four"),new Array("five"),new Array("six"),new Array("seven"),new Array("eight"),new Array("nine"),new Array("ten"));
			b1numberGrammar = new Array(new Array("nu"),new Array("nu"),new Array("nu"),new Array("nu"),new Array("nu"),new Array("nu"),new Array("nu"),new Array("nu"),new Array("nu"),new Array("nu"));
			
			b1introChar=new Array(b1radicalChar,b1strokeChar,b1numberChar);
			b1introPinyin=new Array(b1radicalPinyin,b1strokePinyin,b1numberPinyin);
			b1introEnglish=new Array(b1radicalEnglish,b1strokeEnglish,b1numberEnglish);
			b1introGrammar=new Array(b1radicalGrammar,b1strokeGrammar,b1numberGrammar);

			//Lesson 1
			b1l1d1Char=new Array("你","好","请","问","贵","姓","我","呢","姐","叫","什么","名字","先生","李","友","王","朋");
			b1l1d1Pinyin=new Array("ni3","hao3","qing3","wen4","gui4","xing4","wo3","ne0","jie3","jiao4","shen2me0","ming2zi4","xian1sheng1","li3","you3","wang2","peng2");
			b1l1d1English = new Array(new Array("you"),new Array("good","ok"),new Array("please","treat","invite"),new Array("ask"),new Array("honorable","expensive"),new Array("surname"),new Array("I","me"),new Array("question particle"),new Array("Miss","young lady"),new Array("to call"),new Array("what"),new Array("name"),new Array("Mr.","husband","teacher"),new Array("a surname","plum"),new Array("a name"),new Array("king","a surname"),new Array("a name"));
			b1l1d1Grammar = new Array(new Array("pr"),new Array("adj"),new Array("v"),new Array("v"),new Array("adj"),new Array("v","n"),new Array("pr"),new Array("qp"),new Array("n"),new Array("v"),new Array("qpr"),new Array("n"),new Array("n"),new Array("pr"),new Array("pr","n"),new Array("pr"),new Array("pr","n"));

			b1l1d2Char=new Array("是","老师","吗","不","学生","也","人","中国","北京","美国","纽约");
			b1l1d2Pinyin=new Array("shi1","lao3shi3","ma0","bu4","xue2sheng0","ye3","ren2","zhong1guo2","bei3jing1","mei3guo2","niu3yue1");
			b1l1d2English = new Array(new Array("is","to be"),new Array("teacher"),new Array("question particle"),new Array("no","not"),new Array("student"),new Array("too","also"),new Array("people","person"),new Array("China"),new Array("Beijing"),new Array("America"),new Array("New York"));
			b1l1d2Grammar = new Array(new Array("v"),new Array("n"),new Array("qp"),new Array("adv"),new Array("n"),new Array("adv"),new Array("n"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"));

			b1l1ExtraChar=new Array("英国","法国","德国","日本","韩国","加拿大","墨西哥","印度","越南","加州","夏葳夷","上海","山景","圣河西","旧金山","问好");
			b1l1ExtraPinyin=new Array("ying1guo2","fa3guo2","de2guo2","ri4ben3","han2guo2","jia1na2da4","mo4xi1ge1","yin4du4","yue4nan2","jia1zhou1","xia4wei1yi2","shang4hai3","shan1jing3","sheng4he2xi1","jiu4jin1shan","wen4hao3");
			b1l1ExtraEnglish = new Array(new Array("Britain","England"),new Array("France"),new Array("Germany"),new Array("Japan"),new Array("South Korea"),new Array("Canada"),new Array("Mexico"),new Array("India"),new Array("Vietnam"),new Array("California"),new Array("Hawaii"),new Array("Shanghai"),new Array("Mountain View"),new Array("San Jose"),new Array("San Francisco"),new Array("greetings"));
			b1l1ExtraGrammar = new Array(new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("n"));

			b1l1Char=new Array(b1l1d1Char,b1l1d2Char,b1l1ExtraChar);
			b1l1Pinyin=new Array(b1l1d1Pinyin,b1l1d2Pinyin,b1l1ExtraPinyin);
			b1l1English=new Array(b1l1d1English,b1l1d2English,b1l1ExtraEnglish);
			b1l1Grammar=new Array(b1l1d1Grammar,b1l1d2Grammar,b1l1ExtraGrammar);
			
			//Lesson 2
			b1l2d1Char = new Array("那","的","照片","这","爸爸","妈妈","个","女","孩子","谁","她","姐姐","男","弟弟","他","大哥","儿子","有","女儿","没","高文中","高");
			b1l2d1Pinyin = new Array("na4","de0","zhao4pian4","zhe4","ba4ba0","ma1ma0","ge4","nu8","hai2zi0","shei2","ta1","jie3jie0","nan2","di4di0","ta1","da4ge1","er2zi0","you3","nu8er2","mei2","gao1wen2zhong1","gao1");
			b1l2d1English = new Array(new Array("that"),new Array("of","possessive particle"),new Array("picture","photo"),new Array("this"),new Array("father","dad"),new Array("mother","mom"),new Array("mw for common things"),new Array("female"),new Array("child"),new Array("who"),new Array("she","her"),new Array("older sister"),new Array("male"),new Array("younger brother"),new Array("he","him"),new Array("eldest brother"),new Array("son"),new Array("have","has","exists"),new Array("daughter"),new Array("not"),new Array("a name"),new Array("tall","high","a surname"));
			b1l2d1Grammar = new Array(new Array("pr"),new Array("p"),new Array("n"),new Array("pr"),new Array("n"),new Array("n"),new Array("mw"),new Array("adj"),new Array("n"),new Array("qpr"),new Array("pr"),new Array("n"),new Array("adj"),new Array("n"),new Array("pr"),new Array("n"),new Array("n"),new Array("v"),new Array("n"),new Array("adv"),new Array("pn"),new Array("pn","adj"));
			
			b1l2d2Char = new Array("家","几","口","哥哥","两","妹妹","和","大姐","二姐","做","工作","律师","英文","都","大学生","大学","医生","白英爱");
			b1l2d2Pinyin = new Array("jia1","ji3","kou3","ge1ge0","liang3","mei4mei0","he2","da4jie3","er4jie3","zuo4","gong1zuo4","lu9shi1","ying1wen2","dou1","da4xue2sheng1","da4xue2","yi1sheng1","bai2ying1ai4");
			b1l2d2English = new Array(new Array("family","home"),new Array("how many","some","a few"),new Array("mw for number of family members"),new Array("older brother"),new Array("two","a couple of"),new Array("younger sister"),new Array("and"),new Array("eldest sister"),new Array("second oldest sister"),new Array("to do"),new Array("job","work"),new Array("lawyer"),new Array("English"),new Array("both","all"),new Array("college student"),new Array("college","university"),new Array("doctor","physician"),new Array("a name"));
			b1l2d2Grammar = new Array(new Array("n"),new Array("nu"),new Array("mw"),new Array("n"),new Array("nu"),new Array("n"),new Array("conj"),new Array("n"),new Array("n"),new Array("v"),new Array("n","v"),new Array("n"),new Array("n"),new Array("adv"),new Array("n"),new Array("n"),new Array("n"),new Array("pn"));
			
			b1l2ExtraChar = new Array("商人","军人","教授","经理","工人","工程师","农民","护士","家庭");
			b1l2ExtraPinyin = new Array("shang1ren2","jun1ren2","jiao4shou4","jing1li3","gong1ren2","gong1cheng2shi1","nong2min2","hu4shi0","jia1ting2");
			b1l2ExtraEnglish = new Array(new Array("merchant","businessperson"),new Array("soldier","military officer"),new Array("professor"),new Array("manager"),new Array("worker"),new Array("engineer"),new Array("farmer","peasant"),new Array("nurse"),new Array("family"));
			b1l2ExtraGrammar = new Array(new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"));
			
			b1l2Char=new Array(b1l2d1Char,b1l2d2Char,b1l2ExtraChar);
			b1l2Pinyin=new Array(b1l2d1Pinyin,b1l2d2Pinyin,b1l2ExtraPinyin);
			b1l2English = new Array(b1l2d1English,b1l2d2English,b1l2ExtraEnglish);
			b1l2Grammar = new Array(b1l2d1Grammar,b1l2d2Grammar,b1l2ExtraGrammar);
			
			//Lesson 3
			b1l3d1Char = new Array("九月","月","十二","号","星期","星期四","天","生日","生","日","今年","年","多","大","十八","岁","吃","饭","怎么样","太","了","谢谢","喜欢","菜","还是","可是","我们","点","半","晚上","见","再见","再","英国");
			b1l3d1Pinyin = new Array("jiu3yue4","yue4","shi2er4","hao4","xing1qi1","xing1qi1si4","tian1","sheng1ri4","sheng1","ri4","jin1nian2","nian2","duo1","da4","shi2ba1","sui4","chi1","fan4","zen3me0yang4","tai4","le0","xie4xie0","xi3huan0","cai4","hai2shi0","ke3shi0","wo3men0","dian3","ban4","wan3shang0","jian4","zai4jian4","zai4","ying1guo2");
			b1l3d1English = new Array(new Array("September"),new Array("month"),new Array("twelve"),new Array("mw for days of the month"),new Array("week"),new Array("Thursday"),new Array("day"),new Array("birthday"),new Array("born"),new Array("day","sun"),new Array("this year"),new Array("year"),new Array("many","how many","how much"),new Array("big","old"),new Array("eighteen"),new Array("age","years old"),new Array("eat"),new Array("meal","cooked rice"),new Array("Is that O.K.?","How is that?"),new Array("too","extremely"),new Array("past particle"),new Array("thanks"),new Array("like"),new Array("cuisine","dishes"),new Array("or"),new Array("but"),new Array("we"),new Array("o'clock"),new Array("half","half an hour"),new Array("night","evening"),new Array("see"),new Array("bye","goodbye","see you again"),new Array("again"),new Array("Britain","England"));
			b1l3d1Grammar = new Array(new Array("n"),new Array("n"),new Array("nu"),new Array("mw"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("v"),new Array("n"),new Array("t"),new Array("n"),new Array("adv"),new Array("adj"),new Array("nu"),new Array("n"),new Array("v"),new Array("n"),new Array("qpr"),new Array("p"),new Array("adv"),new Array("v"),new Array("v"),new Array("n"),new Array("conj"),new Array("conj"),new Array("pr"),new Array("mw"),new Array("nu"),new Array("t","n"),new Array("v"),new Array("v"),new Array("adv"),new Array("pn"));
			
			b1l3d2Char = new Array("现在","刻","事","今天","很","忙","明天","晚饭","为什么","为","因为","还","同学","认识","朋友");
			b1l3d2Pinyin = new Array("xian4zai4","ke4","shi4","jin1tian1","hen3","mang2","ming2tian1","wan3fan4","wei3shen2me0","wei4","yin1wei4","hai2","tong2xue2","ren4shi0","peng2you0");
			b1l3d2English = new Array(new Array("now"),new Array("quarter of an hour"),new Array("event","matter","affair"),new Array("today"),new Array("very"),new Array("busy"),new Array("tomorrow"),new Array("dinner","supper"),new Array("why"),new Array("for"),new Array("because"),new Array("also","too","as well"),new Array("classmate"),new Array("to be acquainted with","to know"),new Array("friend"));
			b1l3d2Grammar = new Array(new Array("t"),new Array("mw"),new Array("n"),new Array("t"),new Array("adv"),new Array("adj"),new Array("t"),new Array("n"),new Array("qpr"),new Array("prep"),new Array("conj"),new Array("adv"),new Array("n"),new Array("v"),new Array("n"));
			
			b1l3ExtraChar = new Array("新年","情人节","母亲节","父亲节","感恩节","时间","周","礼拜");
			b1l3ExtraPinyin = new Array("xin1nian2","qing2ren2jie2","mu3qin1jie2","fu4qin1jie2","gan3en1jie2","shi2jian1","zhou1","li3bai4");
			b1l3ExtraEnglish = new Array(new Array("New Year"),new Array("Valentine's Day"),new Array("Mother's Day"),new Array("Father's Day"),new Array("Thanksgiving"),new Array("time"),new Array("week"),new Array("week"));
			b1l3ExtraGrammar = new Array(new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("n"),new Array("n"),new Array("n"));
			
			b1l3Char=new Array(b1l3d1Char,b1l3d2Char,b1l3ExtraChar);
			b1l3Pinyin=new Array(b1l3d1Pinyin,b1l3d2Pinyin,b1l3ExtraPinyin);
			b1l3English = new Array(b1l3d1English,b1l3d2English,b1l3ExtraEnglish);
			b1l3Grammar = new Array(b1l3d1Grammar,b1l3d2Grammar,b1l3ExtraGrammar);
			
			//Lesson 4
			b1l4d1Char = new Array("周末","打球","打","球","看","电视","电","视","唱歌","唱","歌","跳舞","跳","舞","听","音乐","书","对","有的","时候","电影","影","常常","那","去","外国","请客","昨天","所以");
			b1l4d1Pinyin = new Array("zhou3mo4","da3qiu2","da3","qiu2","kan4","dian4shi4","dian4","shi4","chang4ge1","chang4","ge1","tiao4wu3","tiao4","wu3","ting1","yin1yue4","shu1","dui4","you3de0","shi2hou0","dian4ying3","ying3","chang2chang2","na4","qu4","wai4guo2","qing3ke4","zuo2tian1","suo3yi3");
			b1l4d1English = new Array(new Array("weekend"),new Array("play ball"),new Array("hit"),new Array("ball"),new Array("read","look","watch"),new Array("television"),new Array("electricity"),new Array("vision"),new Array("sing a song"),new Array("sing"),new Array("song"),new Array("dance"),new Array("jump"),new Array("dance"),new Array("listen"),new Array("music"),new Array("book"),new Array("right","correct"),new Array("some"),new Array("moment","time"),new Array("movie"),new Array("shadow"),new Array("often"),new Array("then","in that case"),new Array("go"),new Array("foreign country"),new Array("invite","invite someone"),new Array("yesterday"),new Array("so"));
			b1l4d1Grammar = new Array(new Array("n"),new Array("vo"),new Array("v"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("n"),new Array("vo"),new Array("v"),new Array("n"),new Array("vo"),new Array("v"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("adj"),new Array("pr"),new Array("n"),new Array("n"),new Array("n"),new Array("adv"),new Array("conj"),new Array("v"),new Array("n"),new Array("vo"),new Array("t"),new Array("conj"));
			
			b1l4d2Char = new Array("小","好久","好","久","不错","错","想","觉得","有意思","意思","只","睡觉","睡","觉","算了","找","别人","别");
			b1l4d2Pinyin = new Array("xiao3","hao3jiu3","hao3","jiu3","bu2cuo4","cuo4","xiang3","jue2de0","you3yi4si0","yi4si0","zhi3","shui4jiao4","shui4","jiao4","suan4le0","zhao3","bie2ren2","bie2");
			b1l4d2English = new Array(new Array("small","little"),new Array("a long time","long time"),new Array("very"),new Array("long"),new Array("pretty good","not bad"),new Array("wrong"),new Array("want","would like","think"),new Array("feel","think"),new Array("interesting"),new Array("meaning"),new Array("only"),new Array("sleep"),new Array("sleep"),new Array("sleep"),new Array("forget it","never mind"),new Array("look for"),new Array("other people","another person"),new Array("other"));
			b1l4d2Grammar = new Array(new Array("adj"),new Array("na"),new Array("adv"),new Array("adj"),new Array("adj"),new Array("adj"),new Array("mv"),new Array("v"),new Array("adj"),new Array("n"),new Array("adv"),new Array("vo"),new Array("v"),new Array("n"),new Array("na"),new Array("v"),new Array("n"),new Array("adj"));
			
			b1l4ExtraChar = new Array("画画","下棋","上网聊天","玩游戏机","逛街","爱好");
			b1l4ExtraPinyin = new Array("hua4hua4","xia4qi2","shang4wang3liao2tian1","wan2you2xi4ji1","guang4jie1","ai4hao4");
			b1l4ExtraEnglish = new Array(new Array("painting"),new Array("chess"),new Array("online chat"),new Array("play games"),new Array("shopping"),new Array("hobbies"));
			b1l4ExtraGrammar = new Array(new Array("v"),new Array("v"),new Array("v"),new Array("v"),new Array("v"),new Array("n"));
			
			b1l4Char=new Array(b1l4d1Char,b1l4d2Char,b1l4ExtraChar);
			b1l4Pinyin=new Array(b1l4d1Pinyin,b1l4d2Pinyin,b1l4ExtraPinyin);
			b1l4English = new Array(b1l4d1English,b1l4d2English,b1l4ExtraEnglish);
			b1l4Grammar = new Array(b1l4d1Grammar,b1l4d2Grammar,b1l4ExtraGrammar);
			
			//Lesson 5
			b1l5d1Char = new Array("呀","进","快","进来","来","介绍","一下","高兴","漂亮","坐","在","哪儿","学校","喝","点","茶","咖啡","吧","要","瓶","可乐","可以","对不起","给","杯","水","高小音");
			b1l5d1Pinyin = new Array("ya0","jin4","kuai4","jin4lai0","lai2","jie4shao4","yi2xia4","gao1xing4","piao4liang0","zuo4","zai4","nar3","xue2xiao4","he1","dian3","cha2","ka1fei1","ba0","yao4","ping2","ke3le4","ke3yi3","dui4bu0qi3","gei3","bei1","shui3","gao1xiao3yin1");
			b1l5d1English = new Array(new Array("question softener"),new Array("enter"),new Array("fast","quick"),new Array("come in"),new Array("come"),new Array("introduce"),new Array("once","a bit"),new Array("happy","pleased"),new Array("pretty","beautiful"),new Array("sit"),new Array("at","in","on"),new Array("where"),new Array("school"),new Array("drink"),new Array("a little","a bit","some"),new Array("tea"),new Array("coffee"),new Array("sentence suggestion"),new Array("want"),new Array("bottle","mw for bottle"),new Array("cola","coke","pepsi"),new Array("can","may"),new Array("sorry"),new Array("give"),new Array("cup","glass"),new Array("water"),new Array("a name"));
			b1l5d1Grammar = new Array(new Array("p"),new Array("v"),new Array("adv","adj"),new Array("vc"),new Array("v"),new Array("v"),new Array("n"),new Array("adj"),new Array("adj"),new Array("v"),new Array("prep"),new Array("qpr"),new Array("n"),new Array("v"),new Array("mw"),new Array("n"),new Array("n"),new Array("p"),new Array("v"),new Array("mw","n"),new Array("n"),new Array("mv"),new Array("v"),new Array("v"),new Array("mmw"),new Array("n"),new Array("pn"));
			
			b1l5d2Char = new Array("玩","了","图书馆","一起","聊天","聊","天","才","回家","回");
			b1l5d2Pinyin = new Array("wan2","le0","tu2shu1guan3","yi4qi3","liao3tian1","liao2","tian1","cai2","hui2jia1","hui2");
			b1l5d2English = new Array(new Array("have fun","fun","play"),new Array("completed","new situation"),new Array("library"),new Array("together"),new Array("chat"),new Array("chat"),new Array("sky"),new Array("not until","only then"),new Array("go home"),new Array("return"));
			b1l5d2Grammar = new Array(new Array("v"),new Array("p"),new Array("n"),new Array("adv"),new Array("vo"),new Array("v"),new Array("n"),new Array("adv"),new Array("vo"),new Array("v"));
			
			b1l5ExtraChar = new Array("可口可乐","百事可乐","雪碧","汽水","矿泉水","果汁","看朋友");
			b1l5ExtraPinyin = new Array("ke3kou3ke3le4","bai3shi4ke3le4","xue3bi4","qi4shui3","kuang4quan2shui3","guo3zhi1","kan4peng2you0");
			b1l5ExtraEnglish = new Array(new Array("coca-cola","coke"),new Array("pepsi-cola","pepsi"),new Array("sprite"),new Array("soft drink","soda pop","soda"),new Array("mineral water"),new Array("fruit juice"),new Array("visiting friends"));
			b1l5ExtraGrammar = new Array(new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("vo"));
			
			b1l5Char=new Array(b1l5d1Char,b1l5d2Char,b1l5ExtraChar);
			b1l5Pinyin=new Array(b1l5d1Pinyin,b1l5d2Pinyin,b1l5ExtraPinyin);
			b1l5English = new Array(b1l5d1English,b1l5d2English,b1l5ExtraEnglish);
			b1l5Grammar = new Array(b1l5d1Grammar,b1l5d2Grammar,b1l5ExtraGrammar);
			
			//Lesson 6
			b1l6d1Char = new Array("给","打电话","电话","喂","在","就","您","哪","哪","位","下午","时间","问题","要","开会","开","会","上午","节","课","年级","考试","考","试","以后","空","要是","方便","到","帮工室","行","等","别","客气","常老师");
			b1l6d1Pinyin = new Array("gei3","da3dian4hua4","dian4hua4","wei2","zai4","jiu4","nin2","na3","nei3","wei4","xia4wu3","shi2jian1","wen4ti2","yao4","kai1hui4","kai1","hui4","shang4wu3","jie2","ke4","nian2ji2","kao3shi4","kao3","shi4","yi3hou4","kong4","yao4shi0","fang1bian4","dao4","bang4gong1shi4","xing2","deng3","bie2","ke4qi0","chang2lao3shi1");
			b1l6d1English = new Array(new Array("to","for"),new Array("call","make a phone call"),new Array("telephone"),new Array("hello","hey"),new Array("present","at"),new Array("precisely","exactly"),new Array("you"),new Array("which"),new Array("which"),new Array("mw for people"),new Array("afternoon"),new Array("time"),new Array("question","problem"),new Array("will","going to","want to","desire to"),new Array("have a meeting"),new Array("open","hold an event"),new Array("meeting"),new Array("morning"),new Array("mw for class periods"),new Array("class","course","lesson"),new Array("grade in school"),new Array("give a test","take a test","test"),new Array("give a test","take a test"),new Array("test","try","experiment"),new Array("after","from now on","later on"),new Array("free time"),new Array("if"),new Array("convenient"),new Array("go to","arrive"),new Array("office"),new Array("all right","ok"),new Array("wait"),new Array("don't"),new Array("polite"),new Array("Teacher Chang"));
			b1l6d1Grammar = new Array(new Array("prep"),new Array("vo"),new Array("n"),new Array("interj"),new Array("v"),new Array("adv"),new Array("pr"),new Array("qpr"),new Array("qpr"),new Array("mw"),new Array("t"),new Array("n"),new Array("n"),new Array("mv"),new Array("vo"),new Array("v"),new Array("n"),new Array("t"),new Array("mw"),new Array("n"),new Array("n"),new Array("wo","n"),new Array("v"),new Array("n","v"),new Array("t"),new Array("n"),new Array("conj"),new Array("adj"),new Array("v"),new Array("n"),new Array("v"),new Array("v"),new Array("adv"),new Array("adj"),new Array("pn"));
			
			b1l6d2Char = new Array("下个","下","中文","文","帮","准备","练习","说","啊","但是","得","跟","见面","面","回来");
			b1l6d2Pinyin = new Array("xia4ge0","xia4","zhong1wen2","wen2","bang1","zhun3bei4","lian4xi2","shuo1","a0","dan4shi4","dei3","gen1","jian4mian4","mian4","hui2lai0");
			b1l6d2English = new Array(new Array("next one"),new Array("below","next"),new Array("Chinese"),new Array("language","script","written language"),new Array("help"),new Array("prepare"),new Array("practice"),new Array("say","speak"),new Array("sentence-final exclamation","sentence-final interrogation"),new Array("but"),new Array("must","have to"),new Array("with"),new Array("meet up","meet with"),new Array("face"),new Array("come back"));
			b1l6d2Grammar = new Array(new Array("na"),new Array("na"),new Array("n"),new Array("n"),new Array("v"),new Array("v"),new Array("v"),new Array("v"),new Array("p"),new Array("conj"),new Array("av"),new Array("prep"),new Array("vo"),new Array("n"),new Array("vc"));
			
			b1l6ExtraChar = new Array("前天","后天","法文","日文","德文","韩文","俄文","西班牙文","意大利文","葡萄牙文","希腊文","拉丁文","约时间");
			b1l6ExtraPinyin = new Array("qian2tian1","hou4tian1","fa3wen2","ri4wen2","de2wen2","han2wen2","e2wen2","xi1ban1ya2wen2","yi4da4li4wen2","pu2tao2ya2wen2","xi1la4wen2","la1ding1wen2","yue1shi2jian1");
			b1l6ExtraEnglish = new Array(new Array("two days ago"),new Array("two days from now"),new Array("French"),new Array("Japanese"),new Array("German"),new Array("Korean"),new Array("Russian"),new Array("Spanish"),new Array("Italian"),new Array("Portuguese"),new Array("Greek"),new Array("Latin"),new Array("making appointments"));
			b1l6ExtraGrammar = new Array(new Array("t"),new Array("t"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("pn"),new Array("vo"));
			
			b1l6Char=new Array(b1l6d1Char,b1l6d2Char,b1l6ExtraChar);
			b1l6Pinyin=new Array(b1l6d1Pinyin,b1l6d2Pinyin,b1l6ExtraPinyin);
			b1l6English = new Array(b1l6d1English,b1l6d2English,b1l6ExtraEnglish);
			b1l6Grammar = new Array(b1l6d1Grammar,b1l6d2Grammar,b1l6ExtraGrammar);
			
			//Lesson 7
			b1l7d1Char = new Array("说话","话","上个","得","复习","写","字","慢","枝","笔","张","纸","教","怎么","懂","真","哪里","预习","学","第","语法","容易","生词","多","汉字","难");
			b1l7d1Pinyin = new Array("shuo1hua4","hua4","shang4ge0","de0","fu4xi2","xie3","zi4","man4","zhi1","bi3","zhang1","zhi3","jiao1","zen3me0","dong3","zhen1","na3li0","yu4xi2","xue2","di4","yu3fa3","rong2yi4","sheng1ci2","duo1","han4zi4","nan2");
			b1l7d1English = new Array(new Array("talk"),new Array("word","speech"),new Array("previous one"),new Array("descriptive compliment"),new Array("review"),new Array("write"),new Array("character"),new Array("slow"),new Array("mw for long objects","mw for thin objects"),new Array("pen"),new Array("mw for flat objects"),new Array("paper"),new Array("teach"),new Array("how","how come"),new Array("understand"),new Array("really"),new Array("where"),new Array("preview"),new Array("study","learn"),new Array("number prefix"),new Array("grammar"),new Array("easy"),new Array("new words","vocabulary"),new Array("many","much"),new Array("Chinese characters"),new Array("difficult"));
			b1l7d1Grammar = new Array(new Array("vo"),new Array("n"),new Array("na"),new Array("p"),new Array("v"),new Array("v"),new Array("n"),new Array("adj"),new Array("mw"),new Array("n"),new Array("mw"),new Array("n"),new Array("v"),new Array("qpr"),new Array("v"),new Array("adv"),new Array("pr"),new Array("v"),new Array("v"),new Array("prefix"),new Array("n"),new Array("adj"),new Array("n"),new Array("adj"),new Array("n"),new Array("adj"));
			
			b1l7d2Char = new Array("平常","早","这么","晚","早上","功课","大家","上课","开始","念","课文","录音","学习","帅","酷");
			b1l7d2Pinyin = new Array("ping2chang2","zao3","zhe4me0","wan3","zao3shang0","gong1ke4","da4jia1","shang4ke4","kai1shi3","nian4","ke4wen2","lu4yin1","xue2xi2","shuai4","ku4");
			b1l7d2English = new Array(new Array("usually"),new Array("early"),new Array("so","this"),new Array("late"),new Array("morning"),new Array("homework","schoolwork"),new Array("everybody"),new Array("go to class","start class","be in class"),new Array("begin","start","beginning"),new Array("read aloud"),new Array("text of a lesson"),new Array("sound recording","record"),new Array("study","learn"),new Array("handsome"),new Array("cool"));
			b1l7d2Grammar = new Array(new Array("adv"),new Array("adj"),new Array("pr"),new Array("adj"),new Array("t"),new Array("n"),new Array("pr"),new Array("vo"),new Array("v","n"),new Array("v"),new Array("n"),new Array("n","vo"),new Array("v"),new Array("adj"),new Array("adj"));
			
			b1l7ExtraChar = new Array("铅笔","钢笔","毛笔","圆珠笔","本子","练习本","课本","字典","学中文");
			b1l7ExtraPinyin = new Array("qian1bi3","gang1bi3","mao2bi3","yuan2zhu1bi3","ben3zi0","lian4xi2ben3","ke4ben3","zi4dian3","xue2zhong1wen2");
			b1l7ExtraEnglish = new Array(new Array("pencil"),new Array("fountain pen"),new Array("writing brush"),new Array("ballpoint pen"),new Array("notebook"),new Array("exercise book"),new Array("textbook"),new Array("dictionary"),new Array("studying Chinese"));
			b1l7ExtraGrammar = new Array(new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("vo"));
			
			b1l7Char=new Array(b1l7d1Char,b1l7d2Char,b1l7ExtraChar);
			b1l7Pinyin=new Array(b1l7d1Pinyin,b1l7d2Pinyin,b1l7ExtraPinyin);
			b1l7English = new Array(b1l7d1English,b1l7d2English,b1l7ExtraEnglish);
			b1l7Grammar = new Array(b1l7d1Grammar,b1l7d2Grammar,b1l7ExtraGrammar);
			
			//Lesson 8
			b1l8d1Char = new Array("篇","日记","累","起床","床","洗澡","早饭","一边","教室","发音","新","电脑","脑","中午","餐厅","午饭","上网","宿舍","那儿","正在","以前","告诉","已经","知道");
			b1l8d1Pinyin = new Array("pian1","ri4ji4","lei4","qi3chuang2","chuang2","xi3zao3","zao3fan4","yi4bian1","jiao4shi4","fa1yin1","xin1","dian4nao3","nao3","zhong1wu3","can1ting1","wu3fan4","shang4wang3","su4she4","na4er0","zheng4zai4","yi3qian2","gao4su0","yi3jing1","zhi1dao0");
			b1l8d1English = new Array(new Array("mw for essays and articles"),new Array("diary"),new Array("tired"),new Array("get up"),new Array("bed"),new Array("take a bath","take a shower"),new Array("breakfast"),new Array("simultaneously","at the same time"),new Array("classroom"),new Array("pronunciation"),new Array("new"),new Array("computer"),new Array("brain"),new Array("noon"),new Array("cafeteria","dining room"),new Array("lunch"),new Array("go online","surf the internet"),new Array("dormitory"),new Array("there"),new Array("in the middle of"),new Array("before"),new Array("tell"),new Array("already"),new Array("know"));
			b1l8d1Grammar = new Array(new Array("mw"),new Array("n"),new Array("adj"),new Array("vo"),new Array("n"),new Array("vo"),new Array("n"),new Array("adv"),new Array("n"),new Array("n"),new Array("adj"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("vo"),new Array("n"),new Array("pr"),new Array("adv"),new Array("t"),new Array("v"),new Array("adv"),new Array("v"));
			
			b1l8d2Char = new Array("封","信","最近","最","近","学期","除了","以外","专业","会","后来","音乐会","希望","能","用","笑","祝");
			b1l8d2Pinyin = new Array("feng1","xin4","zui4jin4","zui4","jin4","xue2qi1","chu2le0","yi3wai4","zhuan1ye4","hui4","hou4lai2","yin1yue4hui4","xi1wang4","neng2","yong4","xiao4","zhu4");
			b1l8d2English = new Array(new Array("mw for letters"),new Array("letter"),new Array("recently"),new Array("most"),new Array("close","near"),new Array("school term","semester","quarter"),new Array("in addition to","besides"),new Array("also"),new Array("major","specialty"),new Array("can","know how to"),new Array("later"),new Array("concert"),new Array("hope"),new Array("can","able to"),new Array("use"),new Array("laugh at","laugh","smile"),new Array("wish"));
			b1l8d2Grammar = new Array(new Array("mw"),new Array("n"),new Array("t"),new Array("adv"),new Array("adj"),new Array("n"),new Array("conj"),new Array("conj"),new Array("n"),new Array("av"),new Array("t"),new Array("n"),new Array("v","n"),new Array("av"),new Array("v"),new Array("v"),new Array("v"));
			
			b1l8ExtraChar = new Array("历史","经济","化学","数学","物理","语言学","工商管理","亚洲研究","学校生活");
			b1l8ExtraPinyin = new Array("li4shi3","jing1ji4","hua4xue2","shu4xhu2","wu4li3","yu3yan2xue2","gong1shang1guan3li3","ya4zhou1yan2jiu1","xue2xiao4sheng1hou2");
			b1l8ExtraEnglish = new Array(new Array("history"),new Array("economics"),new Array("chemistry"),new Array("mathematics"),new Array("physics"),new Array("linguistics"),new Array("business management"),new Array("Asian studies"),new Array("school life"));
			b1l8ExtraGrammar = new Array(new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"));
			
			b1l8Char=new Array(b1l8d1Char,b1l8d2Char,b1l8ExtraChar);
			b1l8Pinyin=new Array(b1l8d1Pinyin,b1l8d2Pinyin,b1l8ExtraPinyin);
			b1l8English = new Array(b1l8d1English,b1l8d2English,b1l8ExtraEnglish);
			b1l8Grammar = new Array(b1l8d1Grammar,b1l8d2Grammar,b1l8ExtraGrammar);
			
			//Lesson 9
			b1l9d1Char = new Array("商店","买","东西","售货员","衣服","件","衬衫","颜色","黄","红","穿","条","裤子","号","中","便宜","如果","的话","长短","长","短","合适","试","不用","一共","多少","钱","块","毛","分","百","找");
			b1l9d1Pinyin = new Array("shang1dian4","mai3","dong1xi0","shou4huo4yuan2","yi1fu0","jian4","chen4shan1","yan2se4","huang2","hong2","chuan1","tiao2","ku4zi0","hao4","zhong1","pian2yi0","ru2guo3","de0hua4","chang2duan3","chang2","duan3","he2shi4","shi4","bu2yong4","yi2gong4","duo1shao0","qian2","kuai4","mao2","fen1","bai3","zhao3");
			b1l9d1English = new Array(new Array("store","shop"),new Array("buy"),new Array("things","objects"),new Array("shop assistant","salesclerk"),new Array("clothes"),new Array("mw for clothes"),new Array("shirt"),new Array("color"),new Array("yellow"),new Array("red"),new Array("wear","put on"),new Array("mw for long objects","mw for thin objects"),new Array("pants"),new Array("size"),new Array("medium","middle"),new Array("cheap","inexpensive"),new Array("if"),new Array("then"),new Array("length"),new Array("long"),new Array("short"),new Array("suitable"),new Array("try"),new Array("need not"),new Array("altogether"),new Array("how much","how many"),new Array("money"),new Array("mw for money"),new Array("mw for 1/10 of a kuai"),new Array("mw for 1/100 of a kuai"),new Array("hundred"),new Array("give change"));
			b1l9d1Grammar = new Array(new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("n"),new Array("mw"),new Array("n"),new Array("n"),new Array("adj"),new Array("adj"),new Array("v"),new Array("mw"),new Array("n"),new Array("n"),new Array("adj"),new Array("adj"),new Array("conj"),new Array("conj"),new Array("n"),new Array("adj"),new Array("adj"),new Array("adj"),new Array("v"),new Array("na"),new Array("adv"),new Array("qpr"),new Array("n"),new Array("mw"),new Array("mw"),new Array("mw"),new Array("nu"),new Array("v"));
			
			b1l9d2Char = new Array("双","鞋","换","一样","虽然","大小","咖啡色","种","黑","样子","挺","它","这儿","刷卡","刷","卡","收","信用卡","不过","再","付钱","付");
			b1l9d2Pinyin = new Array("shuang1","xie2","huan4","yi2yang4","sui1ran2","da4xiao3","ka1fei1se4","zhong3","hei1","yang4zi0","ting3","ta1","zhe4er0","shua1ka3","shua1","ka3","shou1","xin4yong4ka3","bu2guo4","zai4","fu4qian2","fu4");
			b1l9d2English = new Array(new Array("mw for a pair"),new Array("shoes"),new Array("exchange","change"),new Array("same","alike"),new Array("although"),new Array("size"),new Array("brown","coffee color"),new Array("mw for kinds sorts and types"),new Array("black"),new Array("style"),new Array("very","rather"),new Array("it"),new Array("here"),new Array("pay with a credit card"),new Array("brush","swipe"),new Array("card"),new Array("recieve","accept"),new Array("credit card"),new Array("however","but"),new Array("again"),new Array("pay money"),new Array("pay"));
			b1l9d2Grammar = new Array(new Array("mw"),new Array("n"),new Array("v"),new Array("adj"),new Array("conj"),new Array("n"),new Array("n"),new Array("mw"),new Array("adj"),new Array("n"),new Array("adv"),new Array("pr"),new Array("pr"),new Array("vo"),new Array("v"),new Array("n"),new Array("v"),new Array("n"),new Array("conj"),new Array("adv"),new Array("vo"),new Array("v"));
			
			b1l9ExtraChar = new Array("蓝色","绿色","紫色","分红色","橘红色","灰色","上衣","大衣","毛衣","裙子","夹克","外套","西装","T-恤衫","帽子","袜子","买东西");
			b1l9ExtraPinyin = new Array("lan2se4","lu9se4","zi3se4","fen3hong2se4","ju2hong2se4","hui1se4","shang4yi1","da4yi1","mao2yi1","qun2zi0","jia2ke4","wai4tao4","xi1zhuang1","t-xu4shan1","mao4zi0","wa4zi0","mai3dong1xi0");
			b1l9ExtraEnglish = new Array(new Array("blue"),new Array("green"),new Array("purple"),new Array("pink"),new Array("orange"),new Array("gray"),new Array("upper garmet"),new Array("overcoat"),new Array("wollen sweater"),new Array("skirt"),new Array("jacket"),new Array("outer garmet","coat","jacket"),new Array("suit"),new Array("T-shirt"),new Array("hat","cap"),new Array("socks"),new Array("buying things"));
			b1l9ExtraGrammar = new Array(new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("v"));
			
			b1l9Char=new Array(b1l9d1Char,b1l9d2Char,b1l9ExtraChar);
			b1l9Pinyin=new Array(b1l9d1Pinyin,b1l9d2Pinyin,b1l9ExtraPinyin);
			b1l9English = new Array(b1l9d1English,b1l9d2English,b1l9ExtraEnglish);
			b1l9Grammar = new Array(b1l9d1Grammar,b1l9d2Grammar,b1l9ExtraGrammar);

			//Lesson 10
			b1l10d1Char = new Array("寒假","飞机","飞","机","票","机场","坐","公共汽车","公共","汽车","车","或者","地铁","走","先","站","下车","然后","绿","线","最后","蓝","麻烦","大车","出租汽车","出租","租","开车","开","送");
			b1l10d1Pinyin = new Array("han2jia4","fei1ji1","fei1","ji1","piao4","ji1chang3","zuo4","gong1gong4qi4che1","gong1gong4","qi4che1","che1","huo4zhe3","di4tie3","zou3","xian1","zhan4","xia4che1","ran2hou4","lu9","xian4","zui4hou4","lan2","ma2fan0","da3che1","chu1zu1qi4che1","chu1zu1","zu1","kai1che1","kai1","song4");
			b1l10d1English = new Array(new Array("winter vacation"),new Array("airplane"),new Array("fly"),new Array("machine"),new Array("ticket"),new Array("airport"),new Array("travel by"),new Array("bus"),new Array("public"),new Array("automobile"),new Array("car","vehicle"),new Array("or"),new Array("subway"),new Array("go by the way of","walk"),new Array("first"),new Array("mw for bus stops and other stops"),new Array("get off"),new Array("then"),new Array("green"),new Array("line"),new Array("final","last"),new Array("blue"),new Array("troublesome"),new Array("take a taxi"),new Array("taxi"),new Array("rent out","let"),new Array("rent"),new Array("drive a car"),new Array("drive","operate"),new Array("take","see off","see out"));
			b1l10d1Grammar = new Array(new Array("n"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("n"),new Array("v"),new Array("n"),new Array("adj"),new Array("n"),new Array("n"),new Array("conj"),new Array("n"),new Array("v"),new Array("adv"),new Array("mw"),new Array("vo"),new Array("adv"),new Array("adj"),new Array("n"),new Array("na"),new Array("adj"),new Array("adj"),new Array("vo"),new Array("n"),new Array("v"),new Array("v"),new Array("vo"),new Array("v"),new Array("v"));
			
			b1l10d2Char = new Array("电子邮件","电子","让","花","不好意思","每","城市","特别","高速公路","高速","公路","路","紧张","自己","手机","发短信","新年","快乐");
			b1l10d2Pinyin = new Array("dian4zi3you2jian4","dian4zi3","rang4","hua1","bu4hao3yi4si0","mei3","cheng2shi4","te4bie2","gao1su4gong1lu4","gao1su4","gong1lu4","lu4","jin3zhang1","zi4ji3","shou3ji1","fa1duan3xin4","xin1nian2","kuai4le4");
			b1l10d2English = new Array(new Array("email"),new Array("electron"),new Array("allow","cause"),new Array("spend"),new Array("feel embarrased"),new Array("every","each"),new Array("city"),new Array("especially"),new Array("highway"),new Array("high speed"),new Array("highway","public road"),new Array("road","path"),new Array("nervous","anxious"),new Array("oneself"),new Array("cell phone"),new Array("send a text message","send a short message"),new Array("new year"),new Array("happy"));
			b1l10d2Grammar = new Array(new Array("n"),new Array("n"),new Array("v"),new Array("v"),new Array("na"),new Array("pr"),new Array("n"),new Array("adv"),new Array("n"),new Array("adj"),new Array("n"),new Array("n"),new Array("adj"),new Array("pr"),new Array("n"),new Array("vo"),new Array("n"),new Array("adj"));
			
			b1l10ExtraChar = new Array("走路","坐火车","坐计程车","坐电车","坐船","骑自行车","滓摩托车","交通");
			b1l10ExtraPinyin = new Array("zou3lu4","zuo4huo3che1","zuo4ji4cheng2che1","zuo4dian4che1","zuo4chuan2","qi2zi4xing2che1","zi2mo2tuo1che1","jiao1tong1");
			b1l10ExtraEnglish = new Array(new Array("walk"),new Array("take a train","travel by train"),new Array("take a taxi"),new Array("take a cable car","take a trolley bus","take a tram"),new Array("travel by ship","take a boat"),new Array("ride a bike","ride a bicycle"),new Array("ride a motorcycle"),new Array("transportation"));
			b1l10ExtraGrammar = new Array(new Array("vo"),new Array("vo"),new Array("vo"),new Array("vo"),new Array("vo"),new Array("vo"),new Array("vo"),new Array("n"));
			
			b1l10Char=new Array(b1l10d1Char,b1l10d2Char,b1l10ExtraChar);
			b1l10Pinyin=new Array(b1l10d1Pinyin,b1l10d2Pinyin,b1l10ExtraPinyin);
			b1l10English = new Array(b1l10d1English,b1l10d2English,b1l10ExtraEnglish);
			b1l10Grammar = new Array(b1l10d1Grammar,b1l10d2Grammar,b1l10ExtraGrammar);
			
			//Book 1
			book1Char=new Array(b1introChar,b1l1Char,b1l2Char,b1l3Char,b1l4Char,b1l5Char,b1l6Char,b1l7Char,b1l8Char,b1l9Char,b1l10Char);
			book1Pinyin=new Array(b1introPinyin,b1l1Pinyin,b1l2Pinyin,b1l3Pinyin,b1l4Pinyin,b1l5Pinyin,b1l6Pinyin,b1l7Pinyin,b1l8Pinyin,b1l9Pinyin,b1l10Pinyin);
			book1English=new Array(b1introEnglish,b1l1English,b1l2English,b1l3English,b1l4English,b1l5English,b1l6English,b1l7English,b1l8English,b1l9English,b1l10English);
			book1Grammar=new Array(b1introGrammar,b1l1Grammar,b1l2Grammar,b1l3Grammar,b1l4Grammar,b1l5Grammar,b1l6Grammar,b1l7Grammar,b1l8Grammar,b1l9Grammar,b1l10Grammar);

			//Book 2 Lessons
			//Lesson 11
			b2l11d1Char = new Array("天气","比","下雪","约","公园","滑冰","会","刚才","网上","预报","更","不但","而且","暖和","冷","办","碟");
			b2l11d1Pinyin = new Array("tian1qi4","bi3","xia4xue3","yue1","gong1yuan2","hua2bing1","hui4","gang1cai2","wang3shang0","yu4bao4","geng4","bu2dan4","er2qie3","nuan3huo2","leng3","ban4","die2");
			b2l11d1English = new Array(new Array("weather"),new Array("compared to"),new Array("snow"),new Array("make an appointment"),new Array("park"),new Array("ice skate"),new Array("will"),new Array("just now","a moment ago"),new Array("on the internet"),new Array("forcast"),new Array("even more"),new Array("not only"),new Array("but also"),new Array("warm"),new Array("cold"),new Array("handle","to do"),new Array("disc","small plate","dish","saucer"));
			b2l11d1Grammar = new Array(new Array("n"),new Array("prep","v"),new Array("vo"),new Array("v"),new Array("n"),new Array("vo"),new Array("mv"),new Array("t"),new Array("na"),new Array("v"),new Array("adv"),new Array("conj"),new Array("conj"),new Array("adj"),new Array("adj"),new Array("v"),new Array("n"));

			b2l11d2Char = new Array("那么","好玩","出去","非常","糟糕","下雨","又","面试","回去","冬天","夏天","热","春天","秋天","舒服","加州");
			b2l11d2Pinyin = new Array("na4me0","hao3wan2","chu1qu0","fei1chang2","zao1gao1","xia4yu3","you4","mian4shi4","hui2qu0","dong1tian1","xia4tian1","re4","chun1tian1","qui1tian1","shu1fu0","jia1zhou1");
			b2l11d2English = new Array(new Array("so","such"),new Array("fun","amusing","interesting"),new Array("go out"),new Array("very","extremely","exceedingly"),new Array("in a terrible mess","how terrible"),new Array("rain"),new Array("again"),new Array("interview"),new Array("go back","return"),new Array("winter"),new Array("summer"),new Array("hot"),new Array("spring"),new Array("autumn","fall"),new Array("comfortable"),new Array("California"));
			b2l11d2Grammar = new Array(new Array("pr"),new Array("adj"),new Array("vc"),new Array("adv"),new Array("adj"),new Array("vo"),new Array("adv"),new Array("v","n"),new Array("vc"),new Array("n"),new Array("n"),new Array("adj"),new Array("n"),new Array("n"),new Array("adj"),new Array("pn"));
			
			b2l11ExtraChar = new Array("潮湿","闷热","凉快","晴天","阴天","风","谈天气");
			b2l11ExtraPinyin = new Array("chao2shi1","men1re4","liang2kuai0","qing2tian1","yin1tian1","feng1","tan2tian1qi4");
			b2l11ExtraEnglish = new Array(new Array("wet","humid"),new Array("hot","stifling"),new Array("cool","pleasant"),new Array("sunny"),new Array("overcast"),new Array("wind"),new Array("talking about the weather"));
			b2l11ExtraGrammar = new Array(new Array("adj"),new Array("adj"),new Array("adj"),new Array("n"),new Array("n"),new Array("n"),new Array("vo"));
			
			b2l11Char = new Array(b2l11d1Char,b2l11d2Char,b2l11ExtraChar);
			b2l11Pinyin = new Array(b2l11d1Pinyin,b2l11d2Pinyin,b2l11ExtraPinyin);
			b2l11English = new Array(b2l11d1English,b2l11d2English,b2l11ExtraEnglish);
			b2l11Grammar = new Array(b2l11d1Grammar,b2l11d2Grammar,b2l11ExtraGrammar);
			
			//Lesson 12			
			b2l12d1Char = new Array("饭馆","好象","位子","服务员","服务","桌子","点菜","盘","校子","素","家常","豆腐","放","肉","碗","酸辣汤","酸","辣","汤","味精","盐","白菜","刚","卖完","完","青菜","冰茶","冰","渴","些","够","饿","上菜");
			b2l12d1Pinyin = new Array("fan4guan3","hao3xiang4","wei4zi0","fu2wu4yuan2","fu2wu4","zhuo1zi0","dian3cai4","pan2","jiao3zi0","su4","jia1chang2","dou4fu0","fang4","rou4","wan3","suan1la4tang1","suan1","la4","tang1","wei4jing1","yan2","bai2cai4","gang1","mai4wan2","wan2","qing1cai4","bing1cha2","bing1","ke3","xie1","gou4","e4","shang4cai4");
			b2l12d1English = new Array(new Array("restaurant"),new Array("seem","be like"),new Array("seat"),new Array("waiter","attendant","waitress"),new Array("serve","provide service"),new Array("table"),new Array("order food"),new Array("plate","dish"),new Array("dumpling"),new Array("vegetarian"),new Array("home style"),new Array("tofu","bean curd"),new Array("put","place"),new Array("meat"),new Array("bowl"),new Array("hot and sour soup"),new Array("sour"),new Array("spicy","hot"),new Array("soup"),new Array("MSG","monosodium glutamate"),new Array("salt"),new Array("bok choy"),new Array("just"),new Array("sell out","sold out"),new Array("finished"),new Array("green vegetable"),new Array("ice tea"),new Array("ice"),new Array("thirsty"),new Array("some","measure word for an indefinate amount"),new Array("enough"),new Array("hungry"),new Array("serve food"));
			b2l12d1Grammar = new Array(new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("v"),new Array("n"),new Array("vo"),new Array("n"),new Array("n"),new Array("adj"),new Array("n"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("n"),new Array("adj"),new Array("adj"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("adv"),new Array("vc"),new Array("c"),new Array("n"),new Array("n"),new Array("n"),new Array("adj"),new Array("mw"),new Array("adj"),new Array("adj"),new Array("vo"));
			
			b2l12d2Char = new Array("师傅","好吃","糖醋鱼","糖","醋","甜","酸","极","红烧","牛肉","牛","鱼","凉拌","黄瓜","米饭","忘","带","饭卡","错","清楚","没关系","上海");
			b2l12d2Pinyin = new Array("shi1fu0","hao3chi1","tang2ci4yu2","tang2","cu4","tian2","suan1","ji2","hong2shao1","niu2rou4","niu2","yu2","liang2ban4","huang2gua0","mi3fan4","wang4","dai4","fan4ka3","cuo4","qing1chu0","mei2guan1xi0","shang4hai3");
			b2l12d2English = new Array(new Array("master worker"),new Array("delicious"),new Array("fish in sweet and sour sauce"),new Array("sugar"),new Array("vinegar"),new Array("sweet"),new Array("sour"),new Array("extremely"),new Array("braise in soy sauce"),new Array("beef"),new Array("cow","ox"),new Array("fish"),new Array("cold blended","cold tossed"),new Array("cucumber"),new Array("cooked rice"),new Array("forget"),new Array("bring","take","carry","come with"),new Array("meal card"),new Array("wrong"),new Array("clear"),new Array("it doesn't matter"),new Array("Shanghai"));
			b2l12d2Grammar = new Array(new Array("n"),new Array("adj"),new Array("n"),new Array("n"),new Array("n"),new Array("adj"),new Array("adj"),new Array("adv"),new Array("v"),new Array("n"),new Array("n"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("v"),new Array("v"),new Array("n"),new Array("adj"),new Array("adj"),new Array("na"),new Array("pn"));
			
			b2l12ExtraChar = new Array("鸡","猪肉","羊肉","虾","蛋","胡萝卜","洋葱","宫保鸡丁","麻婆豆腐","蛋花汤","炒面","吃饭");
			b2l12ExtraPinyin = new Array("ji1","zhu1rou4","yang2rou4","xia1","dan4","hu2luo2bo0","yang2cong1","gong1bao3ji1ding1","ma2po2dou4fu0","dan4hua1tang1","chao3mian4","chi1fan4");
			b2l12ExtraEnglish = new Array(new Array("chicken"),new Array("pork"),new Array("lamb","mutton"),new Array("shrimp"),new Array("egg"),new Array("carrot"),new Array("onion"),new Array("Kung Pao chicken"),new Array("Mapo tofu"),new Array("egg drop soup"),new Array("stir-fried noodles"),new Array("dining"));
			b2l12ExtraGrammar = new Array(new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("v"));
			
			b2l12Char = new Array(b2l12d1Char,b2l12d2Char,b2l12ExtraChar);
			b2l12Pinyin = new Array(b2l12d1Pinyin,b2l12d2Pinyin,b2l12ExtraPinyin);
			b2l12English = new Array(b2l12d1English,b2l12d2English,b2l12ExtraEnglish);
			b2l12Grammar = new Array(b2l12d1Grammar,b2l12d2Grammar,b2l12ExtraGrammar);
			
			//Lesson 13			
			b2l13d1Char = new Array("上","中心","听说","运动","场","旁边","远","离","近","活动","中间","书店","地方","里边");
			b2l13d1Pinyin = new Array("shang4","zhong1xin1","ting1shuo1","yun4dong4","chang3","pang2bian1","yuan3","li2","jin4","huo2dong4","zhong1jian1","shu1dian4","di4fang0","li3bian0");
			b2l13d1English = new Array(new Array("go"),new Array("center"),new Array("be told","hear of"),new Array("sports"),new Array("field"),new Array("side"),new Array("far"),new Array("away from"),new Array("near"),new Array("activity"),new Array("middle"),new Array("bookstore"),new Array("place"),new Array("inside"));
			b2l13d1Grammar = new Array(new Array("v"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("n"),new Array("adj"),new Array("prep"),new Array("adj"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"));
			
			b2l13d2Char = new Array("过","中国城","城","地图","拿","次","从","一直","往","南","过","路口","西","拐","哎","东","北","前","红绿灯","灯","右","左","前面","日文","东京","日本");
			b2l13d2Pinyin = new Array("guo0","zhong1guo2cheng2","cheng2","di4tu2","na2","ci4","cong2","yi4zhi2","wang3","nan2","guo4","lu4kou3","xi1","guai3","ai1","dong1","bei3","qian2","hong2lu9deng1","deng1","you4","zuo3","qian2mian0","ri4wen2","dong1jing1","ri4ben3");
			b2l13d2English = new Array(new Array("past experience"),new Array("Chinatown"),new Array("town","city"),new Array("map"),new Array("take","get"),new Array("measure word for frequency"),new Array("from"),new Array("straight","continuously"),new Array("towards"),new Array("south"),new Array("pass"),new Array("intersection"),new Array("west"),new Array("turn"),new Array("expression of surprise or dissatisfaction"),new Array("east"),new Array("north"),new Array("forward","ahead"),new Array("traffic light"),new Array("light"),new Array("right"),new Array("left"),new Array("ahead","in front of"),new Array("Japanese"),new Array("Tokyo"),new Array("Japan"));
			b2l13d2Grammar = new Array(new Array("p"),new Array("n"),new Array("n"),new Array("n"),new Array("v"),new Array("mw"),new Array("prep"),new Array("adv"),new Array("prep"),new Array("n"),new Array("v"),new Array("n"),new Array("n"),new Array("v"),new Array("excl"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("pn"),new Array("pn"),new Array("pn"));
			
			b2l13ExtraChar = new Array("单行道","班马线","天桥","地下通道","问路");
			b2l13ExtraPinyin = new Array("dan1xing2dao4","ban1max3xian4","tian1qiao2","di4xia4tong1dao4","wen4lu4");
			b2l13ExtraEnglish = new Array(new Array("one-way street"),new Array("pedestrian crosswalk","zebra crossing"),new Array("pedestrian overpass"),new Array("pedestrian underpass"),new Array("asking directions"));
			b2l13ExtraGrammar = new Array(new Array("n"),new Array("n"),new Array("n"),new Array("n"),new Array("vo"));
			
			b2l13Char = new Array(b2l13d1Char,b2l13d2Char,b2l13ExtraChar);
			b2l13Pinyin = new Array(b2l13d1Pinyin,b2l13d2Pinyin,b2l13ExtraPinyin);
			b2l13English = new Array(b2l13d1English,b2l13d2English,b2l13ExtraEnglish);
			b2l13Grammar = new Array(b2l13d1Grammar,b2l13d2Grammar,b2l13ExtraGrammar);
			
			/////LAST TEST (pinyin,char,english,grammar)///////////////////
			
			//Book 2
			book2Char=new Array(b2l11Char,b2l12Char,b2l13Char);
			book2Pinyin=new Array(b2l11Pinyin,b2l12Pinyin,b2l13Pinyin);
			book2English=new Array(b2l11English,b2l12English,b2l13English);
			book2Grammar=new Array(b2l11Grammar,b2l12Grammar,b2l13Grammar);
			
			//Db
			dbChar=new Array(book1Char,book2Char);
			dbPinyin=new Array(book1Pinyin,book2Pinyin);
			dbEnglish=new Array(book1English,book2English);
			dbGrammar=new Array(book1Grammar,book2Grammar);
			
		}
		public static function populateChar():void {
			char = new Array();
			for (var a:uint = 0; a<dbChar.length; a++) {//1 database
				for (var b:uint = 0; b<dbChar[a].length; b++) {//2 lessons (intro, l1)
					for (var c:uint = 0; c<dbChar[a][b].length; c++) {//3 parts (d1,d2,extra)
						char=char.concat(dbChar[a][b][c]);
					}
				}
			}
		}
		public static function populatePinyin():void {
			pinyin = new Array();
			for (var a:uint = 0; a<dbPinyin.length; a++) {//1 database
				for (var b:uint = 0; b<dbPinyin[a].length; b++) {//2 lessons (intro, l1)
					for (var c:uint = 0; c<dbPinyin[a][b].length; c++) {//3 parts (d1,d2,extra)
						pinyin=pinyin.concat(dbPinyin[a][b][c]);
					}
				}
			}
		}
		public static function populateEnglish():void {
			english = new Array();
			for (var a:uint = 0; a<dbEnglish.length; a++) {//1 database
				for (var b:uint = 0; b<dbEnglish[a].length; b++) {//2 lessons (intro, l1)
					for (var c:uint = 0; c<dbEnglish[a][b].length; c++) {//3 parts (d1,d2,extra)
						english=english.concat(dbEnglish[a][b][c]);
					}
				}
			}
		}
		public static function populateGrammar():void {
			grammar = new Array();
			for (var a:uint = 0; a<dbGrammar.length; a++) {//1 database
				for (var b:uint = 0; b<dbGrammar[a].length; b++) {//2 lessons (intro, l1)
					for (var c:uint = 0; c<dbGrammar[a][b].length; c++) {//3 parts (d1,d2,extra)
						grammar=grammar.concat(dbGrammar[a][b][c]);
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
			toneCombos=["a0","a1","a2","a3","a4","e0","e1","e2","e3","e4","i0","i1","i2","i3","i4","o0","o1","o2","o3","o4","u0","u1","u2","u3","u4","u5","u6","u7","u8","u9"];
			symbols=new Array();
			symbols=["a","ā","á","ǎ","à","e","ē","é","ě","è","i","ī","í","ǐ","ì","o","ō","ó","ǒ","ò","u","ū","ú","ǔ","ù","ü","ǖ","ǘ","ǚ","ǜ"];
		}
		//Populate Pronounce (symbol pinyin)
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
								if (!toneChanged) {//if haven't seen the first vowel
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
							if(pinyin[a]==pinyin[b]){//check for same pronounciation
								//check if there is another English meaning and merge
								english[b] = mergeArrays(english[a],english[b]);
								grammar[b] = mergeArrays(grammar[a],grammar[b]);
								removeChar(a);
							}
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
			grammar.splice(pos,1);
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
		//Find Chinese Words
		public static function findChineseWords(word:String):Array {
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
			found=sortChineseResults(found,search);
			return found;
		}
		//Find English Words
		public static function findEnglishWords(word:String):Array {
			var found:Array = new Array();
			var search:String=removeNumbers(word);
			while (search!="") {
				for(var a:uint = 0;a<english.length;a++){
					for(var b:uint = 0;b<english[a].length;b++){
						var work:Boolean=true;
						if(removeNumbers(english[a][b].toLowerCase()).substring(0,search.length)!=search){
							work=false;
						}
						if (work) {
							found.push(new Array(char[a],english[a][b]));
						}
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
			found = sortEnglishResults(found,search);
			return found;
		}
		//Sort Chinese Results
		public static function sortChineseResults(found:Array,search:String):Array {//Sorts by length
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
		//Sort English Results
		public static function sortEnglishResults(found:Array,search:String):Array {//Sorts by length
			//found [0] = actual character, [1] english word
			var sorted:Array = new Array();
			if (found.length!=0) {
				var len:uint=found.length;
				var currWordLength:uint=0;
				while (len>0) {//while there are still words to be sorted
					for (var a:uint = 0; a<found.length; a++) {//for all found pinyin
						if(found[a][1].length==currWordLength){
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
		//englishToChinese
		//public static function englishToChinese
	}
}
