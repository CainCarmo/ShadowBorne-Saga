event_inherited();


speed_vertical_max   = 7;
speed_horizontal_max = 4;

bulk = 1;

hadGroundCollised = false;



life_max   = 100;
life_now   = life_max;
life_regen = 0.3;

mana_max = 0;
mana_now = mana_max;

armor = 1;
level = 0;
strength = 1;

show_debug_message(global.SaveData.LastSavePlayed);

class	 = global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Class;
state	 = EntityStates.Cutscene;




mainWeapon = undefined;
pAttackType = PlayerTypeAttack.Melee;

comboState = false;
comboIndex = WarriorComboIndex.None;

dash = false;

wield = false;
teleport = false;

jumpAttack = false;

wAttackType = undefined;

weapon = undefined;

dashDistance = 8;

scale_x = 1;



view_debugger = true;


items = [];
quests = [];