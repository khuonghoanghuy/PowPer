package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class SettingMenu extends MainState
{
	// list of options thingie
	#if desktop
	var fullscreenButton:FlxButton;
	#end
	var allowsRestartButton:FlxButton;
	var backButton:FlxButton;
	var titlePop:FlxSprite;
	var descText:FlxText;

	override function create()
	{
		super.create();

		#if desktop
		fullscreenButton = new FlxButton(53, 215,
			FlxG.fullscreen ? DataLocal.getString(AssetPaths.options_fullscreen__txt) : DataLocal.getString(AssetPaths.options_window__txt), setFullscreen);
		add(fullscreenButton);
		#end

		allowsRestartButton = new FlxButton(53, 215 + 40,
			FlxG.save.data.allowRestart ? DataLocal.getString(AssetPaths.options_allowsrestart__txt) : DataLocal.getString(AssetPaths.options_notallowsrestart__txt),
			setAllowRestart);
		add(allowsRestartButton);

		backButton = new FlxButton(53, allowsRestartButton.y + 40, DataLocal.getString(AssetPaths.options_back__txt), onBack);
		add(backButton);

		titlePop = new FlxSprite(377, 165);
		titlePop.loadGraphic(AssetPaths.options__png);
		titlePop.scale.set(3, 3);
		titlePop.antialiasing = false;
		titlePop.updateHitbox();
		add(titlePop);

		descText = new FlxText(20, FlxG.height - 20, 0, DataLocal.getString(AssetPaths.options_desc__txt), 12);
		add(descText);
	}

	#if desktop
	function setFullscreen():Void
	{
		FlxG.fullscreen = !FlxG.fullscreen;
		fullscreenButton.text = FlxG.fullscreen ? DataLocal.getString(AssetPaths.options_fullscreen__txt) : DataLocal.getString(AssetPaths.options_window__txt);
		FlxG.save.data.fullscreen = FlxG.fullscreen;
	}
	#end

	function setAllowRestart():Void
	{
		FlxG.save.data.allowRestart = !FlxG.save.data.allowRestart;
		allowsRestartButton.text = FlxG.save.data.allowRestart ? DataLocal.getString(AssetPaths.options_allowsrestart__txt) : DataLocal.getString(AssetPaths.options_notallowsrestart__txt);
	}

	function onBack():Void
	{
		DataLocal.getSave();
		DataLocal.playSound(AssetPaths.confirm__wav);
		DataLocal.switchFade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new MenuState());
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		#if desktop
		if (DataLocal.mouseOverlapsObj(fullscreenButton))
		{
			descText.text = FlxG.fullscreen ? DataLocal.getString(AssetPaths.options_fullscreen_desc__txt) : DataLocal.getString(AssetPaths.options_window_desc__txt);
		}
		#end

		if (DataLocal.mouseOverlapsObj(allowsRestartButton))
		{
			descText.text = FlxG.save.data.allowRestart ? DataLocal.getString(AssetPaths.options_allowsrestart_desc__txt) : DataLocal.getString(AssetPaths.options_notallowsrestart_desc__txt);
		}

		if (DataLocal.mouseOverlapsObj(backButton))
		{
			descText.text = DataLocal.getString(AssetPaths.options_back_desc__txt);
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			onBack();
		}
	}
}
