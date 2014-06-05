package com.czqsoft.umenganalytics.functions;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.umeng.analytics.MobclickAgent;

public class InitFunction implements FREFunction {
    public static final String TAG = "UmanalyticsInit";

    @Override
    public FREObject call(FREContext context, FREObject[] args) {
    	Log.e(TAG, "init start!!!!!um");
        String appid = null;
        String channelid = null;
        try {
        	appid = args[0].getAsString();
        	channelid = args[1].getAsString();
        	Boolean debug = args[2].getAsBool();
        	MobclickAgent.setDebugMode(debug);
            MobclickAgent.onResume(context.getActivity(), appid, channelid);
            
            Log.e(TAG, appid + " | " + channelid);
        }catch (Exception e){
            Log.e(TAG, e.toString());
        }

        return null;
    }
}
