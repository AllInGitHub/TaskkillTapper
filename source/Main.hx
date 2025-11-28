package;

import flixel.FlxGame;
import openfl.display.Sprite;

/**
 * # Game idea: If Task Manager was a rhythm game
 * 
 * ## Situation
 * 
 * You're running a Windows machine. A resource-hungry virus has installed itself!
 * You'll need to use Task Manager to end it. But it's auto-run malware. So you'll need to end it every
 * so often.
 * 
 * ## Conditions
 * 
 * - If you miss a note, you get bluescreened
 * - If you hit a note, the virus must start over
 * - If you hit the **last note**, the virus just gives up
 */
class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, states.PlayState));
	}
}
