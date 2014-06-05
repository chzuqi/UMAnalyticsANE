package com.czqsoft.umenganalytics.functions;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.umeng.analytics.MobclickAgent;

public class EventFunction implements FREFunction {

    public static final String TAG = "EventFunction";

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        String eventID = null;
//        Map<String, String> keyValues = null;
        String label = null;
//        HashMap<String, String> map = null;

        try {
            eventID = args[0].getAsString();
            label = args[1].getAsString();
        } catch (Exception e) {
            Log.e(TAG, "GetEventID:" + e.toString());
        }
//        try {
//            Log.e(TAG, "Maps:" + args[2]);
//            FREArray array = (FREArray) args[2];
//            Log.e(TAG, "Maps Array:" + array.getLength());
//            if (array != null) {
//                map = new HashMap<String, String>();
//                for (int i = 0; i < array.getLength(); i++) {
//                    FREObject o = array.getObjectAt(i);
//                    FREObject key = o.getProperty("key");
//                    FREObject value = o.getProperty("value");
//                    map.put(key.getAsString(), value.getAsString());
//                }
//            }
//        } catch (Exception e) {
//            Log.e(TAG, "GetMap:" + e.toString());
//        }


        /*if (map != null) {
            Log.e(TAG, map.toString());
            MobclickAgent.onEvent(context1, eventID, map);
        }else */
        if (label != null && label != "") {
            Log.e(TAG, eventID + label);
            MobclickAgent.onEvent(context.getActivity(), eventID, label);
        }else {
            Log.e(TAG, eventID);
            MobclickAgent.onEvent(context.getActivity(), eventID);
        }

        return null;
    }

}
