package com.czqsoft.umenganalytics.functions;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

import com.umeng.analytics.MobclickAgent;

public class ResumeFunction implements FREFunction {

    public static final String TAG = "ResumeFunction";

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        MobclickAgent.onResume(context.getActivity());
        Log.d(TAG, "Resumed");

        return null;
    }

}
