if (keyboard_check_released(vk_enter) && state == StructState.Disabled && place_meeting(x, y, obj_player)) {
	obj_obelisk.state = StructState.Activating;
}

new MachineState().Obelisk();