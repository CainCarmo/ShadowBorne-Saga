function WizardState () constructor {
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
	}
	static Jump	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Walk	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (obj_player.dash)
			new WarriorCommands().Dash();
	}
	static Attack = function () {
		if (obj_player.status.Mana.Atual > 3) 
			new MachineProjectile().Player();
			
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1))
			AlterPlayerDefault(,,, EntityState.Idle, true);
	}
	static Dialog = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Cutscene	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
}