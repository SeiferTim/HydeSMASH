package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.resolution.FillResolutionPolicy;
import flixel.system.resolution.FixedResolutionPolicy;
import flixel.system.resolution.RatioResolutionPolicy;
import flixel.system.resolution.RelativeResolutionPolicy;
import flixel.system.resolution.StageSizeResolutionPolicy;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		
		FlxG.resolutionPolicy = new RatioResolutionPolicy();
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.visible = true;
		#end
		
		
		add(new FlxText(0, 0, FlxG.width, "Press X to Play"));
		
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		
		if (FlxG.keys.anyJustReleased(["X"]))
		{
			FlxG.switchState(new PlayState());
		}
		
		super.update();
	}	
}