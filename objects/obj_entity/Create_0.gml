// @Counter
timer = -1;

// @Information
name  = undefined; 
class = undefined;
state = undefined;
identity = undefined;

// @Movimentation
left   = undefined;
right  = undefined;
jump   = undefined;
attack = undefined;

speed_horizontal = 0;
speed_vertical   = 0;

speed_horizontal_max = 0;
speed_vertical_max   = 0;

hadGroundCollised = false;

// @Status
status = {
	Life: {
		Max: 0,
		Atual: 0,
		Regen: 0
	},
	Stamina: {
		Max: 0,
		Atual: 0,
		Regen: 0
	},
	Mana: {
		Max: 0,
		Atual: 0,
		Regen: 0
	},
	Armor: {
		Atual: 0,
		Buffed: 0	
	},
	Strenght: {
		Atual: 0,
		Buffed: 0
	},
	Level: {
		XP: 0,
		LimitXP: 0,
		Count: 0
	},
	Bulk: 1
}

// @Settings
objectAtual = self;

// @Direction Sprite
scale_x = 1;

// @Debug
view_debugger = true;

// @Draw Bars
enemiesBar = new DrawElementEnemy(objectAtual);