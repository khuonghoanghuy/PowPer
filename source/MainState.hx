package;

import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
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

		if (FlxG.save.data.allowRestart)
		{
			if (FlxG.keys.justPressed.F11)
			{
				trace("restart game");
				FlxG.resetGame();
			}
		}
	}
}
