package;

import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import openfl.display.FPS;
#if debug
import flixel.addons.studio.FlxStudio;
#end

class MainState extends FlxUIState
{
	override function create()
	{
		super.create();

		#if debug
		FlxStudio.create();
		#end
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
