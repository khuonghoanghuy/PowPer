package;

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

	public static function switchFade(color:FlxColor, time:Float, isFadeIn:Bool = false, setFunction:Dynamic)
	{
		FlxG.camera.fade(color, time, isFadeIn, setFunction);
	}
}
