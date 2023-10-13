function ControllerMappingCommands () constructor {
	KeyboardCommands = {
		Dash:   keyboard_check_released(global.SaveData.Settings.Controllers.Commands.Keyboard.Dash),
		Left:   keyboard_check(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Left)),
		Right:  keyboard_check(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Right)),
		Jump:   keyboard_check_pressed(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Jump)), 
		Attack: mouse_check_button(global.SaveData.Settings.Controllers.Commands.Keyboard.Attack),
		
		// @Warrior
		Wield: keyboard_check_released(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Wield)),
		
		// @Wizard
	}
	
	static Moves = function (_action) {
		switch (global.SaveData.Settings.Controllers.Type) {
			case DeviceController.Joystick:
				break;
			case DeviceController.Keyboard:
				switch (_action) {
					case PlayerActions.Dash:
						return KeyboardCommands.Dash;
					case PlayerActions.Left:
						return KeyboardCommands.Left;
					case PlayerActions.Right:
						return KeyboardCommands.Right;
					case PlayerActions.Jump:
						return KeyboardCommands.Jump;
					case PlayerActions.Wield:
						return KeyboardCommands.Wield;
				}
				break;
		}
	}
	static Combat = function () {
		var attackCommands = false;
		
		switch (global.SaveData.Settings.Controllers.Type) {
			case DeviceController.Joystick:
				break;
			case DeviceController.Keyboard:
				switch (obj_player.class) {
					case PlayerClass.Wizard:
						break;
					case PlayerClass.Warrior:
						if (KeyboardCommands.Attack) {
							
						}
						break;
				}
				break;
		}
	}
}