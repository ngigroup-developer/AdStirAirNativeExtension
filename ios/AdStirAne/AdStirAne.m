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

#import "AdStirAne.h"
#import "AdstirWebView.h"

FREObject AdstirAneShowView( FREContext ctx, void* funcData, uint32_t argc, FREObject arg[] ){
	if (argc == 7) {
		NSLog(@"AdstirAneShowView");
		
		void* adstirvoid;
		FREGetContextNativeData(ctx,&adstirvoid);
		AdstirWebView* adstir = adstirvoid;
		[adstir removeFromSuperview];
		[adstir release];
		FRESetContextNativeData(ctx,nil);
		
		uint32_t length = 0;
		const uint8_t* media = NULL;
		FREGetObjectAsUTF8(arg[0],&length,&media);
		
		int32_t spot = 0;
		FREGetObjectAsInt32(arg[1],&spot);
		
		int32_t time = 0;
		FREGetObjectAsInt32(arg[2],&time);
		
		int32_t x = 0;
		FREGetObjectAsInt32(arg[3],&x);
		
		int32_t y = 0;
		FREGetObjectAsInt32(arg[4],&y);
		
		int32_t w = 0;
		FREGetObjectAsInt32(arg[5],&w);
		
		int32_t h = 0;
		FREGetObjectAsInt32(arg[6],&h);
		
		AdstirWebView* adstir2 = [[AdstirWebView alloc]initWithFrame:CGRectMake(x, y, w, h) media:[NSString stringWithUTF8String:(const char*)media] spot:[NSString stringWithFormat:@"%d",spot]];
		adstir2.intervalTime = time;
		UIWindow* win = [[UIApplication sharedApplication] keyWindow];
		
		FRESetContextNativeData(ctx,adstir2);
		
		[win addSubview:adstir2];
		
	} else {
		NSLog(@"AdstirAneShowView arg ERROR");
	}
	return NULL;
}


FREObject AdstirAneHideView( FREContext ctx, void* funcData, uint32_t argc, FREObject arg[] ){
	if(argc == 0){
		NSLog(@"AdstirAneHideView");
		void* adstirvoid;
		FREGetContextNativeData(ctx,&adstirvoid);
		AdstirWebView* adstir = adstirvoid;
		[adstir removeFromSuperview];
		[adstir release];
		FRESetContextNativeData(ctx,nil);
	}
	return NULL;
}


//FREContextInitializer
void AdstirAneContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet ){
	NSLog(@"AdstirAneContextInitializer");
	
	int FINCTION_NUM = 2;
	*numFunctionsToTest = FINCTION_NUM;
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction)*FINCTION_NUM);
	
	func[0].name = (const uint8_t*)"showView";
	func[0].functionData = NULL;
	func[0].function = &AdstirAneShowView;
	
	func[1].name = (const uint8_t*)"hideView";
	func[1].functionData = NULL;
	func[1].function = &AdstirAneHideView;
	
	*functionsToSet = func;
}

//FREContextFinalizer
void AdstirAneContextFinalizer(FREContext ctx) {
	NSLog(@"AdstirAneContextFinalizer");
	void* adstirvoid;
	FREGetContextNativeData(ctx,&adstirvoid);
	AdstirWebView* adstir = adstirvoid;
	[adstir removeFromSuperview];
	[adstir release];
	FRESetContextNativeData(ctx,nil);
	return;
}

//FREInitializer
void AdstirAneInitializer(
						  void**                 extDataToSet       ,
						  FREContextInitializer* ctxInitializerToSet,
						  FREContextFinalizer*   ctxFinalizerToSet
){
    extDataToSet = NULL;
    *ctxInitializerToSet = &AdstirAneContextInitializer;
    *ctxFinalizerToSet = &AdstirAneContextFinalizer;
}

//FREFinalizer
void AdstirAneFinalizer(
							   void* extData
) {
	return;
}





