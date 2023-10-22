package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PauseSubState extends MainSubState
{
	var resumeButton:FlxButton;
	var restartButton:FlxButton;
	var returnButton:FlxButton;

	public function new()
	{
		super();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.6;
		add(bg);

		resumeButton = new FlxButton(73, 175, DataLocal.getString(AssetPaths.pause_resume__txt), onResume);
		add(resumeButton);

		restartButton = new FlxButton(73, 235, DataLocal.getString(AssetPaths.pause_restart__txt), onRestart);
		add(restartButton);

		returnButton = new FlxButton(73, 295, DataLocal.getString(AssetPaths.pause_return__txt), onReturn);
		add(returnButton);

		var text:FlxText = new FlxText(341, 222, 0, DataLocal.getString(AssetPaths.pause_text__txt), 28, false);
		text.alignment = RIGHT;
		add(text);

		var hintText:FlxText = new FlxText(20, FlxG.height - 20, 0, DataLocal.getString(AssetPaths.pause_hint__txt), 12);
		add(hintText);
	}

	function onResume():Void
	{
		DataLocal.playSound(AssetPaths.confirm__wav);
		close();
	}

	function onRestart():Void
	{
		DataLocal.playSound(AssetPaths.confirm__wav);
		DataLocal.switchFade(FlxColor.BLACK, 0.44, false, function()
		{
			FlxG.resetState();
		});
	}

	function onReturn():Void
	{
		DataLocal.playSound(AssetPaths.confirm__wav);
		DataLocal.switchFade(FlxColor.BLACK, 0.33, false, function()
		{
			FlxG.switchState(new MenuState());
		});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			onResume();
		}
	}
}
