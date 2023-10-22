package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;
#if debug
import flixel.addons.studio.FlxStudio;
#end

class Main extends Sprite
{
	var fpstouse:Int = Std.parseInt(DataLocal.getString(AssetPaths.fpsDrawer__txt));

	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState, fpstouse, fpstouse, false, false));
		addChild(new FPS(0, 0, Std.parseInt(DataLocal.getString(AssetPaths.fpsColor__txt))));
		#if debug
		FlxStudio.create();
		#end
	}
}
