package;

import flixel.FlxG;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends MainState
{
	var dialogueText:FlxTypeText;
	var dialogueCount:Int = 0;
	var dialogueMode:Bool = false; // stop playing game until the dialogue is done

	var stageCount:Int = 1;
	var scoreTxt:FlxText;

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
		dialogueMode = true;

		addUI();
	}

	function addUI()
	{
		scoreTxt = new FlxText(0, 0, 0, DataLocal.getString(AssetPaths.score__txt), 16);
		scoreTxt.alignment = LEFT;
		add(scoreTxt);
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

		if (dialogueMode == true)
		{
			if (FlxG.keys.justPressed.ANY)
			{
				dialogueCount++;
				switch (dialogueCount) // tip: set 1 first case cuz when pressing
				{
					case 1:
						setText("Player", "poppon", AssetPaths.dialogue1_1__txt, FlxColor.GRAY);
					case 2:
						setText("Player", "poppon", AssetPaths.dialogue2_1__txt, FlxColor.GRAY);
					case 3:
						setText("", "system", AssetPaths.dialogue3_1__txt, FlxColor.WHITE);
					case 4:
						setText("Player", "poppon", AssetPaths.dialogue4_1__txt, FlxColor.GRAY);
					case 5:
						setText("", "system", AssetPaths.dialogue5_1__txt, FlxColor.WHITE);
					case 6:
						setText("Player", "poppon", AssetPaths.dialogue6_1__txt, FlxColor.GRAY);
					case 7:
						setText("", "system", AssetPaths.dialogue7_1__txt, FlxColor.WHITE);
					case 8:
						setText("", "system", AssetPaths.dialogue8_1__txt, FlxColor.WHITE);
					case 9:
						setText("Player", "poppon", AssetPaths.dialogue9_1__txt, FlxColor.GRAY);
					case 10:
						setText("Player", "poppon", AssetPaths.dialogue10_1__txt, FlxColor.GRAY);
					case 11:
						setText("", "system", AssetPaths.dialogue11_1__txt, FlxColor.WHITE);
					case 12:
						setText("", "system", AssetPaths.dialogue12_1__txt, FlxColor.WHITE);
					case 13:
						setText("Player", "poppon", AssetPaths.dialogue13_1__txt, FlxColor.GRAY);
					case 14:
						setText("", "system", AssetPaths.dialogue14_1__txt, FlxColor.WHITE);
					case 15:
						setText("Player", "poppon", AssetPaths.dialogue15_1__txt, FlxColor.GRAY);
					case 16:
						disableDialogue();
				}
			}
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			DataLocal.switchFade(FlxColor.BLACK, 0.33, false, function()
			{
				// FlxG.switchState(new MenuState());
				openSubState(new PauseSubState());
			});
		}
	}

	function disableDialogue():Void
	{
		dialogueMode = false;
		dialogueCount = 0; // set back to zero
	}
}
