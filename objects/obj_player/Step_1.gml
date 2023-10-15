 #region [Controller Check]

// @Default
left   = new ControllerMappingCommands().Moves(PlayerActions.Left);
right  = new ControllerMappingCommands().Moves(PlayerActions.Right);
jump   = new ControllerMappingCommands().Moves(PlayerActions.Jump);
dash   = new ControllerMappingCommands().Moves(PlayerActions.Dash);
attack = new ControllerMappingCommands().Attack();

// @Warrior
wield  = new ControllerMappingCommands().Moves(PlayerActions.Wield);

// @Wizard
teleport = new ControllerMappingCommands().Moves(PlayerActions.Teleport);
#endregion