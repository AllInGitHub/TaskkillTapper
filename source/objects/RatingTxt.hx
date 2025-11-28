package objects;

import backend.Rating;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class RatingTxt extends FlxText
{
	public function new()
	{
		super(0, 0, 0, "", 32);
		screenCenter();
		alpha = 0;
	}

	var fadeTween:FlxTween;

	public function onHit(rating:Rating)
	{
		text = rating.getName();
		fadeTween = FlxTween.num(1, 0, 1.0, {ease: FlxEase.quadInOut, onComplete: twn -> fadeTween = null}, function fade1to0(f)
		{
			alpha = f;
		},);
	}
}
