package com.czqsoft.umenganalytics.functions;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.umeng.analytics.MobclickAgent;

public class onPageBegin implements FREFunction {

	public static final String TAG = "PageBegin";
	
	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		String page = null;

        try {
        	page = args[0].getAsString();

            MobclickAgent.onPageStart(page);

        }catch (Exception e){
            Log.e(TAG, e.toString());
        }

        return null;
	}

}
