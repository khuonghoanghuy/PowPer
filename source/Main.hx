package;

#if debug
import flixel.addons.studio.FlxStudio;
#end
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, LoadingState, 60, 60, false, false));
		#if debug
		FlxStudio.create();
		#end
	}
}
