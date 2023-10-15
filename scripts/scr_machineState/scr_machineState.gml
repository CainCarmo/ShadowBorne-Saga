function MachineState () constructor {
	static Player = function () {
		switch (obj_player.state) {
			case EntityStates.Die:
				new PlayerStates().Die();
				break;
			case EntityStates.Hit:
				new PlayerStates().Hit();
				break;
			case EntityStates.Dash:
				new PlayerStates().Dash();
				break;
			case EntityStates.Idle:
				new PlayerStates().Idle();
				break;
			case EntityStates.Jump:
				new PlayerStates().Jump();
				break;
			case EntityStates.Walk:
				new PlayerStates().Walk();
				break;
			case EntityStates.Wield:
				new PlayerStates().Wield();
				break;
			case EntityStates.Attack:
				new PlayerStates().Attack();
				break;
			case EntityStates.Dialog:
				new PlayerStates().Dialog();
				break;
			case EntityStates.Cutscene:
				new PlayerStates().Cutscene();
				break;
		}
	}
	
	static Enimies = function (_obj) {
		switch (_obj.state) {
			case EntityStates.Die:
				break;
			case EntityStates.Fly:
				break;
			case EntityStates.Hit:
				break;
			case EntityStates.Run:
				break;
			case EntityStates.Dash:
				break;
			case EntityStates.Idle:
				break;
			case EntityStates.Jump:
				break;
			case EntityStates.Walk:
				break;
			case EntityStates.Wield:
				break;
			case EntityStates.Attack:
				break;
			case EntityStates.Dialog:
				break;
			case EntityStates.Cutscene:
				break;
		}
	}
	
	static NPC = function (_obj) {
		switch (_obj.state) {
			case EntityStates.Die:
				break;
			case EntityStates.Fly:
				break;
			case EntityStates.Hit:
				break;
			case EntityStates.Run:
				break;
			case EntityStates.Dash:
				break;
			case EntityStates.Idle:
				break;
			case EntityStates.Jump:
				break;
			case EntityStates.Walk:
				break;
			case EntityStates.Wield:
				break;
			case EntityStates.Attack:
				break;
			case EntityStates.Dialog:
				break;
			case EntityStates.Cutscene:
				break;
		}
	}
	
	static Obelisk = function () {
		switch (obj_obelisk.state) {
			case StructsState.Disabled:
				break;
			case StructsState.Activating:
				break;
			case StructsState.Active:
				break;
		}
	}
	
	static Totem = function () {
		switch (obj_totem.state) {
			case StructsState.Disabled:
				break;
			case StructsState.Activating:
				break;
			case StructsState.Active:
				break;
		}
	}
	
	static Chest = function () {
		switch (obj_chest.state) {
			case StockState.Closed:
				break;
			case StockState.Open:
				break
		}
	}
	
	static Room = function () {
		switch (obj_room.state) {
			case RoomState.Normal:
				break;
			case RoomState.Loading:
				break;
			case RoomState.Paused:
				break;
			case RoomState.Cutscene:
				break;
		}
	}
}