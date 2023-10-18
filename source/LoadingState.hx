package;

import flixel.FlxG;
import flixel.text.FlxText;
import mloader.Loader.LoaderEvent;
import mloader.LoaderQueue;
import mloader.StringLoader;

/**
 * This State is overhaul
 */
class LoadingState extends MainState
{
	var loadedQueue:LoaderQueue;
	var setMax:Int = Std.parseInt(DataLocal.getString(AssetPaths.setMaxLoading__txt)); // number of assets load

	override function create()
	{
		super.create();
		DataLocal.initData();
		DataLocal.createData("dataContains");
		loadedQueue = new LoaderQueue();
		loadedQueue.maxLoading = setMax;
		loadedQueue.ignoreFailures = false;
		loadedQueue.loaded.addOnce(finished).forType(Complete);
		addedQueue(new StringLoader(AssetPaths.start__txt));
		addedQueue(new StringLoader(AssetPaths.setting__txt));
		addedQueue(new StringLoader(AssetPaths.quit__txt));
		addedQueue(new StringLoader(AssetPaths.versiontext__txt));
		addedQueue(new StringLoader(AssetPaths.options_window__txt));
		addedQueue(new StringLoader(AssetPaths.options_fullscreen__txt));
		addedQueue(new StringLoader(AssetPaths.options_back__txt));
		addedQueue(new StringLoader(AssetPaths.options_addedFPS__txt));
		addedQueue(new StringLoader(AssetPaths.options_removeFPS__txt));
		addedText();
		start(); // imma im just forgot this one :)))
	}

	var text:FlxText;

	function addedText()
	{
		text = new FlxText(0, 0, 0, "Loading...", 32);
		text.alignment = CENTER;
		text.screenCenter();
		add(text);

		var textVersion:FlxText = new FlxText(20, FlxG.height - 20, 0, "Total Need to Load: " + Std.string(setMax) + " File", 12);
		textVersion.updateHitbox();
		add(textVersion);
	}

	function addedQueue(path:mloader.Loader<Dynamic>)
	{
		trace("added " + path);
		loadedQueue.add(path);
	}

	function start()
	{
		trace('loading');
		loadedQueue.load();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function finished(event:LoaderEvent<Dynamic>):Void
	{
		trace("Done Loading, move to main menu state");
		FlxG.switchState(new MenuState());
	}
}
