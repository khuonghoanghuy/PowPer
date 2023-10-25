package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends MainState
{
	var dialogueText:FlxText;
	var dialogueCount:Int = 1;
	var dialogueMode:Bool = false; // stop playing game until the dialogue is done
	var dialoguePrefix:String;
	var dialogueFace:DialogueFace;
	var dialogueBox:DialogueBox;

	public static var stageCount:Int = 1;

	var scoreCount:Int = 0;
	var scoreTxt:FlxText;
	var player:Player;

	var togglePostion:Float = 0;

	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = DataLocal.parseIntFromString("assets/data/stage" + stageCount + "/colorBG_" + stageCount + ".txt");
		dialogueBox = new DialogueBox(161, 85);
		add(dialogueBox);
		dialogueCount = 1;
		dialogueText = new FlxText(18, 111, 0, "", 20, true);
		dialoguePrefix = "";
		add(dialogueText);
		dialogueFace = new DialogueFace(45, 45);
		add(dialogueFace);

		dialogueMode = true;

		switch (stageCount)
		{
			case 1:
				switch (dialogueCount)
				{
					case 1:
						setText("Player", "poppon", AssetPaths.dialogue1_1__txt, FlxColor.GRAY, 0);
				}
			case 2:
				switch (dialogueCount)
				{
					case 1:
						setText("", "system", AssetPaths.dialogue2_1__txt, FlxColor.WHITE, 1, 50, true);
				}
		}

		togglePostion = DataLocal.parseFloatFromString(AssetPaths.togglePostionMouse__txt);

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

	function setText(title:String, face:String, text:String, color:FlxColor, boxColor:Int, modY:Float = 111, justText:Bool = false):Void
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
		dialogueBox.setBox(boxColor);
		dialogueText.color = color;
		dialogueFace.playAnim(face);
		dialogueText.y = modY;
		trace("Title is: " + title + "\nFace is: " + face + "\nText is: " + text + "\nColor is: " + Std.string(color) + " set!");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		var space = FlxG.keys.justPressed.SPACE;

		if (dialogueMode == true)
		{
			if (FlxG.keys.justPressed.ANY)
			{
				dialogueCount++;
				switch (stageCount)
				{
					case 1:
						switch (dialogueCount) // tip: set 2 first case cuz when pressing
						{
							case 2:
								setText("Player", "poppon", AssetPaths.dialogue2_1__txt, FlxColor.GRAY, 0);
							case 3:
								setText("", "system", AssetPaths.dialogue3_1__txt, FlxColor.WHITE, 1, 50, true);
							case 4:
								setText("Player", "poppon", AssetPaths.dialogue4_1__txt, FlxColor.GRAY, 0);
							case 5:
								setText("", "system", AssetPaths.dialogue5_1__txt, FlxColor.WHITE, 1, 50, true);
							case 6:
								setText("Player", "poppon", AssetPaths.dialogue6_1__txt, FlxColor.GRAY, 0);
							case 7:
								setText("", "system", AssetPaths.dialogue7_1__txt, FlxColor.WHITE, 1, 50, true);
							case 8:
								setText("", "system", AssetPaths.dialogue8_1__txt, FlxColor.WHITE, 1, 50, true);
							case 9:
								setText("Player", "poppon", AssetPaths.dialogue9_1__txt, FlxColor.GRAY, 0);
							case 10:
								setText("Player", "poppon", AssetPaths.dialogue10_1__txt, FlxColor.GRAY, 0);
							case 11:
								setText("", "system", AssetPaths.dialogue11_1__txt, FlxColor.WHITE, 1, 50, true);
							case 12:
								setText("", "system", AssetPaths.dialogue12_1__txt, FlxColor.WHITE, 1, 50, true);
							case 13:
								setText("Player", "poppon", AssetPaths.dialogue13_1__txt, FlxColor.GRAY, 0);
							case 14:
								setText("", "system", AssetPaths.dialogue14_1__txt, FlxColor.WHITE, 1, 50, true);
							case 15:
								setText("Player", "poppon", AssetPaths.dialogue15_1__txt, FlxColor.GRAY, 0);
							case 16:
								disableDialogue();
						}
					case 2:
						switch (dialogueCount)
						{
							case 2:
								setText("Player", "poppon", AssetPaths.dialogue2_2__txt, FlxColor.GRAY, 0);
							case 3:
								setText("", "system", AssetPaths.dialogue2_3__txt, FlxColor.WHITE, 1, 50, true);
							case 4:
								setText("", "system", AssetPaths.dialogue2_4__txt, FlxColor.WHITE, 1, 50, true);
							case 5:
								setText("Player", "poppon", AssetPaths.dialogue2_5__txt, FlxColor.GRAY, 0);
							case 6:
								setText("", "system", AssetPaths.dialogue2_6__txt, FlxColor.WHITE, 1, 50, true);
							case 7:
								setText("", "system", AssetPaths.dialogue2_7__txt, FlxColor.WHITE, 1, 50, true);
							case 8:
								disableDialogue();
						}
				}
			}
		}

		if (dialogueMode == false)
		{
			player.x = FlxG.mouse.x - togglePostion;
			player.y = FlxG.mouse.y - togglePostion;

			if (space || FlxG.mouse.pressed)
			{
				player.animation.play("shoot");
				player.animation.finished = false;
				player.animation.finishCallback = function(name:String)
				{
					player.animation.play("idle", true);
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
		remove(dialogueBox);
		dialogueBox.exists = false;
		dialogueFace.exists = false;
		dialogueText.exists = false;
		addUI();
	}

	function endStage():Void
	{
		stageCount++;
		FlxG.switchState(new PlayState());
	}
}
