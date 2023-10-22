function ControllerMappingCommands () constructor {
	KeyboardCommands = {
		Left:   keyboard_check(ord(global.SaveData.Settings.Commands.Keyboard.Left)),
		Right:  keyboard_check(ord(global.SaveData.Settings.Commands.Keyboard.Right)),
		Jump:   keyboard_check_pressed(global.SaveData.Settings.Commands.Keyboard.Jump),
		Attack: mouse_check_button_released(global.SaveData.Settings.Commands.Keyboard.Attack),
		Dash:   keyboard_check_released(ord(global.SaveData.Settings.Commands.Keyboard.Dash)),
		// @Warrior
		Wield: keyboard_check_released(ord(global.SaveData.Settings.Commands.Keyboard.Wield))
	}
	
	static Moves = function (_action) {
		switch (_action) {
			case PlayerActions.Left:
				return KeyboardCommands.Left;
			case PlayerActions.Right:
				return KeyboardCommands.Right;
			case PlayerActions.Jump:
				return KeyboardCommands.Jump;
			case PlayerActions.Dash:
				return KeyboardCommands.Dash;
			case PlayerActions.Wield:
				return KeyboardCommands.Wield;
		}
	}
	static Combat = function () {
		return KeyboardCommands.Attack;
	}
}