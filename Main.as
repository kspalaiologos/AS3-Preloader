package {
	import flash.display.MovieClip;
	
	/**
	 * Class demonstrating basic usage of preloader.
	 * <code>Tracer.swf</code file is provided for quickly testing this tool.
	 * Expected result is it's printing "Hello!".
	 * 
	 * @author Kamila "Palaiologos" Szewczyk
	 */
	public class Main extends MovieClip {
		/**
		 * Preloader object class is using.
		 */
		var preloader:Preloader;
		
		/**
		 * Constructor loading configuration and executing preloader.
		 */
		public function Main() {
			super();
			loadConfig();
			preloader = new Preloader(this);
		}
		
		/**
		 * Function setting up configuration of preloader.
		 */
		public function loadConfig():void {
			Config.fileToLoad = "Tracer.swf";
			Config.onError = function():void {
				
			}
			Config.onLoad = function():void {
				
			}
		}
	}
	
}
