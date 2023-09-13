/// @function		PlayerStates()
/// @description	Atribui as características dos estados do player
function PlayerStates () constructor {
	static Idle = function (_obj_entity) {
		if (_obj_entity.left != _obj_entity.right)
			_obj_entity = AlterPlayerDefault(,,, State.Walk);
		else if (_obj_entity.jump && _obj_entity.hadGroundCollised)
			_obj_entity = AlterPlayerDefault(, -_obj_entity.speed_vertical_max,, State.Jump, true);
		else if (_obj_entity.attack)
			_obj_entity = AlterPlayerDefault(,,, State.Attack, true);
		
		switch (_obj_entity.class) {
			case Class.Warrior:
				new WarriorStates().Idle(_obj_entity);
				break;
		}
	}
	static Die = function (_obj_entity) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				
				break;
		}
	}
	static Fly = function (_obj_entity) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				break;
		}
	}
	static Hit = function (_obj_entity) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				
				break;
		}
	}
	static Run = function (_obj_entity) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				
				break;
		}
	}
	static Dash = function (_obj_entity) {
		AlterPlayerDefault(_obj_entity.speed_horizontal + (_obj_entity.dashDistance * _obj_entity.scale_x));
		
		switch (_obj_entity.class) {
			case Class.Warrior:
				new WarriorStates().Dash(_obj_entity);
				break;
		}
		
		if (new Utils(_obj_entity).ListenerSpriteIndex(1))
			_obj_entity = AlterPlayerDefault(0, 0,, State.Idle, true);
	}
	static Jump = function (_obj_entity) {
		if (_obj_entity.hadGroundCollised)
			_obj_entity = AlterPlayerDefault(0, 0,, State.Idle);
		else if (_obj_entity.attack)
			_obj_entity = AlterPlayerDefault(,,, State.Attack, true);
		
		switch (_obj_entity.class) {
			case Class.Warrior:
				new WarriorStates().Jump(_obj_entity);
				break;
		}
	}
	static Walk = function (_obj_entity) {
		if (abs(_obj_entity.speed_horizontal) < .1)
			_obj_entity = AlterPlayerDefault(0, 0,, State.Idle);
		else if (_obj_entity.jump)
			_obj_entity = AlterPlayerDefault(, -_obj_entity.speed_vertical_max,, State.Jump);
		else if (_obj_entity.attack)
			_obj_entity = AlterPlayerDefault(,,, State.Attack, true);

		switch (_obj_entity.class) {
			case Class.Warrior:
				new WarriorStates().Walk(_obj_entity);
				break;
		}
	}
	static Break = function (_obj_entity) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				
				break;
		}
	}
	static Climb = function (_obj_entity) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				
				break;
		}
	}
	static Wield = function (_obj_entity) {
		_obj_entity = AlterPlayerDefault(0, 0);
		
		//switch (_obj_entity.class) {
		//	case Class.Warrior:
		//		new WarriorStates().Wield(_obj_entity); 
		//		break;
		//}
		
		if (new Utils(_obj_entity).ListenerSpriteIndex(1))
			_obj_entity = AlterPlayerDefault(0, 0,, State.Idle, true);
	}
	static Attack = function (_obj_entity) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				new WarriorStates().Attack(_obj_entity);
				break;
		}
	}
	static Cutscene = function (_obj_entity) {
		switch (_obj_entity.class) {
			case Class.Warrior:
				
				break;
		}
	}
}

#region Player Funtions [Utils]

/// @function						AlterPlayerDefault(sx, sy, bulk, state, clearImageIndex)
/// @description					Altera as propriedades padrões do objeto player 
/// @param {Real} speed_horizontal	Velocidade Horizontal (Eixo x)
/// @param {Real} speed_vertical	Velocidade Vertical   (Eixo y)
/// @param {Real} bulk				Massa
/// @param {Real} state				Estado
/// @param {Bool} clearImageIndex	Reseta a image index do objeto
/// @returns {Asset.GMObject}
function AlterPlayerDefault (sx = undefined, sy = undefined, bulk = undefined, state = undefined, clearImageIndex = false) {
	_warrior = variable_clone(obj_player);
	
	_warrior.speed_horizontal = sx	  == undefined ? _warrior.speed_horizontal : sx;
	_warrior.speed_vertical   = sy	  == undefined ? _warrior.speed_vertical   : sy;
	_warrior.bulk			  = bulk  == undefined ? _warrior.bulk			   : bulk;
	_warrior.state			  = state == undefined ? _warrior.state			   : state;
	
	if (clearImageIndex) _warrior.image_index = 0;
	
	return _warrior;
}

#endregion