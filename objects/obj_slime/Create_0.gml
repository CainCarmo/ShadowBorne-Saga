event_inherited();

// @Information
name     = Minion.Slime;
state    = EntityState.Idle;
identity = Identity.Minion;

// @Movimentation
speed_horizontal = 0;
speed_vertical   = 0;

speed_horizontal_max = 1;
speed_vertical_max   = 3;

hadGroundCollised = false;

// @Status
status = {
	Life: {
		Max: 25,
		Atual: 25,
		Regen: .1
	},
	Bulk: 1
}

// @Settings
objectAtual = self;

// @Direction Sprite
scale_x = 1;

// @Debug
view_debugger = true;

// @Discart
_ = undefined;

// @Draw Bars
enemiesBar = new DrawElementEnemy(objectAtual);