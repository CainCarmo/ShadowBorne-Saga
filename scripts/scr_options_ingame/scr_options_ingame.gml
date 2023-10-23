function OptionsInGame () constructor {
	static Continue = function () {
		obj_menu.selectedOption = undefined;
		obj_room.state = EnvironmentState.Normal;
	}
	static BackToHome = function () {
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Life.Max   = obj_player.status.Life.Max;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Life.Atual = obj_player.status.Life.Atual;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Life.Regen = obj_player.status.Life.Regen;
				
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Stamina.Max   = obj_player.status.Stamina.Max;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Stamina.Atual = obj_player.status.Stamina.Atual;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Stamina.Regen = obj_player.status.Stamina.Regen;
				
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Mana.Max   = obj_player.status.Mana.Max;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Mana.Atual = obj_player.status.Mana.Atual;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Mana.Regen = obj_player.status.Mana.Regen;
				
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Armor.Atual  = obj_player.status.Armor.Atual;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Armor.Buffed = obj_player.status.Armor.Buffed;
				
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Strenght.Atual  = obj_player.status.Strenght.Atual;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Strenght.Buffed = obj_player.status.Strenght.Buffed;
				
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Level.XP      = obj_player.status.Level.XP;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Level.LimitXP = obj_player.status.Level.LimitXP;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Level.Count   = obj_player.status.Level.Count;
				
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Status.Bulk = obj_player.status.Bulk;
				
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Movimentation.Speed.Vertical   = obj_player.speed_vertical_max;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Movimentation.Speed.Horizontal = obj_player.speed_horizontal_max;
				
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Combat.Wield = obj_player.mechanics.Warrior.Wield;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Combat.Dash.Distance = obj_player.dashDistance;
		
		if (instance_exists(obj_horde))
			global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Rounds.Step = obj_horde.steps;
		
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local.Room = room;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local._x   = obj_player.x;
		global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local._y   = obj_player.y;
		
		new CreateSave().Save();
		
		room_goto(rm_initial);
	}
}