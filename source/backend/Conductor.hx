package backend;

import flixel.FlxG;

class Conductor
{
	public static var tempo:Int = 140; // BPM
	public static var timeSig:TimeSig = { // Does anyone wanna modify this? ANYONE!?
		num: 4,
		denom: 4
	};
	// Song position stuff
	public static var time:Float; // ms

	public static var stepDec:Float; // beat / 4
	public static var beatDec:Float; // beat
	public static var barDec:Float; // beat * 4

	public static var step:Int; // beat / 4
	public static var beat:Int; // beat
	public static var bar:Int; // beat * 4

	public static var msps:Float; // ms
	public static var mspb:Float; // ms
	public static var mspbar:Float; // ms

	private static function set_time(v:Float)
	{
		return FlxG.sound.music.time = v;
	}

	private static function get_time()
	{
		return FlxG.sound.music.time;
	}

	private static function get_mspb()
	{
		return 60 / tempo;
	}

	private static function get_mspbar()
	{
		return mspb * timeSig.denom;
	}

	private static function get_msps()
	{
		return mspb * timeSig.num;
	}

	private static function get_beatDec()
	{
		return time / mspb;
	}

	private static function get_barDec()
	{
		return time / mspbar;
	}

	private static function get_stepDec()
	{
		return time / msps;
	}

	private static function get_beat()
	{
		return Std.int(beatDec);
	}

	private static function get_bar()
	{
		return Std.int(barDec);
	}

	private static function get_step()
	{
		return Std.int(stepDec);
	}
}

typedef TimeSig =
{
	var num:Int;
	var denom:Int;
}
