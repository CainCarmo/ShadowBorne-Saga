event_inherited();

// @Information
name     = Minion.Goblin;
state    = EntityState.Idle;
identity = Identity.Minion;

// @Movimentation
speed_horizontal = 0;
speed_vertical   = 0;

speed_horizontal_max = 1.5;
speed_vertical_max   = 6;

hadGroundCollised = false;

// @Damage
damage = 11;

// @Status
status = {
	Life: {
		Max: 58,
		Atual: 58,
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