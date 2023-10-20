event_inherited();

// @Information
name  = Minion.Slime;
state = EntityState.Idle;
identity = Identity.Minion;

// @Movimentation
speed_horizontal = 0;
speed_vertical   = 0;

speed_horizontal_max = 0;
speed_vertical_max   = 0;

// @Chase
range = 100;

hadGroundCollised = false;

// @Status
status = {
	Life: {
		Max: 0,
		Atual: 0,
		Regen: 0
	},
	Level: {
		XP: 0,
		LimitXP: 0,
		Count: 0
	},
	Bulk: 1
}

// @Direction Sprite
scale_x = 1;

// @Debug
view_debugger = true;

// @Settings
objectAtual = self;

// @Discart
_ = undefined;