event_inherited();

#region [Default]

speed_vertical_max   = 7;
speed_horizontal_max = 4;

bulk = 1;

hadGroundCollised = false;

#endregion

#region [Status]

life_max = 100;
life_now = life_max;
life_regen = .3;

mana_max = 0;
mana_now = mana_max;
mana_regen = .5;

damage_max = 1;
damage_now = 1;

armor = 3;
level = 0;

#endregion

#region [Information]

brood = Brood.Human;
class = Class.Warrior;
state = State.Idle;

identity = Identity.Player;

#endregion

#region [Fighting]

attackStyle = AttackStyle.Melee;
mainWeapon  = MainWeapon.Sword;

comboState = false;
comboIndex = WarriorComboIndex.None;

#endregion

#region [Player Mechanics]

isDoubleJump = false;

#endregion

#region [Warrior Mechanics]

	#region [Warrior Commands]
	
	dash  = false;	
	wield = false;
	
	#endregion

	#region [Warrior Combat]

	/// @Validator Validar Ações do Player [Warrior]
	jumpAttack = false;
	/// @End
	
	warriorTypeAttack  = undefined;
	warriorStyleAttack = WarriorStyleAttack.Hand;
	
	#endregion

	#region [Warrior Moves]
	
	dashDistance = 8;

	#endregion

	#region [Warrior Status]
	#endregion

#endregion  

#region [Direction]

scale_x = 1;

#endregion

#region [Settings]

deviceController = GetDeviceController();

#endregion