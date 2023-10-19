package;

import flixel.FlxG;
import flixel.text.FlxText;

/**
 * This State is overhaul
 */
class LoadingState extends MainState
{
	// var loadedQueue:LoaderQueue;
	// setMax:Int = Std.parseInt(DataLocal.getString(AssetPaths.setMaxLoading__txt)); // number of assets load
	// var imageCache:Assets; // for assest image, cuz mloader doesn't have image cache so there are new one
	override function create()
	{
		super.create();
		addedText();
		DataLocal.initData();
		DataLocal.createData("dataContains");
		cache();
	}

	var text:FlxText;

	function cache()
	{
		// imageCache.image();
		// alot text
		addedImageFile(AssetPaths.fc__png);
		addedImageFile(AssetPaths.huy1234th__png);
		addedImageFile(AssetPaths.title__png);
		addedByteFile(AssetPaths.dialogue1_1__txt);
		addedByteFile(AssetPaths.dialogue2_1__txt);
		addedByteFile(AssetPaths.dialogue3_1__txt);
		addedByteFile(AssetPaths.dialogue4_1__txt);
		addedByteFile(AssetPaths.dialogue5_1__txt);
		addedByteFile(AssetPaths.dialogue6_1__txt);
		addedByteFile(AssetPaths.dialogue7_1__txt);
		addedByteFile(AssetPaths.dialogue8_1__txt);
		addedByteFile(AssetPaths.dialogue9_1__txt);
		addedByteFile(AssetPaths.dialogue10_1__txt);
		addedByteFile(AssetPaths.dialogue11_1__txt);
		addedByteFile(AssetPaths.dialogue12_1__txt);
		addedByteFile(AssetPaths.dialogue13_1__txt);
		addedByteFile(AssetPaths.dialogue14_1__txt);
		addedByteFile(AssetPaths.dialogue15_1__txt);
		addedByteFile(AssetPaths.options_back__txt);
		addedByteFile(AssetPaths.options_fullscreen__txt);
		addedByteFile(AssetPaths.options_window__txt);
		addedByteFile(AssetPaths.quit__txt);
		addedByteFile(AssetPaths.start__txt);
		addedByteFile(AssetPaths.setting__txt);
		addedByteFile(AssetPaths.versiontext__txt);
		addedByteFile(AssetPaths.fpsColor__txt);
		addedByteFile(AssetPaths.fpsDrawer__txt);
		finished();
	}

	/**
	 * load amount image file
	 * @param path useful for load image.png file
	 */
	function addedImageFile(path:String)
	{
		trace("added image from " + path);
		openfl.Assets.cache.getBitmapData(path);
	}

	/**
	 * load amount data file
	 * @param path useful for load text file
	 */
	function addedByteFile(path:String)
	{
		trace("added file from" + path);
		openfl.Assets.getPath(path);
	}

	function addedText()
	{
		text = new FlxText(0, 0, 0, "Loading...", 32);
		text.alignment = CENTER;
		text.screenCenter();
		add(text);

		/*var textVersion:FlxText = new FlxText(20, FlxG.height - 20, 0, "Total Need to Load: " + Std.string(setMax) + " Data File", 12);
			textVersion.updateHitbox();
			add(textVersion);
		 */
	}

	/*function addedQueue(path:mloader.Loader<Dynamic>)
		{
			trace("added " + path);
	}*/
	// update fell useless ;-;
	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function finished():Void
	{
		// trace("Done Loading, move to main menu state");
		FlxG.switchState(new MenuState());
	}
}
