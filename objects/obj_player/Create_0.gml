event_inherited();

// @Information
class = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Class;
state = EntityStates.Idle;
identity = Identity.Player;

// @Movimentation
speed_vertical_max   = 7;
speed_horizontal_max = 4;

bulk = 1;

hadGroundCollised = false;

// @Status
life_max   = 100;
life_now   = life_max;
life_regen = 0.3;

mana_max = 0;
mana_now = mana_max;

level = 0;
armor = 1;
strength = 1;

// @Combat
mainWeapon  = class == PlayerClass.Warrior ? PlayerMainWeapon.Sword : PlayerMainWeapon.Staff;
pAttackType = class == PlayerClass.Warrior ? PlayerTypeAttack.Melee : PlayerTypeAttack.Ranged;

comboState = false;
comboIndex = WarriorComboIndex.None;

// @Mechanics
dash = false;
dashDistance = 8;

	// @Warrior
	wield = false;
	weapon = wield ? WarriorWeaponCombat.Sword : WarriorWeaponCombat.Hand;
	jumpAttack = false;
	
	// @Wizard
	teleport = false;
	
// @Direction Sprite
scale_x = 1;

// @Other
items  = [];
quests = [];

// @Debug
view_debugger = true;

vida = 3;