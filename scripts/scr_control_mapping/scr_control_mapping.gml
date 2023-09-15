#region Enums [Devices Supported] & [Player Actions]

enum DeviceController {
	Joystick,
	Keyboard
}
enum PlayerActions {
	Dash,
	Left,
	Right,
	Jump,
	Wield,
	Attack
}

#endregion

#region Functions [Return Device Controller] & [Mapping Controller Commands]

/// @function	 GetDeviceController()
/// @description Retorna o dispositivo controlador escolhido pelo jogador
function GetDeviceController () {
	return DeviceController.Keyboard;
}

/// @function							ControllerMappingCommands(_obj_entity)
/// @description						Mapea os comandos para cada dispositivo suportado
/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
function ControllerMappingCommands (_obj_entity) constructor {
	_obj = _obj_entity;
	
	JoystickCommands = {}
	KeyboardCommands = {
		#region [Default]
		Dash:   keyboard_check_released(ord("S")),
		Left:   keyboard_check(ord("A")),
		Right:  keyboard_check(ord("D")),
		Jump:   keyboard_check_pressed(vk_space),
		Wield:  keyboard_check_released(ord("E")),
		Attack: mouse_check_button(mb_left),
		#endregion
		
		#region [Warrior]
		BreakGuard: keyboard_check_released(ord("G")),
		JumpAttackSpecial: keyboard_check_released(ord("F"))
		#endregion
	}
	
	/// @function							Moves(_action)
	/// @description						Mapeia os comandos de movimento
	/// @param {Enum.PlayerActions} _action Ação do player
	/// @returns {Bool}
	static Moves = function (_action) {
		switch (_obj.deviceController) {
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
	
	/// @function		Attack()
	/// @description	Mapeia os comandos de ataque
	/// @returns {Bool}
	static Attack = function () {
		var attackCommand = false;
		
		switch (_obj.deviceController) {
			case DeviceController.Joystick:
				break;
			case DeviceController.Keyboard:
				switch (_obj.class) {
					case Class.Warrior:
						if (KeyboardCommands.Attack) {
							attackCommand = KeyboardCommands.Attack;
							_obj.warriorTypeAttack = WarriorTypeAttack.Normal;
						}
						else if (KeyboardCommands.BreakGuard) {
							attackCommand = KeyboardCommands.BreakGuard;
							_obj.warriorTypeAttack = WarriorTypeAttack.Break;
						}
						else if (KeyboardCommands.JumpAttackSpecial) {
							attackCommand = KeyboardCommands.JumpAttackSpecial;
							_obj.warriorTypeAttack = WarriorTypeAttack.JumpAttackSpecial;
						}
						
						break;
				}
				break;
		}
		
		return attackCommand;
	}
}

#endregion