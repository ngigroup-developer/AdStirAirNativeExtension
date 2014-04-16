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

package com.adstir.ane;

import java.util.HashMap;
import java.util.Map;

import android.app.Activity;
import android.util.Log;
import android.view.ViewGroup;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

public class AdstirContext extends FREContext {
	private static final String TAG = "AdstirAne";

	@Override
	public void dispose() {
	}
	
	
	public AdstirContext() {
		super();
		android.util.Log.d("com.adstir.ane.AdstirContext","AdstirContext");
	}
	
	@Override
	public Map<String, FREFunction> getFunctions() {
		android.util.Log.d("com.adstir.ane.AdstirContext","getFunctions");
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		functionMap.put("showView", new FREFunction() {
			@Override
			public FREObject call(FREContext frecontext, FREObject[] args) {
				android.util.Log.d("com.adstir.ane.AdstirContext","showView " + args.length);
				if (args.length == 7) {
					try {
						AdstirContext context = (AdstirContext) frecontext;
						context.show(args[0].getAsString(), args[1].getAsInt(), args[2].getAsInt(), args[3].getAsInt(), args[4].getAsInt(), args[5].getAsInt(), args[6].getAsInt());
					} catch (IllegalStateException e) {
						Log.e(TAG, "", e);
					} catch (FRETypeMismatchException e) {
						Log.e(TAG, "", e);
					} catch (FREInvalidObjectException e) {
						Log.e(TAG, "", e);
					} catch (FREWrongThreadException e) {
						Log.e(TAG, "", e);
					}
				} else {
					Log.e(TAG, "Function args ERROR");
				}

				return null;
			}
		});
		functionMap.put("hideView", new FREFunction() {
			@Override
			public FREObject call(FREContext frecontext, FREObject[] args) {
				android.util.Log.d("com.adstir.ane.AdstirContext","hideView " + args.length);
				if (args.length == 0) {
					AdstirContext context = (AdstirContext) frecontext;
					context.hide();
				} else {
					Log.e(TAG, "Function args ERROR");
				}
				return null;
			}
		});
		return functionMap;
	}

	private com.ad_stir.webview.AdstirMraidView adstir;

	public void show(String media, int spot, int interval, int x, int y, int w, int h) {
		this.hide();
		Activity activity = this.getActivity();
		if (activity != null && adstir == null) {
			float density = activity.getResources().getDisplayMetrics().density;
			adstir = new com.ad_stir.webview.AdstirMraidView(this.getActivity(), media, spot, new com.ad_stir.webview.AdstirMraidView.AdSize(w,h), interval);
			android.widget.FrameLayout topVIew = (android.widget.FrameLayout) this.getActivity().findViewById(android.R.id.content);
			android.widget.FrameLayout.LayoutParams param = new android.widget.FrameLayout.LayoutParams(android.widget.FrameLayout.LayoutParams.WRAP_CONTENT,android.widget.FrameLayout.LayoutParams.WRAP_CONTENT);
			param.setMargins((int)(density * x), (int)(density * y), 0, 0);
			param.gravity = android.view.Gravity.NO_GRAVITY;
			topVIew.addView(adstir, param);
		}
	}

	public void hide() {
		if (adstir != null) {
			ViewGroup topVIew = (ViewGroup) this.getActivity().findViewById(android.R.id.content);
			topVIew.removeView(adstir);
			adstir = null;
		}
	}

}
