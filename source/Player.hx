package;

import flixel.FlxSprite;

class Player extends FlxSprite
{
	public function new(x:Float = 20, y:Float = 210)
	{
		super(x, y);
		loadGraphic(AssetPaths.playerSpace__png, true, 32, 32);
		animation.add("idle", [0]);
		animation.add("shoot", [1, 2, 3], 12);
		animation.play("idle"); // default play animation
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
