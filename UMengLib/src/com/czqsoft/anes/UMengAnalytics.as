package com.czqsoft.anes
{
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;
	
	
	/**
	 *  使用时必须加入如下权限，APP_KEY在配置文件里写好
	 *  时间都是毫秒
	 *
	 *  <application ……>
	 ……
	 <activity ……/>
	 <meta-data android:value="YOUR_APP_KEY" android:name="UMENG_APPKEY"></meta-data>
	 <meta-data android:value="Channel ID" android:name="UMENG_CHANNEL"/>
	 </application>
	 *  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"></uses-permission>
	 <uses-permission android:name="android.permission.INTERNET"></uses-permission>
	 <uses-permission android:name="android.permission.READ_PHONE_STATE"></uses-permission>
	 <uses-permission android:name="android.permission.READ_LOGS"></uses-permission>
	 *
	 * @author c
	 *
	 */
	public class UMengAnalytics extends EventDispatcher
	{
		private static var _instance:UMengAnalytics;
		private static var extensionContext:ExtensionContext;
		
		public static function get instance():UMengAnalytics
		{
			if (!_instance)
			{
				_instance=new UMengAnalytics();
				if (!extensionContext)
				{
					extensionContext=ExtensionContext.createExtensionContext('com.czqsoft.umenganalytics', null);
				}
			}
			return _instance;
		}
		
		public function getUDID():String
		{
			if (extensionContext)
				return extensionContext.call('getUDID') as String;
			return '';
		}
		
		public function onResume():void
		{
			if (extensionContext)
				extensionContext.call('onResume');
		}
		
		public function StartAnalytics(appkey:String="", channelID:String="", isDebug:Boolean=false):void
		{
			trace("init start", extensionContext)
			if (extensionContext)
				extensionContext.call('startAnaly', appkey, channelID, isDebug);
		}
		
		public function onPause():void
		{
			if (extensionContext)
				extensionContext.call('onPause');
		}
		
		/**
		 * 记录事件
		 * @param eventID
		 * @param label
		 * 
		 */		
		public function event(eventID:String, label:String=null):void
		{
			if (extensionContext)
				extensionContext.call('onEvent', eventID, label);
		}
		/**
		 * 开始标签事件 
		 * @param eventID
		 * @param label
		 * 
		 */		
		public function beginEvent(eventID:String, label:String=null):void
		{
			if (extensionContext)
				extensionContext.call("onEventBegin", eventID, label);
		}
		/**
		 * 结束标签事件 
		 * @param eventID
		 * @param label
		 * 
		 */		
		public function endEvent(eventID:String, label:String=null):void
		{
			if (extensionContext)
				extensionContext.call("onEventEnd", eventID, label);
		}
		
		/**
		 * 进入页面 
		 * @param eventID
		 * @param label
		 * 
		 */		
		public function beginPage(pageName:String):void
		{
			if (extensionContext)
				extensionContext.call("onPageBegin", pageName);
		}
		/**
		 * 退出页面 
		 * @param eventID
		 * @param label
		 * 
		 */		
		public function endPage(pageName:String):void
		{
			if (extensionContext)
				extensionContext.call("onPageEnd", pageName);
		}
	}
}

