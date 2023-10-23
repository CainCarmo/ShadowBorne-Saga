function ObeliskState () constructor {
	static Active = function () {
		new ControllerSprite(obj_obelisk).AssignSpriteToObject();
		
		if (obj_obelisk.timer == 0) {
			global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local._x = obj_player.x;
			global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local._y = obj_player.y;
			
			new CreateSave().Save();
		}
		else if (obj_obelisk.timer > 0) {
			new Utils(obj_obelisk).SetTimer(2);
		}
	}
	static Activating = function () {
		new ControllerSprite(obj_obelisk).AssignSpriteToObject();
		
		if (new ControllerSprite(obj_obelisk).ListenerSpriteIndex(1)) {
			obj_obelisk.state = StructState.Active;
			
			new Utils(obj_obelisk).SetTimer(2);
		}
	}
	static Disabled = function () {
		new ControllerSprite(obj_obelisk).AssignSpriteToObject();
	}
}

function DrawSave () {
	var wGUI = display_get_gui_width();
	var hGUI = display_get_gui_height();	
	
	new DrawGUI()
		.Text("Jogo Salvo", wGUI - 200, hGUI - 150, 1, 1, ft_status,, true, c_black, fa_left, fa_top);
}