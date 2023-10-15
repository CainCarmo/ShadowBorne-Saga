#region [Common]

enum EntityStates {
	Die,
	Fly,
	Hit,
	Run,
	Dash,
	Idle,
	Jump,
	Walk,
	Climb,
	Wield,
	Attack,
	Dialog,
	Cutscene,
	Consuming
}

enum StructsState {
	Active,
	Activating,
	Disabled
}

enum StockState {
	Open,
	Closed
}

#endregion

#region [Player]

enum PlayerClass {
	Wizard,
	Warrior
}
enum PlayerActions {
	Dash,
	Left,
	Right,
	Jump,
	Attack,
	
	// @Warrior
	Wield,
	
	// @Wizard
	Teleport
}
enum PlayerTypeAttack {
	Melee,
	Ranged
}
enum PlayerMainWeapon {
	Staff,
	Sword
}

	// @Warrior

	enum WarriorComboIndex {
		None   = -1,
		First  =  0,
		Second =  1
	}
	enum WarriorWeaponCombat {
		Hand,
		Sword
	}
	enum WarriorTypeAttack {
		Normal,
		Break,
		JumpSpecial
	}

	// @Wizard
	
	

#endregion

#region [Non-Player Character (NPC)]

enum NPC {
	Leoric,
	Starfeon
}

enum NPCState {
	Idle,
	Appear,
	Disappear
}

#endregion

#region [Enimies]

enum Boss {
	Death,
	KingSlime,
	DemonSkeleton
}
enum SubBoss {
	Nightmare,
	EvilWizard,
	Primordial
}
enum Minion {
	Hound,
	Slime,
	Goblin,
	EvilEye,
	Mushroom,
	Skeleton,
	FireWorm
}

#endregion

#region [Interactions]
#endregion

#region [Interfaces]

	// @Menu - Initial
	enum MenuInitialOptions {
		Continue,
		NewGame,
		Disclaimer,
		Credits,
		Close
	}

#endregion

#region [Room]

enum RoomState {
	Normal,
	Paused,
	Loading,
	Cutscene
}

#endregion

#region [Settings]
	
	// @Controller
	enum DeviceController {
		Joystick,
		Keyboard
	}

#endregion