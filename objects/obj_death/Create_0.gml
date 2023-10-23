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
damage = 9;

// @Status
status = {
	Life: {
		Max: 100,
		Atual: 100,
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
dist_aggro = 300;

// @Draw Bars
enemiesBar = new DrawElementEnemy(objectAtual);