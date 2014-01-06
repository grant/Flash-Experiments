//Functions
/*
toSmile();
toFlat();
toFrown();
toTalk(frames:uint);
//
toBlink();
toOpen();
toHalf();
toClosed();
toWink(eye:MovieClip);
//
toUp();
toNormal();
toDown();
*/
//Notes:
//Random Character:
//par.addSpeech(Db.getChar(Db.pinyin[Math.ceil(Math.random()*Db.char.length)-1]),true,false,320,390);
package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class Henry extends MovieClip {
		//Const
		private const talkSwitchSpeed:uint = 12;
		private const levitationSpeed:Number = .03;
		private const levitationMagnitude:uint = 10;
		
		//Vars
		private var defaultY:uint;
		
		//Default Emotion Frames
		//Mouth
		private const frown:uint = 1;
		private const flat:uint = 5;
		private const smile:uint = 9;
		private const talk1:uint = 10;
		private const talk2:uint = 11;
		//Eyes
		private const openEye:uint = 1;
		private const halfEye:uint = 6;
		private const closedEye:uint = 10;
		//Eyebrows
		private const down:uint = 1;
		private const normal:uint = 5;
		private const up:uint = 10;
		
		private var eyeState:uint = openEye;
		private var smileState:uint = flat;
		private var winkEye:MovieClip;
		private var talking:Boolean = false;
		
		private var par:MovieClip;
		
		public function Henry(px:uint,py:uint):void {
			defaultY = py;
			x=px;
			y=py;
			setDefaultEmotion();
			setEventListeners();
		}
		//Set Default Emotions
		private function setDefaultEmotion():void {
			//Default Face Positions
			leftEyebrow.gotoAndStop(normal);
			rightEyebrow.gotoAndStop(normal);
			leftEye.gotoAndStop(openEye);
			rightEye.gotoAndStop(openEye);
			mouth.gotoAndStop(flat);
		}
		//Set Event Listeners
		private function setEventListeners():void {
			addEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		private function onAdd(e:Event):void {
			par = MovieClip(parent);
			addEventListener(Event.ENTER_FRAME,levitate);
			stage.addEventListener(MouseEvent.CLICK,onClick);
			par.addSpeech(AI.findReply("",par.speechBoxes.length),false,true,330,370);
			addBlank();
			removeEventListener(Event.ADDED_TO_STAGE,onAdd);
		}
		//Levitation
		private var i:uint = 0;
		private function levitate(e:Event):void {
			y = defaultY+(Math.sin(i*levitationSpeed)*levitationMagnitude);
			i++;
		}
		//Mouth Movement//
		//Smile
		private function toSmile():void {
			if(mouth.currentFrame!=smile&&!talking){
				smileState = smile;
				mouth.play();
				addEventListener(Event.ENTER_FRAME,checkSmile);
			}
		}
		private function checkSmile(e:Event):void {
			if(mouth.currentFrame==smile||talking){
				mouth.stop();
				removeEventListener(Event.ENTER_FRAME,checkSmile);
			}
		}
		//Flat
		private function toFlat():void {
			if(!talking){
				smileState = flat;
				addEventListener(Event.ENTER_FRAME,checkFlat);
			}
		}
		private function checkFlat(e:Event):void {
			if(mouth.currentFrame==flat||talking){
				removeEventListener(Event.ENTER_FRAME,checkFlat);
			} else if(mouth.currentFrame<flat){
				mouth.gotoAndStop(mouth.currentFrame+1);
			} else {
				mouth.gotoAndStop(mouth.currentFrame-1);
			}
		}
		//Frown
		private function toFrown():void {
			if(!talking){
				smileState=frown;
				addEventListener(Event.ENTER_FRAME,checkFrown);
			}
		}
		private function checkFrown(e:Event):void {
			if(mouth.currentFrame==frown||talking){
				removeEventListener(Event.ENTER_FRAME,checkFrown);
			} else {
				mouth.gotoAndStop(mouth.currentFrame-1);
			}
		}
		//Talk
		private var talkingTime:uint=talkSwitchSpeed;
		private function toTalk(time:Number){
			talkingTime=time;
			addEventListener(Event.ENTER_FRAME,makeTalk);
		}
		private var talkSwitch:uint = 0;
		private function makeTalk(e:Event):void {
			if(talkingTime<=0){
				mouth.gotoAndStop(smileState);
				removeEventListener(Event.ENTER_FRAME,makeTalk);
			} else {
				talkingTime--;
				if(talkSwitch==0){
					talkSwitch=talkSwitchSpeed;
					if(mouth.currentFrame==talk1){
						mouth.gotoAndStop(talk2);
					} else {
						mouth.gotoAndStop(talk1);
					}
				} else {
					talkSwitch--;
				}
			}
		}
		//Eye Movement//
		//Blink
		private function toBlink():void {
			addEventListener(Event.ENTER_FRAME,makeBlink);
		}
		private var blinkUp:Boolean = false;
		private function makeBlink(e:Event):void {
			if(!blinkUp){//going down
				if(leftEye.currentFrame==closedEye&&rightEye.currentFrame==closedEye){//closed
					if(eyeState==closedEye){
						blinkUp=false;
						removeEventListener(Event.ENTER_FRAME,makeBlink);
					} else {
						blinkUp=true;
						leftEye.gotoAndStop(Math.abs(leftEye.totalFrames/2));
						rightEye.gotoAndStop(Math.abs(rightEye.totalFrames/2));
					}
				} else if(leftEye.currentFrame==openEye&&rightEye.currentFrame==openEye){//open
					leftEye.gotoAndStop(Math.abs(leftEye.totalFrames/2));
					rightEye.gotoAndStop(Math.abs(rightEye.totalFrames/2));
				} else {//half
					leftEye.gotoAndStop(closedEye);
					rightEye.gotoAndStop(closedEye);
				}
			} else {
				if(leftEye.currentFrame==eyeState&&rightEye.currentFrame==eyeState){
					blinkUp=false;
					removeEventListener(Event.ENTER_FRAME,makeBlink);
				} else {
					leftEye.gotoAndStop(openEye);
					rightEye.gotoAndStop(openEye);
				}
			}
		}
		//Open
		private function toOpen():void {
			eyeState = openEye;
			addEventListener(Event.ENTER_FRAME,makeOpen);
		}
		private function makeOpen(e:Event):void {
			if(leftEye.currentFrame!=openEye&&rightEye.currentFrame!=openEye){
				leftEye.gotoAndStop(leftEye.currentFrame-1);
				rightEye.gotoAndStop(rightEye.currentFrame-1);
			}
		}
		//Half
		private function toHalf():void {
			eyeState = halfEye
			addEventListener(Event.ENTER_FRAME,makeHalf);
		}
		private function makeHalf(e:Event):void {
			if(leftEye.currentFrame==halfEye&&rightEye.currentFrame==halfEye){
				removeEventListener(Event.ENTER_FRAME,makeHalf);
			} else if(leftEye.currentFrame<halfEye&&rightEye.currentFrame<halfEye){
				leftEye.gotoAndStop(leftEye.currentFrame+1);
				rightEye.gotoAndStop(rightEye.currentFrame+1);
			} else {
				leftEye.gotoAndStop(leftEye.currentFrame-1);
				rightEye.gotoAndStop(rightEye.currentFrame-1);
			}
		}
		//Closed
		private function toClosed():void {
			if(leftEye.currentFrame!=closedEye&&rightEye.currentFrame!=closedEye){
				eyeState = closedEye;
				leftEye.play();
				rightEye.play();
				addEventListener(Event.ENTER_FRAME,makeClosed);
			}
		}
		private function makeClosed(e:Event):void {
			if(leftEye.currentFrame==closedEye&&rightEye.currentFrame==closedEye){
				leftEye.stop();
				rightEye.stop();
				removeEventListener(Event.ENTER_FRAME,makeClosed);
			}
		}
		//Wink
		private function toWink(eye:MovieClip):void {
			winkEye = eye;
			if(winkEye.currentFrame!=closedEye){
				addEventListener(Event.ENTER_FRAME,makeWink);
			}
		}
		private var winkUp:Boolean = false;
		private function makeWink(e:Event):void {
			if(!winkUp){
				if(winkEye.currentFrame==closedEye){
					winkEye.stop();
					winkUp=true;
				} else if(winkEye.currentFrame+3>winkEye.totalFrames){
					winkEye.gotoAndStop(winkEye.totalFrames);
				} else {
					winkEye.gotoAndStop(winkEye.currentFrame+3);
				}
			} else {
				if(winkEye.currentFrame==eyeState){
					winkUp=false;
					removeEventListener(Event.ENTER_FRAME,makeWink);
				} else if(winkEye.currentFrame-3<eyeState){
					winkEye.gotoAndStop(eyeState);
				} else {
					winkEye.gotoAndStop(winkEye.currentFrame-3);
				}
			}
		}
		//Eyebrow Movement//
		//toUp
		private function toUp():void {
			if(leftEyebrow.currentFrame!=up&&rightEyebrow.currentFrame!=up){
				leftEyebrow.play();
				rightEyebrow.play();
				addEventListener(Event.ENTER_FRAME,makeUp);
			}
		}
		private function makeUp(e:Event):void {
			if(leftEyebrow.currentFrame==up&&rightEyebrow.currentFrame==up){
				leftEyebrow.stop();
				rightEyebrow.stop();
				removeEventListener(Event.ENTER_FRAME,makeUp);
			}
		}
		//Normal
		private function toNormal():void {
			addEventListener(Event.ENTER_FRAME,makeNormal);
		}
		private function makeNormal(e:Event):void {
			if(leftEyebrow.currentFrame==normal&&rightEyebrow.currentFrame==normal){
				removeEventListener(Event.ENTER_FRAME,checkFlat);
			} else if(leftEyebrow.currentFrame<normal&&rightEyebrow.currentFrame<normal){
				leftEyebrow.gotoAndStop(leftEyebrow.currentFrame+1);
				rightEyebrow.gotoAndStop(rightEyebrow.currentFrame+1);
			} else {
				leftEyebrow.gotoAndStop(leftEyebrow.currentFrame-1);
				rightEyebrow.gotoAndStop(rightEyebrow.currentFrame-1);
			}
		}
		//Down
		private function toDown():void {
			addEventListener(Event.ENTER_FRAME,makeDown);
		}
		private function makeDown(e:Event):void {
			if(leftEyebrow.currentFrame==down&&rightEyebrow.currentFrame==down){
				removeEventListener(Event.ENTER_FRAME,makeDown);
			} else {
				leftEyebrow.gotoAndStop(leftEyebrow.currentFrame-1);
				rightEyebrow.gotoAndStop(rightEyebrow.currentFrame-1);
			}
		}
		//
		private function onClick(e:MouseEvent):void {
			toSmile();
			toWink(leftEye);
			toUp();
		}
		private function addBlank():void {
			par.addEmptySpeech();
		}
	}
}