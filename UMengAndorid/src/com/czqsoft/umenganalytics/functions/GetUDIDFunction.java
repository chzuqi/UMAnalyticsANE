package com.czqsoft.umenganalytics.functions;

import android.content.Context;
import android.telephony.TelephonyManager;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

public class GetUDIDFunction implements FREFunction {
    public static final String TAG = "Get UDID";

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        TelephonyManager tm = (TelephonyManager) context.getActivity().getSystemService(Context.TELEPHONY_SERVICE);
        Log.d(">>>>", "Device ID : " + tm.getDeviceId());

        try {
            return FREObject.newObject(tm.getDeviceId());
        } catch (FREWrongThreadException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return null;
    }
}
