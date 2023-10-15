// @Information
class	 = undefined;
state	 = undefined;
identity = undefined;
name = undefined;

// @Movimentation
left  = false;
right = false;
jump  = false;

speed_vertical   = 0;
speed_horizontal = 0;

speed_vertical_max   = 0;
speed_horizontal_max = 0;

bulk = 0;

hadGroundCollised = false;

// @Status
life_max   = 100;
life_now   = life_max;
life_regen = 0.3;

mana_max = 0;
mana_now = mana_max;

armor = 0;
level = 0;
strength = 0;

// @Combat
mainWeapon = undefined;
pAttackType = PlayerTypeAttack.Melee;

comboState = false;
comboIndex = WarriorComboIndex.None;

// @Mechanics
weapon = undefined;	
	
// @Direction Sprite
scale_x = 1;

// @Debug
view_debugger = true;



#region Person - [Information]
class	 = undefined;
state	 = undefined;
identity = undefined;
#endregion

#region Person - [Movimentation]

#endregion

#region Person - [Fighting]
attack = false;
weapon = undefined;
#endregion