function RoomState () constructor {
	static Normal = function () {
		if (keyboard_check_released(vk_escape))
			obj_room.state = EnvironmentState.Paused;
	}
	static Paused = function () {
		if (keyboard_check_released(vk_escape))
			obj_room.state = EnvironmentState.Normal;
	}
	static Loading = function () {
		if (obj_loading.loadingCompleted)
			obj_room.state = EnvironmentState.Normal;
	}
	static Cutscene = function () {
		
	}
}