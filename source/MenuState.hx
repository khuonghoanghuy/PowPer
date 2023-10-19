package;

import flixel.FlxG;
import flixel.FlxSprite;
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
	var titlePop:FlxSprite;

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

		var textVersion:FlxText = new FlxText(20, FlxG.height - 20, 0,
			DataLocal.getString(AssetPaths.versiontext__txt) + Application.current.meta.get("version"), 12);
		textVersion.updateHitbox();
		add(textVersion);

		titlePop = new FlxSprite(377, 165);
		titlePop.loadGraphic(AssetPaths.title__png);
		titlePop.scale.set(3, 3);
		titlePop.antialiasing = false;
		titlePop.updateHitbox();
		add(titlePop);
	}

	function onExit():Void
	{
		DataLocal.switchFade(FlxColor.BLACK, 0.33, function()
		{
			trace("exit game");
			System.exit(0);
		});
	}

	function onStart():Void
	{
		DataLocal.switchFlashColor(FlxColor.WHITE, 0.33, function()
		{
			trace("move state");
			FlxG.switchState(new PlayState());
		});
	}

	function onSetting():Void
	{
		DataLocal.switchFade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new SettingMenu());
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(titlePop) && FlxG.mouse.pressed)
		{
			trace("funny pop up");
			Application.current.window.alert(DataLocal.getString(AssetPaths.limeApp_desc__txt), DataLocal.getString(AssetPaths.limeApp_title__txt));
			return;
		}
	}
}
