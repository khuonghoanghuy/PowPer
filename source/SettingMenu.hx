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
	var toggleFPS:FlxButton;
	var backButton:FlxButton;

	override function create()
	{
		super.create();

		#if desktop
		fullscreenButton = new FlxButton(53, 215,
			FlxG.fullscreen ? DataLocal.getString(AssetPaths.options_fullscreen__txt) : DataLocal.getString(AssetPaths.options_window__txt), setFullscreen);
		add(fullscreenButton);
		#end

		toggleFPS = new FlxButton(53, 255,
			FlxG.save.data.toggleFPS ? DataLocal.getString(AssetPaths.options_addedFPS__txt) : DataLocal.getString(AssetPaths.options_removeFPS__txt),
			toggleFPSCounter);
		add(toggleFPS);

		backButton = new FlxButton(53, toggleFPS.y + 40, DataLocal.getString(AssetPaths.options_back__txt), onBack);
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

	function toggleFPSCounter():Void
	{
		FlxG.save.data.toggleFPS = !FlxG.save.data.toggleFPS;
		toggleFPS.text = FlxG.save.data.toggleFPS ? DataLocal.getString(AssetPaths.options_addedFPS__txt) : DataLocal.getString(AssetPaths.options_removeFPS__txt);
	}

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
