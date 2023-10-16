function WarriorStates () constructor {
	static Die = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1))
			room_restart();
	}
	static Hit = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Dash = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		AlterPlayerDefault(obj_player.speed_horizontal + (obj_player.dashDistance * obj_player.scale_x));
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1))
			AlterPlayerDefault(0, 0,, EntityStates.Idle, true);
	}
	static Idle	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (obj_player.dash)
			new WarriorCommands().Dash();
		else if (obj_player.wield)
			new WarriorCommands().Wield();
	}
	static Jump	= function () {
		if (obj_player.hadGroundCollised)
			new AlterWarrior().Attack(,, false);
			
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Walk	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (obj_player.dash)
			new WarriorCommands().Dash();
		else if (obj_player.wield)
			new WarriorCommands().Wield();
	}
	static Wield = function () {
		AlterPlayerDefault(0,0);
		
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1))
			AlterPlayerDefault(0, 0,, EntityStates.Idle, true);
	}
	static Attack = function () {
		if (!obj_player.hadGroundCollised)
			new WarriorCombat().Air();
		else
			new WarriorCombat().Ground();
	}
	static Dialog = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Cutscene	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
}

function WarriorCombat () constructor {
	static Air = function () {
		if (!obj_player.jumpAttack) {
			new ControllerSprite(obj_player).AssignSpriteToObject();
			new AlterWarrior().Attack(,, true);
		}
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1)) 
			AlterPlayerDefault(,,, EntityStates.Jump, false);
	}
	static Ground = function () {
		AlterPlayerDefault(0,0);
		
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		var isComboIndexValid = obj_player.comboIndex <= WarriorComboIndex.Second;
		var isFrameComboValid = new ControllerSprite(obj_player).ListenerSpriteIndex(2);
		
		if (obj_player.attack && isFrameComboValid) {
			AlterPlayerDefault(0,0)
			new AlterWarrior().Attack(true, WarriorComboIndex.First);
		}
		else if (new ControllerSprite(obj_player).ListenerSpriteIndex(1)) {
			AlterPlayerDefault(,,, EntityStates.Idle, true)
			new AlterWarrior().Attack(false, WarriorComboIndex.None);
		}
		
		if (isComboIndexValid && new ControllerSprite(obj_player).ListenerSpriteIndex(1)) {
			switch (obj_player.comboIndex) {
				case WarriorComboIndex.First:
					AlterPlayerDefault(,,,, true);
					new AlterWarrior().Attack(, WarriorComboIndex.Second);
					break;
				case WarriorComboIndex.Second:
					AlterPlayerDefault(,,,, true);
					new AlterWarrior().Attack(false, WarriorComboIndex.None);
					break;
			}
		}
	}
	static CollidionAttack = function () {
		//if (place_meeting(obj_player.x, obj_player.y, )) {
					
		//}
		//if (place_meeting(obj_player.x, obj_player.y, )) {
			
		//}
	}
}

function WarriorCommands () constructor {
	static Dash = function () {
		AlterPlayerDefault(,,, EntityStates.Dash, true);
	}
	static Wield = function () {
		AlterPlayerDefault(0,0,, EntityStates.Wield, true);
		new AlterWarrior().Move(obj_player.weapon == WarriorWeaponCombat.Hand ? WarriorWeaponCombat.Sword : WarriorWeaponCombat.Hand);
	}
	
}

function AlterWarrior () constructor {
	static Move = function (weapon = undefined) {
		obj_player.weapon = weapon == undefined ? obj_player.weapon : weapon;
	}
	static Attack = function (cs = undefined, ci = undefined, ja = undefined, wta = undefined) {
		obj_player.comboState = cs == undefined ? obj_player.comboState : cs;
		obj_player.comboIndex = ci == undefined ? obj_player.comboIndex : ci;
		obj_player.jumpAttack = ja == undefined ? obj_player.jumpAttack : ja;
	}
}
