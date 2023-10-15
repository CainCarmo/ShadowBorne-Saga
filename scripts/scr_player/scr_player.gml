function PlayerStates () constructor {
	static Die = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Die();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Die();
				break;
		}
		
		if (obj_player.left != obj_player.right)
			AlterPlayerDefault(,,, EntityStates.Walk);
		else if (obj_player.jump && obj_player.hadGroundCollised)
			AlterPlayerDefault(, -obj_player.speed_vertical_max,, EntityStates.Jump, true)
		else if (obj_player.attack)
			AlterPlayerDefault(0, 0,, EntityStates.Attack, true);
	}
	static Fly = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Fly();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Fly();
				break;
		}
	}
	static Hit = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Hit();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Hit();
				break;
		}
	}
	static Run = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Run();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Run();
				break;
		}
	}
	static Dash = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Dash();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Dash();
				break;
		}
	}
	static Idle	= function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Idle();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Idle();
				break;
		}
	}
	static Jump	= function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Jump();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Jump();
				break;
		}
	}
	static Walk	= function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Walk();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Walk();
				break;
		}
	}
	static Climb = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Climb();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Climb();
				break;
		}
	}
	static Wield = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Wield();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Wield();
				break;
		}
	}
	static Attack = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Attack();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Attack();
				break;
		}
	}
	static Dialog = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Dialog();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Dialog();
				break;
		}
	}
	static Cutscene	= function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Cutscene();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Cutscene();
				break;
		}
	}
	static Consuming = function () {
		switch (obj_player.class) {
			case PlayerClass.Wizard:
				new WizardStates().Consuming();
				break;
			case PlayerClass.Warrior:
				new WarriorStates().Consuming();
				break;
		}
	}
}

function AlterPlayerDefault (sx = undefined, sy = undefined, bulk = undefined, state = undefined, clearImageIndex = false) {
	obj_player.speed_horizontal = sx	== undefined ? obj_player.speed_horizontal : sx;
	obj_player.speed_vertical   = sy	== undefined ? obj_player.speed_vertical   : sy;
	obj_player.bulk			    = bulk  == undefined ? obj_player.bulk			   : bulk;
	obj_player.state			= state == undefined ? obj_player.state			   : state;
	
	if (clearImageIndex) obj_player.image_index = 0;
}