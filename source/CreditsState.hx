package;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class CreditsState extends FlxState
{
	var creditsList:Array<CreditEntry> = [];
	var yOffset:Float = 100;

	public function new()
	{
		super();
	}

	override function create():Void
	{
		super.create();
		bgColor = FlxColor.BLACK;

		// Add title
		var title = new FlxText(0, 20, 0, "SONIC FNF MOD - CREDITS", 32);
		title.alignment = CENTER;
		title.screenCenter(X);
		add(title);

		// Add your credit entry with Goku icon
		addCredit("lilbrogt", "Creator/Developer", "assets/images/credits/goku_icon.png");
		addCredit("Modern Sonic", "Character Sprite", null);
		addCredit("Friday Night Funkin'", "Base Game", null);

		// Draw credits
		drawCredits();
	}

	function addCredit(name:String, role:String, iconPath:String):Void
	{
		creditsList.push({
			name: name,
			role: role,
			iconPath: iconPath
		});
	}

	function drawCredits():Void
	{
		for (i in 0...creditsList.length)
		{
			var entry = creditsList[i];
			var yPos = yOffset + (i * 80);

			// Draw icon if it exists
			if (entry.iconPath != null)
			{
				var icon = new FlxSprite(100, yPos);
				icon.loadGraphic(entry.iconPath);
				icon.setGraphicSize(60, 60);
				icon.updateHitbox();
				add(icon);
			}

			// Draw name
			var nameText = new FlxText(180, yPos, 0, entry.name, 24);
			nameText.color = FlxColor.WHITE;
			add(nameText);

			// Draw role
			var roleText = new FlxText(180, yPos + 30, 0, entry.role, 16);
			roleText.color = FlxColor.GRAY;
			add(roleText);
		}

		// Add back button instruction
		var backText = new FlxText(0, FlxG.height - 40, 0, "Press ESC to go back", 16);
		backText.alignment = CENTER;
		backText.screenCenter(X);
		backText.color = FlxColor.YELLOW;
		add(backText);
	}

	override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MenuState());
		}
	}
}

typedef CreditEntry = {
	name:String,
	role:String,
	iconPath:Null<String>
}
