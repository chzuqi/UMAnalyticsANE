package com.czqsoft.umenganalytics.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.umeng.analytics.MobclickAgent;

public class PauseFunction implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        MobclickAgent.onPause(context.getActivity());

        return null;
    }

}
