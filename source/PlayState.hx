package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends MainState
{
	var dialogueText:FlxText;
	var dialogueCount:Int = 0;
	var dialogueMode:Bool = false; // stop playing game until the dialogue is done
	var dialoguePrefix:String;
	var dialogueFace:DialogueFace;

	var stageCount:Int = 1;
	var scoreCount:Int = 0;
	var scoreTxt:FlxText;
	var player:Player;

	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = DataLocal.parseIntFromString("assets/data/stage" + stageCount + "/colorBG_" + stageCount + ".txt");

		dialogueCount = 1;
		dialogueText = new FlxText(18, 111, 0, "", 20, true);
		// dialogueText.delay = 0.1;
		// dialogueText.waitTime = 2.0;
		// dialogueText.skipKeys = [ENTER];
		dialoguePrefix = "";
		add(dialogueText);
		dialogueFace = new DialogueFace(45, 45);
		add(dialogueFace);

		dialogueMode = true;

		// addUI();
	}

	function addUI()
	{
		scoreTxt = new FlxText(0, 0, 0, DataLocal.getString(AssetPaths.score__txt) + scoreCount, 16);
		scoreTxt.alignment = LEFT;
		add(scoreTxt);

		player = new Player();
		add(player);
	}

	function setText(title:String, face:String, text:String, color:FlxColor, modY:Float = 111, justText:Bool = false):Void
	{
		dialoguePrefix = title;
		if (justText)
		{
			dialogueText.text = DataLocal.getString(text);
		}
		else
		{
			dialogueText.text = dialoguePrefix + ": " + DataLocal.getString(text);
		}
		dialogueText.color = color;
		dialogueFace.playAnim(face);
		dialogueText.y = modY;
		trace("Title is: " + title + "\nFace is: " + face + "\nText is: " + text + "\nColor is: " + Std.string(color) + " set!");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		var up = FlxG.keys.anyJustPressed([W, UP]);
		var down = FlxG.keys.anyJustPressed([D, DOWN]);
		var space = FlxG.keys.justPressed.SPACE;
		var getMoveUp:Bool = false;
		var getMoveDown:Bool = false;

		if (dialogueMode == true)
		{
			if (FlxG.keys.justPressed.ANY)
			{
				dialogueCount++;
				switch (stageCount)
				{
					case 1:
						switch (dialogueCount) // tip: set 1 first case cuz when pressing
						{
							case 1:
								setText("Player", "poppon", AssetPaths.dialogue1_1__txt, FlxColor.GRAY);
							case 2:
								setText("Player", "poppon", AssetPaths.dialogue2_1__txt, FlxColor.GRAY);
							case 3:
								setText("", "system", AssetPaths.dialogue3_1__txt, FlxColor.WHITE, 50, true);
							case 4:
								setText("Player", "poppon", AssetPaths.dialogue4_1__txt, FlxColor.GRAY);
							case 5:
								setText("", "system", AssetPaths.dialogue5_1__txt, FlxColor.WHITE, 50, true);
							case 6:
								setText("Player", "poppon", AssetPaths.dialogue6_1__txt, FlxColor.GRAY);
							case 7:
								setText("", "system", AssetPaths.dialogue7_1__txt, FlxColor.WHITE, 50, true);
							case 8:
								setText("", "system", AssetPaths.dialogue8_1__txt, FlxColor.WHITE, 50, true);
							case 9:
								setText("Player", "poppon", AssetPaths.dialogue9_1__txt, FlxColor.GRAY);
							case 10:
								setText("Player", "poppon", AssetPaths.dialogue10_1__txt, FlxColor.GRAY);
							case 11:
								setText("", "system", AssetPaths.dialogue11_1__txt, FlxColor.WHITE, 50, true);
							case 12:
								setText("", "system", AssetPaths.dialogue12_1__txt, FlxColor.WHITE, 50, true);
							case 13:
								setText("Player", "poppon", AssetPaths.dialogue13_1__txt, FlxColor.GRAY);
							case 14:
								setText("", "system", AssetPaths.dialogue14_1__txt, FlxColor.WHITE, 50, true);
							case 15:
								setText("Player", "poppon", AssetPaths.dialogue15_1__txt, FlxColor.GRAY);
							case 16:
								disableDialogue();
						}
					case 2:
						switch (dialogueCount)
						{
							case 1:
								setText("", "system", AssetPaths.dialogue2_1__txt, FlxColor.WHITE, 50, true);
							case 2:
								setText("Player", "poppon", AssetPaths.dialogue2_2__txt, FlxColor.GRAY);
							case 3:
								setText("", "system", AssetPaths.dialogue2_3__txt, FlxColor.WHITE, 50, true);
							case 4:
								setText("", "system", AssetPaths.dialogue2_4__txt, FlxColor.WHITE, 50, true);
							case 5:
								setText("Player", "poppon", AssetPaths.dialogue2_5__txt, FlxColor.GRAY);
							case 6:
								setText("", "system", AssetPaths.dialogue2_6__txt, FlxColor.WHITE, 50, true);
							case 7:
								setText("", "system", AssetPaths.dialogue2_7__txt, FlxColor.WHITE, 50, true);
							case 8:
								disableDialogue();
						}
				}
			}
		}

		if (up && down)
			up = down = false;

		if (dialogueMode == false)
		{
			if (up == true)
			{
				getMoveUp = true;
			}

			if (down == true)
			{
				getMoveDown = true;
			}

			if (getMoveUp)
			{
				player.velocity.y -= 100 * 1;
			}
			else
			{
				getMoveUp = false;
			}

			if (getMoveDown)
			{
				player.velocity.y += 100 * 1;
			}
			else
			{
				getMoveDown = false;
			}

			if (getMoveUp == getMoveDown == false)
			{
				player.velocity.y = 0;
			}

			if (space)
			{
				player.animation.play("shoot");
				player.animation.finishCallback = function(name:String)
				{
					if (name == "shoot")
					{
						name = "idle";
					}
				};
			}
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			DataLocal.playSound(AssetPaths.confirm__wav);
			openSubState(new PauseSubState());
		}
	}

	function disableDialogue():Void
	{
		dialogueMode = false;
		dialogueCount = 0; // set back to zero
		remove(dialogueText);
		remove(dialogueFace);
		dialogueFace.exists = false;
		dialogueText.exists = false;
		addUI();
	}
}
