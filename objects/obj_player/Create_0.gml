event_inherited();

// @Struct Save
saveStruct = global.SaveData.Saves[global.SaveData.LastSavePlayed];

// @Timer Hit
timerHit = 0;

// @Alarm
alarm[0] = 1;

// @Information
name  = ""; 
class = saveStruct.Character.Class;
state = hadGroundCollised ? EntityState.Idle : EntityState.Jump;
identity = Identity.Player;

// @Collision
self.mask_index = self.class == PlayerClass.Warrior
	? spr_warrior_idle_s
	: spr_wizard_idle;

// @Movimentation
left  = undefined;
right = undefined;
jump  = undefined;

speed_horizontal = 0;
speed_vertical   = 0;

speed_horizontal_max = saveStruct.Character.Movimentation.Speed.Horizontal;
speed_vertical_max   = saveStruct.Character.Movimentation.Speed.Vertical;

hadGroundCollised = false;

// @Status
status = {
	Life: {
		Max:   saveStruct.Character.Status.Life.Max,
		Atual: saveStruct.Character.Status.Life.Atual,
		Regen: saveStruct.Character.Status.Life.Regen
	},
	Stamina: {
		Max:   saveStruct.Character.Status.Stamina.Max,
		Atual: saveStruct.Character.Status.Stamina.Atual,
		Regen: saveStruct.Character.Status.Stamina.Regen
	},
	Mana: {
		Max:   saveStruct.Character.Status.Mana.Max,
		Atual: saveStruct.Character.Status.Mana.Atual,
		Regen: saveStruct.Character.Status.Mana.Regen
	},
	Armor: {
		Atual:  saveStruct.Character.Status.Armor.Atual,
		Buffed: saveStruct.Character.Status.Armor.Buffed
	},
	Strenght: {
		Atual:  saveStruct.Character.Status.Strenght.Atual,
		Buffed: saveStruct.Character.Status.Strenght.Buffed
	},
	Level: {
		XP:		 saveStruct.Character.Status.Level.XP,
		LimitXP: saveStruct.Character.Status.Level.LimitXP,
		Count:	 saveStruct.Character.Status.Level.Count
	},	
	Bulk: saveStruct.Character.Status.Bulk
};

// @Mechanics
dash = false;
wieldToggle = false;

dashDistance = saveStruct.Character.Combat.Dash.Distance;

mechanics = {
	Warrior: {
		Wield: saveStruct.Character.Combat.Wield,
		ComboState: false,
		ComboIndex: WarriorComboIndex.None,
		JumpAttack: false
	},
	Wizard: {
		Teleport: false
	}
}

// @Draw Bars
playerBars = new DrawElementPlayer();

// @Get All Enemies In Room
enemies = []

for (var i = 0; i < instance_number(obj_entity); ++i;)
{
    if (instance_find(obj_entity, i).identity != Identity.Player && instance_find(obj_entity, i).identity != Identity.NPC)
		enemies[i] = instance_find(obj_entity, i);
}

// @Direction Sprite
scale_x = 1;

// @Debug
view_debugger = true;

// @Settings
objectAtual = self;

// @Discart
_ = undefined;

// @Projectile
timerProjectile = 0;