package;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.addons.ui.FlxClickArea;
import flixel.FlxSprite;
//import flixel.util.FlxColor;

class TapArea extends FlxGroup
{
    public function new(listener)
    {
        super();
        var w = FlxG.width;
        var h = Std.int(FlxG.height*0.8);
        var ca = new FlxClickArea(0, 0, w, h, listener);
        var sp = new FlxSprite(0, 0);
        sp.makeGraphic(w, h, 0xFF770000);
        add(sp);
        add(ca);
    }
}
class TheText extends FlxText
{
    public function new()
    {
        super(0, 0, 0, "Tap", 200);
        font = "roboto_bold.ttf";
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
        font = "roboto_regular.ttf";
    }
}
