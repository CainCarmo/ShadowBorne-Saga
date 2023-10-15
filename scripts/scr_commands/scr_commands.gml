function ControllerMappingCommands () constructor {
	KeyboardCommands = {
		Dash:   keyboard_check_released(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Dash)),
		Left:   keyboard_check(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Left)),
		Right:  keyboard_check(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Right)),
		Jump:   keyboard_check_pressed(global.SaveData.Settings.Controllers.Commands.Keyboard.Jump), 
		Attack: mouse_check_button(global.SaveData.Settings.Controllers.Commands.Keyboard.Attack),
		
		// @Warrior
		Wield: keyboard_check_released(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Wield)),
		
		// @Wizard
		Teleport: keyboard_check_released(ord(global.SaveData.Settings.Controllers.Commands.Keyboard.Teleport))
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
					case PlayerActions.Teleport:
						return KeyboardCommands.Teleport;
				}
				break;
		}
	}
	static Combat = function () {
		var attackCommand = false;
		
		switch (global.SaveData.Settings.Controllers.Type) {
			case DeviceController.Joystick:
				break;
			case DeviceController.Keyboard:
				attackCommand = KeyboardCommands.Attack;
				break;
		}
		
		return attackCommand;
	}
}