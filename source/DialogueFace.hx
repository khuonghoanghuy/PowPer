package;

import flixel.FlxSprite;

class DialogueFace extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic(AssetPaths.fc__png, true, 32, 32);
		animation.add("poppon", [0]);
		animation.add("brn", [1]);
		animation.add("bossy", [2]);
		animation.add("system", [3]);
		scale.set(DataLocal.parseIntFromString(AssetPaths.dialogueFaceScale__txt), DataLocal.parseIntFromString(AssetPaths.dialogueFaceScale__txt));
	}

	public function playAnim(name:String)
	{
		animation.play(name);
	}
}
