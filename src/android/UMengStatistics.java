package com.mobishift.umengstatistics;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.umeng.analytics.MobclickAgent;

/**
 * This class echoes a string called from JavaScript.
 */
public class UMengStatistics extends CordovaPlugin {
    private static final String PAGE_START = "pageStart";
    private static final String PAGE_END = "pageEnd";
    private static final String PAGE_EVENT = "pageEvent";

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if(action.equals(PAGE_START)){
            String pageName = args.getString(0);
            MobclickAgent.onPageStart(pageName);
            return true;
        }else if(action.equals(PAGE_END)){
            String pageName = args.getString(0);
            MobclickAgent.onPageEnd(pageName);
            return true;
        }else if(action.equals(PAGE_EVENT)){
            String eventId = args.getString(0);
            MobclickAgent.onEvent(this.cordova.getActivity(), eventId);
        }
        return false;
    }

}
