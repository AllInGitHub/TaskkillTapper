package objects;

import flixel.FlxG;
import flixel.ui.FlxButton;
import states.PlayState;

class EndButton extends FlxButton
{
	public var misses:Int = 0;
	public var ghostTaps:Int = 0;
	public var hits:Int = 0;

	public function new()
	{
		// new FlxButton()
		super(2 * FlxG.width / 3, 2 * FlxG.height / 3, "End task", function endTask()
		{
			for (note in PlayState.song.chart)
			{
				if (note.link.doHitCheck())
				{
					// trace(note.hitCheck().getName());
				}
				PlayState.instance.rtxt.onHit(note.link.hitCheck());
			}
		});
	}
}
