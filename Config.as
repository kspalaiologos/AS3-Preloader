package {
	/**
	 * Config class holding most of preloader settings.
	 * You usually won't need to touch Preloader.as
	 * 
	 * @author Kamila "Palaiologos" Szewczyk
	 */
	public class Config {
		/**
		 * File to be loaded by Preloader.
		 */
		public static var fileToLoad:String;
		
		/**
		 * Function to be called when error occurs.
		 */
		public static var onError:Function;
		
		/**
		 * Function to be called when SWF loading was finished.
		 */
		public static var onLoad:Function;
		
		/**
		 * Private constructor to ensure that
		 * class won't be accidentally instantized.
		 */
		function Config() {
			super();
			throw new Error("[PLD] Config was not meant to be instantized.");
		}
	}
}
