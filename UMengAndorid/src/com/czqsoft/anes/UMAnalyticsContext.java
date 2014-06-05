package com.czqsoft.anes;
import java.util.HashMap;
import java.util.Map;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.czqsoft.umenganalytics.functions.EventBegin;
import com.czqsoft.umenganalytics.functions.EventEnd;
import com.czqsoft.umenganalytics.functions.EventFunction;
import com.czqsoft.umenganalytics.functions.GetUDIDFunction;
import com.czqsoft.umenganalytics.functions.InitFunction;
import com.czqsoft.umenganalytics.functions.PauseFunction;
import com.czqsoft.umenganalytics.functions.ResumeFunction;
import com.czqsoft.umenganalytics.functions.onPageBegin;
import com.czqsoft.umenganalytics.functions.onPageEnd;

/**
 * 
 * @author czq
 *
 */
public class UMAnalyticsContext extends FREContext {

    public static final String TAG = "UMengContext";

    @Override
    public void dispose() {
        Log.d(TAG, "Context disposed");
    }

    @Override
    public Map<String, FREFunction> getFunctions() {
        Map<String, FREFunction> functions = new HashMap<String, FREFunction>();

        functions.put("onResume", new ResumeFunction());
        functions.put("onPause", new PauseFunction());
        functions.put("onEvent", new EventFunction());
        functions.put("onEventBegin", new EventBegin());
        functions.put("onEventEnd", new EventEnd());
        functions.put("startAnaly", new InitFunction());
        functions.put("getUDID", new GetUDIDFunction());
        functions.put("onPageBegin", new onPageBegin());
        functions.put("onPageEnd", new onPageEnd());

        return functions;
    }

}
