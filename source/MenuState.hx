package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import lime.app.Application;
import openfl.system.System;

class MenuState extends MainState
{
	// list of button
	var startButton:FlxButton;
	var settingButton:FlxButton;
	var quitButton:FlxButton;

	override function create()
	{
		super.create();
		var toggleX:Float = 73;
		startButton = new FlxButton(toggleX, 175, DataLocal.getString(AssetPaths.start__txt), onStart);
		add(startButton);
		settingButton = new FlxButton(toggleX, 235, DataLocal.getString(AssetPaths.setting__txt), onSetting);
		add(settingButton);
		quitButton = new FlxButton(toggleX, 295, DataLocal.getString(AssetPaths.quit__txt), onExit);
		add(quitButton);

		var textVersion:FlxText = new FlxText(20, 20, 0, DataLocal.getString(AssetPaths.versiontext__txt) + Application.current.meta.get("version"), 12);
		textVersion.updateHitbox();
		add(textVersion);
	}

	function onExit():Void
	{
		System.exit(0);
	}

	function onStart():Void {}

	function onSetting():Void
	{
		DataLocal.switchFade(FlxColor.BLACK, 0.33, true, function()
		{
			FlxG.switchState(new SettingMenu());
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
