package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{

	override public function create():Void
    {
        var _Bplay1 = new FlxButton(50, 100, "Quickdeath", function(){FlxG.switchState(new QuickDeathState());});
        var _Bplay2 = new FlxButton(50, 150, "Fixed Time", function(){FlxG.switchState(new FixedTimeState());});
        add(_Bplay1);
        add(_Bplay2);
        super.create();
    }

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}

