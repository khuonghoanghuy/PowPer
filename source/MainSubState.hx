package;

import flixel.FlxG;
import flixel.addons.ui.FlxUISubState;
#if debug
import flixel.addons.studio.FlxStudio;
#end

class MainSubState extends FlxUISubState
{
	public function new()
	{
		super();

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
