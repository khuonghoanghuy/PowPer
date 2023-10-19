package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class PauseSubState extends MainSubState
{
	var resumeButton:FlxButton;

	public function new()
	{
		super();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.6;
		add(bg);

		resumeButton = new FlxButton(0, 0, DataLocal.getString(AssetPaths.pause_resume__txt), onResume);
		add(resumeButton);
	}

	function onResume():Void
	{
		close();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
