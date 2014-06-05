package com.czqsoft.umenganalytics.functions;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.umeng.analytics.MobclickAgent;

public class EventEnd implements FREFunction {

    public static final String TAG = "EventEnd";

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        String eventID = null;
        String label = null;

        try {
            eventID = args[0].getAsString();
            label = args[1].getAsString();

            if(label == null || label == "") {
                MobclickAgent.onEventEnd(context.getActivity(), eventID);
            }else{
                MobclickAgent.onEventEnd(context.getActivity(), eventID, label);
            }

        }catch (Exception e){
            Log.e(TAG, e.toString());
        }

        return null;
    }
}

