#region Enums [Warrior Combat]

enum WarriorComboIndex {
	None = -1,
	First = 0,
	Second = 1
}

enum WarriorStyleAttack {
	Hand,
	Sword
}

enum WarriorTypeAttack {
	Break,
	Normal,
	JumpAttackSpecial
}

#endregion

#region Warrior Functions [Commands]

function WarriorCommands () constructor {
	static Dash = function (_obj_entity) {
		new AlterWarrior(AlterPlayerDefault(,,, State.Dash, true));
	}
	static Wield = function (_obj_entity) {
		new AlterWarrior(AlterPlayerDefault(,,, State.Wield, true)).Move(_obj_entity.warriorStyleAttack == WarriorStyleAttack.Hand ? WarriorStyleAttack.Sword : WarriorStyleAttack.Hand);
	}
	static BreakGuard = function (_obj_entity) {
		
	}
	static JumpAttackSpecial = function (_obj_entity) {
		//if (new Utils(_obj_entity).
	}
}

#endregion

#region Warrior [States]

function WarriorStates () constructor {
	static Idle = function (_obj_entity) {
		if (_obj_entity.dash)
			new WarriorCommands().Dash(_obj_entity);
		else if (_obj_entity.wield)
			new WarriorCommands().Wield(_obj_entity);
	}
	static Die = function (_obj_entity) {
		
	}
	static Hit = function (_obj_entity) {
		
	}
	static Run = function (_obj_entity) {
		
	}
	static Dash = function (_obj_entity) {
		
	}
	static Jump = function (_obj_entity) {
		if (_obj_entity.hadGroundCollised) _obj_entity.jumpAttack = false;
	}
	static Walk = function (_obj_entity) {
		if (_obj_entity.dash)
			new WarriorCommands().Dash(_obj_entity);
		else if (_obj_entity.wield)
			new WarriorCommands().Wield(_obj_entity);
	}
	static Break = function (_obj_entity) {
		
	}
	static Climb = function (_obj_entity) {
		
	}
	static Wield = function (_obj_entity) {
		new AlterWarrior(AlterPlayerDefault(0, 0,, State.Wield, true)).Move(_obj_entity.warriorStyleAttack == WarriorStyleAttack.Hand ? WarriorStyleAttack.Sword : WarriorStyleAttack.Hand);
	}
	static Attack = function (_obj_entity) {
		switch (_obj_entity.warriorTypeAttack) {
			case WarriorTypeAttack.Break:
				if (_obj_entity.hadGroundCollised) {}
				break;
			case WarriorTypeAttack.Normal:
				if (!_obj_entity.hadGroundCollised)
					new WarriorAttack(_obj_entity).Air();
				else
					new WarriorAttack(_obj_entity).Ground();
				break;
			case WarriorTypeAttack.JumpAttackSpecial:
				if (!_obj_entity.hadGroundCollised && _obj_entity.warriorStyleAttack == WarriorStyleAttack.Sword) {
					new SpriteControl(_obj_entity).StopIn(3);
				}
				else
					new AlterWarrior(AlterPlayerDefault(,,, State.Idle));
				
				break;
		}
	}
	static Cutscene = function (_obj_entity) {
		
	}
}

#endregion

#region Warrior [Attack]

function WarriorAttack (_obj_entity) constructor {
	_obj = _obj_entity;
	
	static Air = function () {
		if (new Utils(_obj).ListenerSpriteIndex(1) || _obj.jumpAttack) 
			new AlterWarrior(AlterPlayerDefault(,,, State.Jump, false)).Attack(,, true);
	}
	static Ground = function () {
		var isComboIndexValid = _obj.comboIndex <= WarriorComboIndex.Second;
		var isFrameComboValid = new Utils(_obj).ListenerSpriteIndex(2);
		
		if (_obj.attack && isFrameComboValid)
			new AlterWarrior(AlterPlayerDefault(0,0)).Attack(true, WarriorComboIndex.First);
		else if (new Utils(_obj).ListenerSpriteIndex(1))
			new AlterWarrior(AlterPlayerDefault(,,, State.Idle, true)).Attack(false, WarriorComboIndex.None);
		
		if (isComboIndexValid && new Utils(_obj).ListenerSpriteIndex(1)) {
			switch (_obj.comboIndex) {
				case WarriorComboIndex.First:
					new AlterWarrior(AlterPlayerDefault(,,,, true)).Attack(, WarriorComboIndex.Second);
					break;
				case WarriorComboIndex.Second:
					new AlterWarrior(AlterPlayerDefault(,,,, true)).Attack(false, WarriorComboIndex.None);
					break;
			}
		}
	}
}

#endregion

#region Warrior Functions [Utils]

/// @function							AlterWarrior(_obj_entity)
/// @description						Altera as propriedades do player (Classe Guerreiro)
/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
function AlterWarrior (_obj_entity) constructor {
	_obj = _obj_entity;
	
	/// @function											Move(warriorStyleAttack)
	/// @description										Altera as propriedades do player (Classe Guerreiro)
	/// @param {Enum.WarriorStyleAttack} warriorStyleAttack 
	static Move = function (wsa = undefined) {
		_obj.warriorStyleAttack = wsa == undefined ? _obj.warriorStyleAttack : wsa;
	}
	
	/// @function											Attack(comboState, comboIndex, warriorTypeAttack)
	/// @description										Altera as propriedades do player (Classe Guerreiro)
	/// @param {Bool}					comboState			
	/// @param {Enum.WarriorComboIndex}	comboIndex			
	/// @param {Bool}					jumpAttack
	/// @param {Enum.WarriorTypeAttack} warriorTypeAttack	
	static Attack = function (cs = undefined, ci = undefined, ja = undefined, wta = undefined) {
		_obj.comboState = cs == undefined ? _obj.comboState : cs;
		_obj.comboIndex = ci == undefined ? _obj.comboIndex : ci;
		_obj.jumpAttack = ja == undefined ? _obj.jumpAttack : ja;
		
		_obj.warriorTypeAttack = wta == undefined ? _obj.warriorTypeAttack : wta;
	}
	
	static Damage = function () {}
}

#endregion