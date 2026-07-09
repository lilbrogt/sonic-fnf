package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrame;
import flixel.animation.FlxBaseAnimation;
import flixel.math.FlxPoint;

class ModernSonic extends FlxSprite
{
	public var animOffsets:Map<String, Array<Float>> = [];
	public var isPlayer:Bool = false;

	public function new(x:Float, y:Float, isPlayer:Bool = false)
	{
		super(x, y);
		this.isPlayer = isPlayer;

		// Load the sprite sheet
		frames = Paths.getSparrowAtlas('characters/modernSonic');
		
		// Set scale
		scale.set(1, 1);
		updateHitbox();

		// Define animations
		animation.addByPrefix('idle', 'Sonic Idle', 24, false);
		animation.addByPrefix('left', 'Sonic Left', 24, false);

		// Set animation offsets (adjust these based on your sprite positioning)
		addOffset("idle", 0, 0);
		addOffset("left", 0, 0);

		// Play idle animation by default
		playAnim('idle');
	}

	public function playAnim(AnimName:String, Force:Bool = false):Void
	{
		animation.play(AnimName, Force);

		var offset = animOffsets.get(AnimName);
		if (offset != null)
		{
			offset(offset[0], offset[1]);
		}
	}

	public function addOffset(name:String, x:Float, y:Float):Void
	{
		animOffsets.set(name, [x, y]);
	}

	override function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
