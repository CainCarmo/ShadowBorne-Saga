#region Enums [RegionRoom]

enum RegionRoom {
	Cave,
	City,
	Florest
}

#endregion

#region Functions [Create Loading Elements] & [Set Background Loading Room]

/// @function							 CreateLoading(_obj_loading)
/// @description						 Cria os elementos da tela de loading
/// @param {Asset.GMObject} _obj_loading Objeto loading
function CreateLoading (_obj_loading) {
	loadingSettings = {
		TimerSecs: 7,
		MarginBar: 3,
		HeightBar: 30,
		ColorProgressBar: c_lime
	}

	var loadingMessages = [
		"Loading",
		"Loading.",
		"Loading..",
		"Loading..."
	]
		
	var _widthGUI  = display_get_gui_width();
	var _heightGUI = display_get_gui_height();
		
	/// @Timer
	if (_obj_loading.timer == -1) new Utils(_obj_loading).SetTimer(loadingSettings.TimerSecs)
		
	new Utils(_obj_loading).ListenerTimer()
		
	/// @Logic Timer
	if (_obj_loading.timer == 0) {
		
		_obj_loading.timer = -1;
		room_goto(_obj_loading.roomDestiny);
	} 
	else {
		/// @Draw
		if (_obj_loading.timer % (loadingSettings.TimerSecs + 3) == 0)
			_obj_loading.messageIndex = _obj_loading.messageIndex >= array_length(loadingMessages) - 1 ? 0 : _obj_loading.messageIndex + 1;
			
		new DrawGUI().Text(loadingMessages[_obj_loading.messageIndex], 10, (_heightGUI - loadingSettings.HeightBar) - 40, 1, 1, ft_loading);
		new DrawGUI().LoadingBar(loadingSettings.MarginBar, _heightGUI, _widthGUI - loadingSettings.MarginBar, _heightGUI - loadingSettings.HeightBar, true, loadingSettings.ColorProgressBar, _obj_loading.timer, loadingSettings.TimerSecs);
	}
}

/// @function							 SetLoadingBackground(_obj_loading)
/// @description						 Alterna os backgrounds da tela de loading de acordo com o save da room
/// @param {Asset.GMObject} _obj_loading Objeto loading
function SetLoadingBackground (_obj_loading) {
	regionRoom = {
		Cave: [],
		City: [
			spr_loading_city_background_1
		],
		Florest: []
	}
	
	var UUID = undefined;
	
	switch (_obj_loading.loadingRegionBackground) {
		case RegionRoom.Cave:
			UUID = random(array_length(regionRoom.Cave) - 1);
			layer_background_sprite(layer_background_get_id(layer_get_id("Background")), regionRoom.Cave[UUID]);
			break;
		case RegionRoom.City:
			UUID = random(array_length(regionRoom.City) - 1);
			layer_background_sprite(layer_background_get_id(layer_get_id("Background")), regionRoom.City[UUID]);
			break;
		case RegionRoom.Florest:
			UUID = random(array_length(regionRoom.Florest) - 1);
			layer_background_sprite(layer_background_get_id(layer_get_id("Background")), regionRoom.Florest[UUID]);
			break;
	}
}

#endregion