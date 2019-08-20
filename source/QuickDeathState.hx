package;

import flixel.FlxState;
import flixel.util.FlxTimer;
import Helper.*;

class QuickDeathState extends FlxState
{
    private static var _start_time:Int = 10;
    private static var _time_decrease:Float = 0.95;

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
        _time_allowed = _start_time;
	}
    public function listener()
    {
        _text.change();
        _timer.start(_time_allowed, function(Timer:FlxTimer){_time_out();}, 1);
        _time_allowed *= _time_decrease;
        _count += 1;
    }
    public function _time_out()
    {
        _time_allowed = _start_time;
        _count = 0;
        _text.dead();
    }

	override public function update(elapsed:Float):Void
	{
        _time_display.text = floatToStringPrecision(_timer.timeLeft, 2);
		super.update(elapsed);
	}
}
