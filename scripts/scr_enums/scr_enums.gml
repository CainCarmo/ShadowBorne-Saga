// @Default
enum EntityState {
	Die,
	Hit,
	Dash,
	Idle,
	Jump,
	Walk,
	Chase,
	Wield,
	Attack,
	Dialog,
	Cutscene
}

enum StructState {
	Active,
	Activating,
	Disabled
}

enum Identity {
	// @Non-Player
	NPC,
	// @Player
	Player,
	// @Enimies
	Boss,
	Minion,
	// @Structs
	Obelisk,
	Totem
}

// @Player
enum PlayerClass {
	Warrior,
	Wizard
}

enum PlayerActions {
	Left,
	Right,
	Jump,
	Attack,
	Dash,
	// @Warrior
	Wield,
}

	// @Warrior	
	enum WarriorComboIndex {
		None   = -1,
		First  =  0,
		Second =  1
	}
	
	enum WarriorWeaponCombat {
		Hand,
		Sword,
	}
	
	// @Wizard
	
// @NPC (Non-Player)
enum IdentiyNPC {
	Leoric,
	Starfeon
}

enum NPCState {
	Idle,
	Appear,
	Disappear
}

// @Enimies
enum Boss {
	Death,
	KingSlime,
	DemonSkeleton
}

enum Minion {
	Hound,
	Slime,
	Goblin,
	Mushroom,
	Skeleton,
}

// @Room
enum EnvironmentState {
	Normal,
	Paused,
	Loading,
	Cutscene
}

// @Interfaces
enum MenuInitialOptions {
	Continue,
	NewGame,
	Credits,
	Close
}

enum MenuInGameOptions {
	Continue,
	BackToHome
}