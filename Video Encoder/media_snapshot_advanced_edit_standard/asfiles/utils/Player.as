package asfiles.utils

{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import asfiles.events.MetaEvent;
	import asfiles.events.PlayerEvent;
	import asfiles.events.SliderEvent;
	import flash.utils.Timer;
    import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	
	public class Player extends Sprite
	
	{
		
        private var __nConnection:NetConnection;
        private var __nStream:NetStream;
        private var __vVideo:Video;
        private var __sVideo:String;
        private var __nDuration:Number;
        private var __tTimer:Timer;
        private var __bPaused:Boolean;
		
		private var __nWidth:Number;
		private var __nHeight:Number;
		
		public function Player ()
		
		{
			
			__tTimer = new Timer(800, 0);
			
            __tTimer.addEventListener(TimerEvent.TIMER, timerHandler);
			
			__nConnection = new NetConnection();
			
            __nConnection.addEventListener (NetStatusEvent.NET_STATUS, netStatusHandler);
			
            __nConnection.addEventListener (SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			
            __nConnection.connect(null);
			
		}
		
		private function netStatusHandler(event:NetStatusEvent):void
		
		{
			
            if ( event.info.code == "NetConnection.Connect.Success" ) prepareStream();
				
			else if ( event.info.code == "NetStream.Play.StreamNotFound" ) trace("Unable to locate video: " + __sVideo);
			
		}
		
		private function prepareStream():void
		
		{
			
            __nStream = new NetStream (__nConnection);
			
            __nStream.addEventListener (NetStatusEvent.NET_STATUS, netStatusHandler);
			
			__nStream.client = this;
			
            __vVideo = new Video();
			
            __vVideo.attachNetStream (__nStream);
			
        }
		
		public function onMetaData ( pMeta ):void 
		
		{
			
			__nDuration = pMeta.duration;
			
			__nWidth = pMeta.width;
			
			__nHeight = pMeta.height;
			
			setSize ( pMeta.width, pMeta.height );
			
			dispatchEvent ( new MetaEvent ( MetaEvent.ON_META, pMeta  ) );
			
            addChild (__vVideo);
			
		}
		
		private function securityErrorHandler(pError:SecurityErrorEvent):void
		
		{
			
            dispatchEvent ( new MetaEvent ( MetaEvent.ON_META, pError ) );
			
        }
		
		public function play ( pFile:String ):void 
		
		
		{
						
            __nStream.play ( __sVideo = pFile );
			
			__tTimer.start();
			
		}
		
		public function pause ( ):void 
		
		
		{
						
            __nStream.togglePause();
			
			__bPaused = !__bPaused;
			
		}
		
		private function timerHandler ( pEvt:TimerEvent ):void 
		
		{
			
			dispatchEvent ( new PlayerEvent ( PlayerEvent.ON_PROGRESS, __nStream.time ) );
			
			if ( __nStream.time >= __nDuration ) __tTimer.stop();
			
		}
		
		public function onMouseIsDown ( pEvt ):void 
		
		{
			
			__nStream.pause();
			
			__tTimer.stop();
			
		}
		
		public function setSize ( pWidth:Number, pHeight:Number ):void 
		
		{
					
			__vVideo.width = pWidth;
			
			__vVideo.height = pHeight;
			
		}
		
		public function seek ( pTiming:Number ):void 
		
		{
			
			__nStream.seek ( pTiming );
			
		}
		
		public function onMovin ( pEvt:SliderEvent ):void 

		{
			
			__nStream.seek ( pEvt.value );
			
		}
		
		public function onMouseIsUp ( pEvt:Event ):void 
		
		{
			
			if ( !__bPaused ) __nStream.resume();
			
			__tTimer.start();
			
		}
		
		override public function get width ():Number 
		
		{
			
			return __nWidth;
			
		}
		
		override public function get height ():Number 
		
		{
			
			return __nHeight;
			
		}
		
	}
	
}