// @Controller Check [Default]
left   = new ControllerMappingCommands().Moves(PlayerActions.Left);
right  = new ControllerMappingCommands().Moves(PlayerActions.Right);
jump   = new ControllerMappingCommands().Moves(PlayerActions.Jump);
dash   = new ControllerMappingCommands().Moves(PlayerActions.Dash);
attack = new ControllerMappingCommands().Combat();

// @Controller Check [Warrior]
if (class == PlayerClass.Warrior)
	wieldToggle = new ControllerMappingCommands().Moves(PlayerActions.Wield);

// @Controller Check [Wizard]
//mechanics.Wizard.Teleport = new ControllerMappingCommands().Moves(PlayerActions.Teleport);