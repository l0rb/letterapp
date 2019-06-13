package;

import flixel.FlxState;
import flixel.util.FlxTimer;
import Helper.*;

class FixedTimeState extends FlxState
{
    private var _text:Elements.TheText;
    private var _timer:FlxTimer;
    private var _time_display:Elements.TimeDisplay;
    private var _time_allowed:Float;
    private var _count:Int = 0;

	override public function create():Void
	{
		super.create();
        var tap_area = new Elements.TapArea(listener);
        add(tap_area);
        _text = new Elements.TheText();
        add(_text);
        _timer = new FlxTimer();
        _time_display = new Elements.TimeDisplay();
        add(_time_display);
        _time_allowed = 300;
        _timer.start(_time_allowed, function(Timer:FlxTimer){_time_out();}, 1);
	}
    public function listener()
    {
        _text.change();
        _count += 1;
    }
    public function _time_out()
    {
        //_time_allowed = 10;
        //_count = 0;
        _text.dead();
    }

	override public function update(elapsed:Float):Void
	{
        _time_display.text = floatToStringPrecision(_timer.timeLeft, 2);
		super.update(elapsed);
	}
}
