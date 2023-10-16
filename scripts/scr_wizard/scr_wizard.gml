function WizardStates () constructor {
	static Die = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Hit = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Run = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Idle	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Jump	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Walk	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Attack = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_player).ListenerSpriteIndex(1)) {
			AlterPlayerDefault(,,, EntityStates.Idle, true)
		}
	}
	static Dialog = function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
	static Cutscene	= function () {
		new ControllerSprite(obj_player).AssignSpriteToObject();
	}
}

function AlterWizard () constructor {
	static Move = function () {}
	static Combat = function () {}
}