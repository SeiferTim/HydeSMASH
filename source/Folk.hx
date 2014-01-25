package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Tile Isle
 */
class Folk extends FlxSprite
{

	private var _brain:FSM;
	private var _scareRange:Int = 100;
	private static inline var SPEED:Int = 120;
	private var _runTimer:Float;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(16, 16, 0xff660066);
		
		_brain = new FSM();
		_brain.setState(idle);
		
	}
	
	private function idle():Void
	{
		velocity.x = 0;
		velocity.y = 0;
		
		if (Reg.playState.mode == Reg.playState.MODE_H && FlxMath.distanceBetween(this, Reg.playState.playerPos) < _scareRange)
		{
			_brain.setState(runAway);
		}
	}
	
	private function runAway():Void
	{
		var a:Float = FlxAngle.angleBetween(Reg.playState.playerPos, this, true);
		var v:FlxPoint = FlxAngle.rotatePoint(SPEED, 0, 0, 0, a);
		velocity.x = v.x;
		velocity.y = v.y;
		
		if (Reg.playState.mode != Reg.playState.MODE_H || FlxMath.distanceBetween(this, Reg.playState.playerPos) >= _scareRange)
		{
			if (_runTimer > 3)
				_brain.setState(idle);
			else
			{
				_runTimer += FlxG.elapsed * FlxRandom.intRanged(2,4);
			}
			
		}
		else
		{
			_runTimer = 0;
		}
		
	}
	
	override public function update():Void 
	{
		_brain.update();
		
		super.update();
	}
	
}