package szewczyk.flib {
	import flash.display.MovieClip;
	import flash.display.Loader;

	public class ResourceLoader {
		private var loader:Loader;
		private var parentClip:MovieClip;
		private var loadedResource:String;
		
		public function ResourceLoader(resource:String, parent:MovieClip) {
			loader = new Loader();
			parentClip = parent;
			loadedResource = resource;
		}
		
		public function set x(newX:int):void {
			loader.x = newX;
		}
		
		public function set y(newY:int):void {
			loader.y = newY;
		}
		
		public function set z(newZ:int):void {
			loader.z = newZ;
		}
		
		public function set height(newH:int):void {
			loader.height = newH;
		}
		
		public function set width(newW:int):void {
			loader.width = newW;
		}
		
		public function set alpha(newA:int):void {
			loader.alpha = newA;
		}
		
		public function get x():int {
			return loader.x;
		}
		
		public function get y():int {
			return loader.y;
		}
		
		public function get z():int {
			return loader.z;
		}
		
		public function get height():int {
			return loader.height;
		}
		
		public function get width():int {
			return loader.width;
		}
		
		public function get alpha():int {
			return loader.alpha;
		}
		
		public function load():void {
			loader.load(new URLRequest(resource));
			parent.addChild(loader);
		}
		
		public function unload():void {
			parentClip.removeChild(loader);
		}
	}
}
