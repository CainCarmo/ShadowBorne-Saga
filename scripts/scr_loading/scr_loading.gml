function CreateLoading () {
	loadingSettings = {
		TimerSecs: 7,
		MarginBar: 3,
		HeightBar: 30,
		ColorBar:  c_lime
	}
	
	var loadingMessages = [
		"Loading",
		"Loading.",
		"Loading..",
		"Loading..."
	]
	
	var wGUI = display_get_gui_width();
	var hGUI = display_get_gui_height();
	
	new Utils(obj_loading).SetTimer(loadingSettings.TimerSecs);
	
	if (obj_loading.timer == 0) {
		obj_loading.loadingCompleted = true;
		
		var saveStruct = global.SaveData.Saves[global.SaveData.LastSavePlayed];
		
		if (room == rm_astravens && !instance_exists(obj_player))
			instance_create_layer(saveStruct.Character.Local._x, saveStruct.Character.Local._y, "Instances", obj_player);
		else if (room == rm_arena) {
			if (!instance_exists(obj_player) && global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local.Room != rm_arena)
				instance_create_layer(95, 500, "Instances", obj_player);
			else if (!instance_exists(obj_player))
				instance_create_layer(saveStruct.Character.Local._x, saveStruct.Character.Local._y, "Instances", obj_player);
				
			if (!instance_exists(obj_death))
				instance_create_layer(1500, 670, "Enemies", obj_death)
			
			global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local.Room = room;
			
			new CreateSave().Save();
		}
			
		obj_loading.timer = -1;
	}
	else {
		if (obj_loading.timer % (loadingSettings.TimerSecs + 3) == 0)
			obj_loading.messageIndex = obj_loading.messageIndex >= array_length(loadingMessages) - 1 ? 0 : obj_loading.messageIndex + 1;
			
		if (counterIndexBackground <= counterNumberBackground && timer % loadingSettings.TimerSecs == 0)
			counterIndexBackground++;
		else if (counterIndexBackground >= counterNumberBackground)
			counterIndexBackground = 0;
		
		new DrawGUI()
			.Text(loadingMessages[obj_loading.messageIndex], 10, (hGUI - loadingSettings.HeightBar) - 40, 1, 1, ft_default);
		new DrawGUI()
			.LoadingBar(loadingSettings.MarginBar, hGUI, wGUI - loadingSettings.MarginBar, hGUI - loadingSettings.HeightBar, true, loadingSettings.ColorBar, obj_loading.timer, loadingSettings.TimerSecs);
	}
}

function SetLoadingBackground () {
	randomize();
	
	randomBackgrounds = [
		spr_background_loading_1,
		spr_background_loading_2,
		spr_background_loading_3,
		spr_background_loading_4
	];
	
	var UUID = round(random_range(0, array_length(randomBackgrounds) - 1));
	
	return randomBackgrounds[UUID];
}