package {
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Stage;
	import flash.display.StageScaleMode;

	/**
	 * Main preloader code.
	 * 
	 * @author Kamila "Palaiologos" Szewczyk
	 */
	public class Preloader {
		/**
		 * Private variables used inside code.
		 * <code>total</code> is the amount of bytes waiting to be loaded.
		 * <code>loaded</code> is the amount of bytes loaded.
		 * <code>caller</code> is caller MovieClip.
		 * <code>loader</code> is the SWF loader.
		 */
		private var total:Number = 0;
		private var loaded:Number = 0;
		private var caller:MovieClip;
		private var loader:Loader; 
		
		/**
		 * Constructor setting up global variables.
		 * Please note that preloader is calling <code>stop()</code>.
		 * Caller's <code>scaleMode</code> is set to <code>SHOW_ALL</code> after this method call.
		 * 
		 * @param caller Caller MovieClip.
		 */
		public function Preloader(caller:MovieClip) {
			super();
			caller.stop();
			trace("[PLD] PLD v 1.0, by Kamila Szewczyk (12.2018),licensed under terms of the MIT license.");
			this.caller = caller;
			this.loader = new Loader();
			this.caller.stage.scaleMode = StageScaleMode.SHOW_ALL;
			this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			this.loader.load(new URLRequest(Config.fileToLoad)); 
		}
		
		/**
		 * Update progress bar and progress text.
		 */
		
		private function update():void {
			caller.IBar.scaleX = this.loaded/this.total;
			caller.IProgressText.text = Math.floor((this.loaded / this.total) * 100) + "%";
		}
		
		/**
		 * <code>onProgress</code> event listener. Setting up <code>loaded</code> and <code>total</code>,
		 * and calling <code>update()</code>.
		 */
		
		private function onProgress(evt:ProgressEvent):void {
			this.loaded = evt.bytesLoaded;
			this.total = evt.bytesTotal;
			this.update();
		}
		
		/**
		 * <code>onComplete</code> event listener. It's removing most of the events registered (leaving
		 * <code>onError</code> because it doesn't matter anyway) and loading <code>Config.onLoad</code>
		 */
		
		private function onComplete(evt:Event):void {
			this.loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			Config.onLoad.call();
		}
		
		/**
		 * <code>onError</code> event listener. Tracing error message on output and calling Config'
		 * <code>onError</code> function registered by client application.
		 */
		
		private function onError(evt:IOErrorEvent):void {
			trace("[PLD] Error loading SWF.");
			Config.onError.call();
		}
	}
}
