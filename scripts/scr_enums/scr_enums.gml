#region Enums [Information]

enum Brood {
	Human
}

enum Class {
	Guard,
	Rogue,
	Wizard,
	Warrior
}

enum Identity {
	NPC,
	Player,
	Enimies
}

#endregion

#region Enums [States]

enum State {
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
	Cutscene
}

#endregion

#region Enums [Battle]

enum AttackStyle {
	Melee,
	Ranged
}

enum MainWeapon {
	Sword,
	Staff
}

#endregion

#region Enums [Enimies & NPC]

enum Enimies {
	// Boss
	Death,
	KingSlime,
	DemonSkeleton,
	// MiniBoss
	Nightmare,
	EvilWizard,
	Primordial,
	// Minion
	Hound,
	Slime,
	Goblin,
	EvilEye,
	Mushroom,
	Skeleton,
}

enum NPC {
	Leoric
}

#endregion