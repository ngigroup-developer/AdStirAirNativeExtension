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

package com.ad_stir.ane
{
	import flash.external.ExtensionContext;

	public class Adstir
	{
		private var extensionContext : ExtensionContext = null;
		public function Adstir(){
			super();
			extensionContext = ExtensionContext.createExtensionContext("com.ad-stir.ane.Adstir", null );
		}
		
		public function get isSupported() : Boolean
		{
			return extensionContext ? true : false;
		}
		
		
		public function show():void {
			if (isSupported){
				extensionContext.call("showView", media, spot, x, y);
			}else{
			}
		}
		
		public function hide():void {
			if (isSupported){
				extensionContext.call("hideView");
			}else{
			}
		}
		
		
		
		
		private var _media : String = "";
		public function get media():String {
			return _media;
		}
		public function set media(id:String):void {
			_media = id;
		}
		
		private var _spot : int = 0;
		public function get spot():int {
			return _spot;
		}
		public function set spot(no:int):void {
			_spot = no;
		}
		
		private var _x : int = 0;
		public function get x():int {
			return _x;
		}
		public function set x(value:int):void {
			_x = value;
		}
		
		private var _y : int = 0;
		public function get y():int {
			return _y;
		}
		public function set y(value:int):void {
			_y = value;
		}
		
	}
}

