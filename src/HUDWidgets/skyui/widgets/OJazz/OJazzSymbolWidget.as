import skyui.widgets.WidgetBase;
import skyui.util.Tween;
import mx.utils.Delegate;

class skyui.widgets.OJazz.OJazzSymbolWidget extends WidgetBase
{

	/* INITIALIZATION */
	var adjustment:Number;
	public var widget: MovieClip;
	public var baseWidget: MovieClip;
	public var textWidget: MovieClip;
	public var songTitle: MovieClip;
	
	public function OJazzWidget()
	{
		super();
		_visible = false;
		baseWidget = widget.baseWidget;
		textWidget = widget.baseWidget.TextWidget;
		songTitle = widget.baseWidget.TextWidget.songTitle;
	}


	/* PUBLIC FUNCTIONS */

	// @overrides WidgetBase
	public function getWidth():Number
	{
		return _width;
	}

	// @overrides WidgetBase
	public function getHeight():Number
	{
		return _height;
	}

	public function startWidget(newSongTitle:String, newSongArtist:String, newSongLength:String, newSongLicense:String):Void
	{
		setVisible(true);
		textWidget._visible = !_visible;
		textWidget.songArtist._visible = !_visible;
		textWidget.songTitle.text = "test";
		textWidget.songArtist.text = newSongArtist;
		textWidget.songLength.text = newSongLength;
		textWidget.songLicense.text = newSongLicense;
	}

	// @Papyrus
	public function setVisible(a_visible:Boolean):Void
	{
		_visible = a_visible;
	}

	public function FlashVisibility(fade_time:Number):Void
	{
		setVisible(true);
		_alpha = 100;
		var onCompleteFlash:Function = Delegate.create(this, function (){if (_alpha == 0){_visible = false;_alpha = 100;}});
		Tween.LinearTween(this,"_alpha",100,0,fade_time,onCompleteFlash);
	}
}