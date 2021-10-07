import skyui.widgets.WidgetBase;
import skyui.util.Tween;
import mx.utils.Delegate;

class skyui.widgets.OJazz.OJazzSymbolWidget extends WidgetBase
{

	/* INITIALIZATION */
	var adjustment:Number;
	public var baseWidget: MovieClip;
	public var textWidget: MovieClip;
	public var songTitle: TextField;
	public var songArtist: TextField;
	public var songLengthAndLicense: TextField;
	
	public function OJazzSymbolWidget()
	{
		super();
		_visible = false;
		baseWidget = baseWidget;
		textWidget = baseWidget.textWidget;
		songTitle = baseWidget.textWidget.songTitle;
		songArtist = baseWidget.textWidget.songArtist;
		songLengthAndLicense = baseWidget.textWidget.songLengthAndLicense;
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
		songTitle.text = newSongTitle;
		songArtist.text = newSongArtist;
		songLengthAndLicense.text = newSongLength;
		if (newSongLicense != ""){
			songLengthAndLicense.text += " - "+newSongLicense;
		}
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