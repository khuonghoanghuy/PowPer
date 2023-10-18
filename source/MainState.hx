package;

import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import openfl.display.FPS;
#if debug
import flixel.addons.studio.FlxStudio;
#end

class MainState extends FlxUIState
{
	var fps:FPS;
	var copp:Bool = false;

	override function create()
	{
		super.create();

		fps = new FPS(0, 0, 0xFFFFFF);

		#if debug
		FlxStudio.create();
		#end
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.save.data.toggleFPS == true)
		{
			copp = true;
		}
		else if (FlxG.save.data.toggleFPS == false)
		{
			copp = false;
		}

		if (copp)
		{
			FlxG.stage.addChild(fps);
		}
		else
		{
			FlxG.stage.removeChild(fps);
		}
	}
}
