package states;

import flixel.input.keyboard.FlxKey;
import objects.RatingTxt;
import backend.StfUtils;
import backend.SwagSongData;
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxAssets;
import objects.EndButton;
import objects.MalwareTask;

class PlayState extends FlxState
{
	public static var song:SwagSongData;

	public var rtxt:RatingTxt;
	public var endTask:EndButton;

	public static var instance:PlayState;

	override public function create()
	{
		instance = this;
		FlxG.sound.playMusic(FlxAssets.getSound(songpath), 1, false);
		FlxG.sound.music.onComplete = function goBack()
		{
			Sys.exit(0);
		}
		for (note in song.chart)
		{
			var task:MalwareTask = new MalwareTask(note.time);
			note.link = task;
			add(task);
		}
		add(endTask = new EndButton());
		add(rtxt = new RatingTxt());
		super.create();
	}

	var songpath = "assets/music/";

	public function new(?Song:SwagSongData)
	{
		super();
		// Set song to Song
		if (Song == null)
			Song = {
				name: "Wavetapper",
				artist: "Frums",
				// chart: StfUtils.createChart([
				// 	2160, 2700, 3110, 3360, 3620, 3770, 4040, 4320, 4847, 5258, 5527, 5795, 5930, 6063, 6193
				// ]) // Old Format
				chart: [
					{time: 2160}, {time: 2700}, {time: 3110}, {time: 3360}, {time: 3620}, {time: 3770}, {time: 4040}, {time: 4320}, {time: 4847},
					{time: 5258}, {time: 5527}, {time: 5795}, {time: 5930}, {time: 6063}, {time: 6193}] // New Format
			};
		song = Song;
		if (song.path == null)
			songpath += '${song.name}.ogg';
		else
			songpath += '${song.path}.ogg';
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ANY)
			endTask.onUp.callback();
		super.update(elapsed);
	}
}
