package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class SettingMenu extends MainState
{
	// list of options thingie
	#if desktop
	var fullscreenButton:FlxButton;
	#end
	var backButton:FlxButton;

	override function create()
	{
		super.create();

		#if desktop
		fullscreenButton = new FlxButton(53, 215,
			FlxG.fullscreen ? DataLocal.getString(AssetPaths.options_fullscreen__txt) : DataLocal.getString(AssetPaths.options_window__txt), setFullscreen);
		add(fullscreenButton);
		#end

		backButton = new FlxButton(53, 255 + 40, DataLocal.getString(AssetPaths.options_back__txt), onBack);
		add(backButton);
	}

	#if desktop
	function setFullscreen():Void
	{
		FlxG.fullscreen = !FlxG.fullscreen;
		fullscreenButton.text = FlxG.fullscreen ? DataLocal.getString(AssetPaths.options_fullscreen__txt) : DataLocal.getString(AssetPaths.options_window__txt);
		FlxG.save.data.fullscreen = FlxG.fullscreen;
	}
	#end

	function onBack():Void
	{
		DataLocal.getSave();
		DataLocal.switchFade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new MenuState());
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
