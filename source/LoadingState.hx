package;

import flixel.FlxG;
import flixel.text.FlxText;
import mloader.Loader.LoaderEvent;
import mloader.LoaderQueue;
import mloader.StringLoader;

class LoadingState extends MainState
{
	var loadedQueue:LoaderQueue;
	var setMax:Int = 4; // number of assets load

	override function create()
	{
		super.create();
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
