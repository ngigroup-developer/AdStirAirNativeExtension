/*
Copyright 2013 UNITED, inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package {
	import flash.events.Event;
	import flash.display.Sprite;
	import com.ad_stir.ane.Adstir;
	import flash.system.Capabilities;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Main extends Sprite {	
		private var adstir:Adstir;
		public function Main() {
			if ( loaderInfo ){
				loaderInfo.addEventListener( Event.INIT, init, false, 0, true );
			}
		}
		
		public function init(e:*) {
			var sp:Sprite = new Sprite();
			sp.graphics.lineStyle(1);
			sp.graphics.moveTo(0, 0);
			sp.graphics.lineTo(20, 20);
			sp.x = 20;
			sp.y = 100;
			this.addChild(sp);
			
			adstir = new Adstir();
			if(adstir.isSupported){
				adstir.media = "30542d70";
				adstir.spot = 1;
				adstir.x = 0;
				adstir.y = 200;
				adstir.show();
			}else{
				 trace("adstir not Supported");
			}
			
		}
		
	}
}
