#region GRAVITY

#macro GRAVITY .3

#endregion

#region Enums Status

enum Brood {
	Human,
	EvilEye,
	Goblin,
	Mushroom,
	Skeleton
}
enum State {
	Idle,
	Run,
	Attack,
	Fly,
	Jump,
	Hit,
	Die,
	Berseker,
	Cutscene
}
enum Type  {
	Boss,
	SubBoss,
	Minion
}
enum Class {
	Warrior,
	Wizard,
	Rogue,
	Guard
}
enum Combo {
	First,
	Second
}

#endregion