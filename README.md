AdStir Adobe AIR Native Extensions (ANE)
=========================
AdStir
 http://ad-stir.com/

AdStir Developer's Guide
 http://wiki.ad-stir.com/

License
----------------
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

Usage
----------------
1. Create build.properties file in top directory.
2. Create local.properties file in android directory.
3. Copy adstirwebview.jar in android/libs directory.
4. Copy libAdstirWebView.a,AdstirWebView.h in ios/AdStirSDK directory.
5. Run ant command file in top directory.

Build Command
----------------
1. git clone https://github.com/ngigroup-developer/AdStirAirNativeExtension.git 
2. cd AdStirAirNativeExtension
3. cp build.properties.sample build.properties
4. vi build.properties
5. android update lib-project -p android
6. cp /***/adstirwebview.jar android/libs/
7. cp /***/libAdstirWebView.a ios/AdStirSDK/
8. cp /***/AdstirWebView.h ios/AdStirSDK/
9. ant

Example
----------------
View example directory.
