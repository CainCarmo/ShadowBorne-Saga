if (keyboard_check_released(vk_enter) && state == StructState.Disabled) {
	obj_obelisk.state = StructState.Activating;
}

new MachineState().Obelisk();