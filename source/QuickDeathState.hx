package;

import flixel.FlxState;
import flixel.util.FlxTimer;


class QuickDeathState extends FlxState
{
    private var _text:Elements.TheText;
    private var _timer:FlxTimer;
    private var _time_display:Elements.TimeDisplay;
    private var _time_allowed:Float;
    private var _count:Int = 0;

    public static function floatToStringPrecision(n:Float, prec:Int)
    {
        n = Math.round(n * Math.pow(10, prec));
        var str = ''+n;
        var len = str.length;
        if(len <= prec){
            while(len < prec){
                str = '0'+str;
                len++;
            }
            return '0.'+str;
        }
        else{
            return str.substr(0, str.length-prec) + '.'+str.substr(str.length-prec);
        }
    }

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
        _time_allowed = 10;
	}
    public function listener()
    {
        _text.change();
        _timer.start(_time_allowed, function(Timer:FlxTimer){_time_out();}, 1);
        _time_allowed *= 0.95;
        _count += 1;
    }
    public function _time_out()
    {
        _time_allowed = 10;
        _count = 0;
        _text.dead();
    }

	override public function update(elapsed:Float):Void
	{
        _time_display.text = floatToStringPrecision(_timer.timeLeft, 2);
		super.update(elapsed);
	}
}
