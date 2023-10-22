function WarriorState () constructor {
	static Die = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Hit = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1))
			AlterPlayerDefault(,,, EntityState.Idle, true);
	}
	static Dash = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1))
			AlterPlayerDefault(,,, EntityState.Idle, true);
	}
	static Idle	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (obj_player.dash)
			new WarriorCommands().Dash();
		else if (obj_player.wieldToggle)
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
		else if (obj_player.wieldToggle)
			new WarriorCommands().Wield();
	}
	static Wield = function () {
		AlterPlayerDefault(0, 0);
		
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1))
			AlterPlayerDefault(,,, EntityState.Idle, true);
	}
	static Attack = function () {
		new WarriorCommands().Attack();
	}
	static Dialog = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Cutscene	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
}

function WarriorCommands () constructor {
	static Dash = function () {
		if (obj_player.status.Stamina.Atual > 5) {
			AlterPlayerDefault(,,, EntityState.Dash, true);
		
			obj_player.status.Stamina.Atual -= 5;
		}
	}
	static Wield = function () {
		AlterPlayerDefault(,,, EntityState.Wield, true);
		
		new AlterWarrior().Move(); 
	}
	static Attack = function () {
		var attack = {
			Ground: function () {
				AlterPlayerDefault(0, 0);
				
				new ControllerSprite(obj_player).AssignSpriteToObject();
				WarriorHitBox();
				
				var isComboIndexValid = obj_player.mechanics.Warrior.ComboIndex <= WarriorComboIndex.Second;
				var isFrameComboValid = new ControllerSprite(obj_player).ListenerSpriteIndex(2);
		
				if (obj_player.attack && isFrameComboValid) {
					AlterPlayerDefault(0,0)
					
					new AlterWarrior().Attack(true, WarriorComboIndex.First);
				}
				else if (new ControllerSprite(obj_player).ListenerSpriteIndex(1)) {
					AlterPlayerDefault(,,, EntityState.Idle, true)
					
					new AlterWarrior().Attack(false, WarriorComboIndex.None);
				}
		
				if (isComboIndexValid && new ControllerSprite(obj_player).ListenerSpriteIndex(1)) {
					switch (obj_player.mechanics.Warrior.ComboIndex) {
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
			},
			Air: function () {
				if (!obj_player.mechanics.Warrior.JumpAttack) {
					new ControllerSprite(obj_player).AssignSpriteToObject();
					
					new AlterWarrior().Attack(,, true);
				}
		
				if (new ControllerSprite(obj_player).ListenerSpriteIndex(1)) 
					AlterPlayerDefault(,,, EntityState.Jump, false);
			}
		}
		
		if (!obj_player.hadGroundCollised)
			attack.Air();
		else
			attack.Ground();
	}
}

function AlterWarrior () constructor {
	static Move = function () {
		obj_player.mechanics.Warrior.Wield = obj_player.mechanics.Warrior.Wield ? false : true;
	}
	
	static Attack = function (cs = undefined, ci = undefined, ja = undefined) {
		obj_player.mechanics.Warrior.ComboState = cs == undefined ? obj_player.mechanics.Warrior.ComboState : cs;
		obj_player.mechanics.Warrior.ComboIndex = ci == undefined ? obj_player.mechanics.Warrior.ComboIndex : ci;
		obj_player.mechanics.Warrior.JumpAttack = ja == undefined ? obj_player.mechanics.Warrior.JumpAttack : ja;
	}
}

function WarriorHitBox () {
	if (!instance_exists(obj_player_hitbox)) {
		var hitbox = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_player_hitbox);
		
		hitbox.image_xscale = obj_player.scale_x;
	}
	
	if (new ControllerSprite(obj_player).ListenerSpriteIndex(1)) {
		if (instance_exists(obj_player_hitbox)) instance_destroy(obj_player_hitbox);
	}
}