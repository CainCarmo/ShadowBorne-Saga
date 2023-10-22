// @Life And (Mana || Stamina)
playerBars.LifeBar();

_ = class == PlayerClass.Warrior
	? playerBars.StaminaBar()
	: playerBars.ManaBar();

draw_sprite (spr_playerbar, 0, 3, 3);

// @Level
new DrawElementPlayer().LevelBar();

// @Draw Death View
if (state == EntityState.Die)
	new DrawElementPlayer().DeadView();