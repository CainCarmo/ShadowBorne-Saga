// @Default
enum EntityState {
	Die,
	Fly,
	Hit,
	Dash,
	Idle,
	Jump,
	Walk,
	Wield,
	Attack,
	Dialog,
	Teleport,
	Cutscene
}

enum StructState {
	Active,
	Activating,
	Disabled
}

enum StockState {
	Open,
	Closed
}

enum Identity {
	// @Non-Player
	NPC,
	// @Player
	Player,
	// @Enimies
	Boss,
	SubBoss,
	Minion,
	// @Structs
	Obelisk,
	Totem,
	// @Storage
	Chest
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
	// @Wizard
	Teleport
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