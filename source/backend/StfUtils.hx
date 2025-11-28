package backend;

import objects.MalwareTask;

class StfUtils
{
	public static function inHitWindow(hitTime:Float, hitWindow:Float, noteTime:Float):Bool
	{
		return hitTime >= noteTime - hitWindow && hitTime <= noteTime + hitWindow;
	}

	/**
	 * Could be useful for a calibrator or showing your hit delay
	 * @param hitTime When you hit a note
	 * @param noteTime When you should hit the note
	 * @return Float
	 */
	public static function hitDelay(hitTime:Float, noteTime:Float):Float
		return Math.abs(hitTime - noteTime);

	/**
	 * Charts for you if on source. *This may or may not be used by the chart editor* ;)
	 * @param times The times of each note. What the function returns is an `Array<MalwareTask>` of the same length
	 */
	public static function createChart(times:Array<Float>):Array<MalwareTask>
	{
		var result:Array<MalwareTask> = [];
		for (time in times)
			result.push(new MalwareTask(time));
		return result;
	}
}
