package;

import flixel.FlxSprite;

class DialogueBox extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic(AssetPaths.dialogueBox__png, true, 64, 32);
		animation.add("box0", [0]);
		animation.add("box1", [1]);
		animation.add("box2", [2]);
		animation.add("box3", [3]);
		scale.set(DataLocal.parseIntFromString(AssetPaths.dialogueBoxScale__txt), DataLocal.parseIntFromString(AssetPaths.dialogueBoxScale__txt));
	}

	public function setBox(count:Int)
	{
		animation.play("box" + count);
	}
}
