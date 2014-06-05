package
{
	import com.czqsoft.anes.UMengAnalytics;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class UMAnalyticsTest extends Sprite
	{
		public function UMAnalyticsTest()
		{
			super();
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			UMengAnalytics.instance.StartAnalytics("5371881856240b165404ec84", "asd", true);
			UMengAnalytics.instance.event("gogogogogogo");
		}
	}
}