package;

import flixel.FlxG;
import flixel.addons.text.FlxTypeText;
import flixel.util.FlxColor;

class PlayState extends MainState
{
	var dialogueText:FlxTypeText;
	var dialogueCount:Int = 0;

	override public function create():Void
	{
		super.create();
		dialogueCount = 1;
		dialogueText = new FlxTypeText(0, 0, 0, "", 20, true);
		// dialogueText.delay = 0.1;
		dialogueText.waitTime = 2.0;
		// dialogueText.skipKeys = [ENTER];
		dialogueText.prefix = "";
		add(dialogueText);
	}

	function setText(title:String, face:String, text:String, color:FlxColor):Void
	{
		dialogueText.prefix = title;
		dialogueText.text = DataLocal.getString(text);
		dialogueText.color = color;
		trace("Title is: " + title + "\nFace is: " + face + "\nText is: " + text + "\nColor is: " + Std.string(color) + " set!");
		dialogueText.start(0.04, false, false);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ANY)
		{
			dialogueCount++;
			switch (dialogueCount) // tip: set 1 first case cuz when pressing
			{
				case 1:
					setText("Player", "poppon", AssetPaths.dialogue2__txt, FlxColor.GRAY);
				case 2:
					setText("Player", "poppon", AssetPaths.dialogue1__txt, FlxColor.GRAY);
				case 3:
					setText("", "system", AssetPaths.dialogue3__txt, FlxColor.WHITE);
				case 4:
					setText("Player", "poppon", AssetPaths.dialogue4__txt, FlxColor.GRAY);
				case 5:
					setText("", "system", AssetPaths.dialogue5__txt, FlxColor.WHITE);
				case 6:
					setText("Player", "poppon", AssetPaths.dialogue6__txt, FlxColor.GRAY);
				case 7:
					setText("", "system", AssetPaths.dialogue7__txt, FlxColor.WHITE);
				case 8:
					setText("", "system", AssetPaths.dialogue8__txt, FlxColor.WHITE);
				case 9:
					setText("Player", "poppon", AssetPaths.dialogue9__txt, FlxColor.GRAY);
				case 10:
					setText("Player", "poppon", AssetPaths.dialogue10__txt, FlxColor.GRAY);
				case 11:
					setText("", "system", AssetPaths.dialogue11__txt, FlxColor.WHITE);
				case 12:
					setText("", "system", AssetPaths.dialogue12__txt, FlxColor.WHITE);
				case 13:
					setText("Player", "poppon", AssetPaths.dialogue13__txt, FlxColor.GRAY);
				case 14:
					setText("", "system", AssetPaths.dialogue14__txt, FlxColor.WHITE);
				case 15:
					setText("Player", "poppon", AssetPaths.dialogue15__txt, FlxColor.GRAY);
			}
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			DataLocal.switchFade(FlxColor.BLACK, 0.33, false, function()
			{
				FlxG.switchState(new MenuState());
			});
		}
	}
}
