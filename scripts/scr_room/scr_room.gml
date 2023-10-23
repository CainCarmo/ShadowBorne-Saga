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
		if (obj_loading.loadingCompleted) {
			if (room == rm_arena)
				obj_room.state = EnvironmentState.Cutscene;
			else
				obj_room.state = EnvironmentState.Normal;
		}
	}
	static Cutscene = function () {
		new Utils(obj_room).SetTimer(2);
		
		if (instance_exists(obj_death)) {
			if (room == rm_arena && obj_room.timer > 0)
				obj_camera.objectTarget = obj_death;
			else {
				obj_camera.objectTarget = obj_player;
				
				obj_room.timer = -1;
				
				obj_room.state = EnvironmentState.Normal;
			}
		}
	}
}