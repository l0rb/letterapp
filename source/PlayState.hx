package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.addons.ui.FlxClickArea;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;

class TapArea extends FlxGroup
{
    public function new(listener)
    {
        super();
        var w = FlxG.width;
        var h = Std.int(FlxG.height*0.8);
        var ca = new FlxClickArea(0, 0, w, h, listener);
        var sp = new FlxSprite(0, 0);
        sp.makeGraphic(w, h, FlxColor.RED);
        add(sp);
        add(ca);
    }
}
class TheText extends FlxText
{
    public function new()
    {
        super(0, 0, 0, "Tap", 200);
        font = "komika_full.ttf";
        screenCenter();
    }
    public function change()
    {
        text = String.fromCharCode(Std.random(25)+65);
        this.screenCenter();
    }
    public function dead()
    {
        text = "DEAD";
        this.screenCenter();
    }
}

class TimeDisplay extends FlxText
{
    public function new()
    {
        var s = 32;
        super(0, FlxG.height-s-3, 0, "", s);
    }
}

class PlayState extends FlxState
{
    private var _text:TheText;
    private var _timer:FlxTimer;
    private var _time_display:TimeDisplay;
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
        var tap_area = new TapArea(listener);
        add(tap_area);
        _text = new TheText();
        add(_text);
        _timer = new FlxTimer();
        _time_display = new TimeDisplay();
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
