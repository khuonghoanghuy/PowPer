package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.util.FlxColor;
import lime.utils.Assets;

using StringTools;

/**
 * Data Local is a main file about thingie :)
 */
class DataLocal
{
	public function new() {}

	public static function getString(path:String):String
	{
		var fileThingie:String = Assets.getText(path).trim();

		return fileThingie;
	}

	public static function parseIntFromString(path:String)
	{
		return Std.parseInt(getString(path));
	}

	public static function parseFloatFromString(path:String)
	{
		return Std.parseFloat(getString(path));
	}

	public static function getSave()
	{
		FlxG.save.flush();
	}

	public static function switchFade(color:FlxColor, time:Float, isFadeIn:Bool = false, setFunction:Dynamic)
	{
		FlxG.camera.fade(color, time, isFadeIn, setFunction);
	}

	public static function playSound(path:String)
	{
		FlxG.sound.play(path, 0.4);
	}

	public static function switchFlashColor(color:FlxColor, time:Float, setFunction:Dynamic)
	{
		FlxG.camera.flash(color, time, setFunction);
	}

	public static function initData()
	{
		#if desktop
		if (FlxG.save.data.fullscreen != null)
		{
			FlxG.fullscreen = FlxG.save.data.fullscreen;
		}
		#end

		if (FlxG.save.data.allowRestart != null)
		{
			FlxG.save.data.allowRestart = !FlxG.save.data.allowRestart;
		}
	}

	public static function createData(name:String)
	{
		FlxG.save.bind(name, "powperGame");
		FlxG.save.flush();
	}

	public static function mouseOverlapsObj(obj:FlxBasic)
	{
		return FlxG.mouse.overlaps(obj);
	}
}
