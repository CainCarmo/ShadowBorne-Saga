event_inherited();

// @Information
name     = Minion.Skeleton;
state    = EntityState.Idle;
identity = Identity.Minion;

// @Movimentation
speed_horizontal = 0;
speed_vertical   = 0;

speed_horizontal_max = 2;
speed_vertical_max   = 6;

hadGroundCollised = false;

// @Damage
damage = 13;

// @Status
status = {
	Life: {
		Max: 50,
		Atual: 50,
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
dist_aggro = 200;

// @Draw Bars
enemiesBar = new DrawElementEnemy(objectAtual);