package com.czqsoft.anes;
import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

/**
 * 
 * @author czq
 *
 */
public class UMAnalyticsExtension implements FREExtension{

    public static final String TAG = "UMengExtension";

    @Override
    public FREContext createContext(String contextType){
         return  new UMAnalyticsContext();
    }

    @Override
    public void dispose(){
    }

    @Override
    public void initialize() {

        Log.d(TAG, "UMengExtension initialized");
    }

}
