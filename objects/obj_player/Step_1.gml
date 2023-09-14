#region [Controller Check]

/// @Default
left  = new ControllerMappingCommands(obj_player).Moves(PlayerActions.Left);
right = new ControllerMappingCommands(obj_player).Moves(PlayerActions.Right);
jump  = new ControllerMappingCommands(obj_player).Moves(PlayerActions.Jump);

/// @Warrior

dash   = new ControllerMappingCommands(obj_player).Moves(PlayerActions.Dash);
wield  = new ControllerMappingCommands(obj_player).Moves(PlayerActions.Wield);
attack = new ControllerMappingCommands(obj_player).Attack();

/// @Wizard


//dash   = PlayerControllerMap(PlayerActions.Dash);
//left   = PlayerControllerMap(PlayerActions.Left);
//right  = PlayerControllerMap(PlayerActions.Right);
//jump   = PlayerControllerMap(PlayerActions.Jump);
//wield  = PlayerControllerMap(PlayerActions.Wield);
//attack = PlayerControllerMap(PlayerActions.Attack);

#endregion