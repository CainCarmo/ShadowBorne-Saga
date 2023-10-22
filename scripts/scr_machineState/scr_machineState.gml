function MachineState () constructor {
	static Player = function () {
		if (obj_room.state != EnvironmentState.Normal) exit;
		
		switch (obj_player.state) {
			case EntityState.Die:
				new PlayerState().Die();
				break;
			case EntityState.Hit:
				new PlayerState().Hit();
				break;
			case EntityState.Dash:
				new PlayerState().Dash();
				break;
			case EntityState.Idle:
				new PlayerState().Idle();
				break;
			case EntityState.Jump:
				new PlayerState().Jump();
				break;
			case EntityState.Walk:
				new PlayerState().Walk();
				break;
			case EntityState.Wield:
				new PlayerState().Wield();
				break;
			case EntityState.Attack:
				new PlayerState().Attack();
				break;
			case EntityState.Dialog:
				new PlayerState().Dialog();
				break;
			case EntityState.Cutscene:
				new PlayerState().Cutscene();
				break;
		}
	}
	
	static Enimies = function (_obj) {
		if (obj_room.state != EnvironmentState.Normal) exit;
		
		switch (_obj.state) {
			case EntityState.Die:
				new EnemyState().Die(_obj);
				break;
			case EntityState.Hit:
				new EnemyState().Hit(_obj);
				break;
			case EntityState.Dash:
				new EnemyState().Dash(_obj);
				break;
			case EntityState.Idle:
				new EnemyState().Idle(_obj);
				break;
			case EntityState.Jump:
				new EnemyState().Jump(_obj);
				break;
			case EntityState.Walk:
				new EnemyState().Walk(_obj);
				break;
			case EntityState.Attack:
				new EnemyState().Attack(_obj);
				break;
			case EntityState.Cutscene:
				new EnemyState().Cutscene(_obj);
				break;
		}
	}
	
	static NPC = function (_obj) {
		if (obj_room.state != EnvironmentState.Normal) exit;
		
		switch (_obj.state) {
			case EntityState.Idle:
				new NonPlayerState().Idle(_obj);
				break;
			case EntityState.Dialog:
				new NonPlayerState().Dialog(_obj);
				break;
		}
	}
	
	static Obelisk = function () {
		if (obj_room.state != EnvironmentState.Normal) exit;
		
		switch (obj_obelisk.state) {
			case StructState.Disabled:
				new ObeliskState().Disabled();
				break;
			case StructState.Activating:
				new ObeliskState().Activating();
				break;
			case StructState.Active:
				new ObeliskState().Active();
				break;
		}
	}
	
	static Totem = function () {
		if (obj_room.state != EnvironmentState.Normal) exit;
		
		switch (obj_totem.state) {
			case StructState.Disabled:
				new TotemState().Disabled();
				break;
			case StructState.Activating:
				new TotemState().Activating();
				break;
			case StructState.Active:
				new TotemState().Active();
				break;
		}
	}
	
	static Room = function () {
		switch (obj_room.state) {
			case EnvironmentState.Normal:
				new RoomState().Normal();
				break;
			case EnvironmentState.Paused:
				new RoomState().Paused();
				break;
			case EnvironmentState.Loading:
				new RoomState().Loading();
				break;
			case EnvironmentState.Cutscene:
				new RoomState().Cutscene();
				break;
		}
	}
}