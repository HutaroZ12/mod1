package;

import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class CinematicsExample extends flixel.FlxState
{
    public var start:Int = 0;
    public var finish:Int = 0;

    public var upperBar:FlxSprite;
    public var lowerBar:FlxSprite;

    override public function create():Void
    {
        super.create();

        // THE TOP BAR
        upperBar = new FlxSprite();
        upperBar.makeGraphic(1280, 120, 0xFF000000); // cor preta
        upperBar.y = -120;
        add(upperBar);

        // THE BOTTOM BAR
        lowerBar = new FlxSprite();
        lowerBar.makeGraphic(1280, 120, 0xFF000000);
        lowerBar.y = 720;
        add(lowerBar);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        if (start == 1)
        {
            FlxTween.tween(upperBar, { y: 0 }, 0.5, { ease: FlxTween.linear });
            FlxTween.tween(lowerBar, { y: 600 }, 0.5, { ease: FlxTween.linear });

            for (i in 0...8)
            {
                var note = game.getNoteByIndex(i); // ajuste conforme a função do seu mod
                FlxTween.tween(note, { y: FlxG.downscroll ? 480 : 120 }, 0.5, { ease: FlxTween.linear });
            }

            hideHUD();
        }

        if (finish == 2)
        {
            FlxTween.tween(upperBar, { y: -120 }, 0.5, { ease: FlxTween.linear });
            FlxTween.tween(lowerBar, { y: 720 }, 0.5, { ease: FlxTween.linear });

            for (i in 0...8)
            {
                var note = game.getNoteByIndex(i);
                FlxTween.tween(note, { y: FlxG.downscroll ? 570 : 50 }, 0.5, { ease: FlxTween.linear });
            }

            showHUD();
        }
    }

    public function onEvent(name:String, value1:String, value2:String):Void
    {
        if (name == "Cinematics")
        {
            start = Std.parseInt(value1);
            finish = Std.parseInt(value2);
        }
    }

    public function hideHUD():Void
    {
        doTweenAlpha("healthBarBG", 0);
        doTweenAlpha("healthBar", 0);
        doTweenAlpha("scoreTxt", 0);
        doTweenAlpha("iconP1", 0);
        doTweenAlpha("iconP2", 0);
        doTweenAlpha("timeBar", 0);
        doTweenAlpha("timeBarBG", 0);
        doTweenAlpha("timeTxt", 0);
    }

    public function showHUD():Void
    {
        doTweenAlpha("healthBarBG", 1);
        doTweenAlpha("healthBar", 1);
        doTweenAlpha("scoreTxt", 1);
        doTweenAlpha("iconP1", 1);
        doTweenAlpha("iconP2", 1);
        doTweenAlpha("timeBar", 1);
        doTweenAlpha("timeBarBG", 1);
        doTweenAlpha("timeTxt", 1);
    }

    private function doTweenAlpha(objName:String, alpha:Float):Void
    {
        var obj = game.getSprite(objName); // ajuste para pegar o sprite certo
        if (obj != null)
            FlxTween.tween(obj, { alpha: alpha }, 0.25, { ease: FlxTween.linear });
    }
}
