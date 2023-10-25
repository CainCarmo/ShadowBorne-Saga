event_inherited();

// @Information
name     = Boss.Death;
state    = EntityState.Idle;
identity = Identity.Boss;

// @Movimentation
speed_horizontal = 0;
speed_vertical   = 0;

speed_horizontal_max = 3;
speed_vertical_max   = 5;

hadGroundCollised = false;

// @Damage
damage = 19;

// @Status
status = {
	Life: {
		Max: 120,
		Atual: 120,
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

// @Controller
dist_aggro = 500;

// @Draw Bars
enemiesBar = new DrawElementEnemy(objectAtual);