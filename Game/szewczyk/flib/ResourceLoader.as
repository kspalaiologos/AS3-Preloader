package szewczyk.flib {
	import flash.display.MovieClip;

	public class ResourceLoader {
		private var loader:Loader;
		private var parentClip:MovieClip;
		
		private var _x:int;
		private var _y:int;
		
		public function ResourceLoader(resource:String, parent:MovieClip) {
			loader = new Loader();
			parentClip = parent;

			loader.load(new URLRequest(resource));
			
			parent.addChild(myLoader);
			
			top_btn.addEventListener(MouseEvent.CLICK, loadPhoto);
			last_btn.addEventListener(MouseEvent.CLICK, unloadAny);
		}
		
		function loadPhoto(e:MouseEvent):void {
			myLoader.load(new URLRequest("sailboat.jpg"));
			addChild(myLoader);
		}
			
		function unloadAny(e:MouseEvent):void {
			removeChild(myLoader);
		}
	}
}
