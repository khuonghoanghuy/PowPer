package;

#if debug
import flixel.addons.studio.FlxStudio;
#end
import flixel.addons.ui.FlxUIState;

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
