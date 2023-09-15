#region Enums [Warrior Combat]

enum WarriorComboIndex {
	None   = -1,
	First  =  0,
	Second =  1
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

/// @function	 WarriorCommands()
/// @description Implementa os comandos únicos da classe Warrior (Guerreiro)
function WarriorCommands () constructor {
	
	/// @function							Dash(_obj_entity)
	/// @description						Implementa o comando Dash na classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Dash = function (_obj_entity) {
		_obj_entity = AlterPlayerDefault(,,, State.Dash, true);
	}
	
	/// @function							Wield(_obj_entity)
	/// @description						Implementa o comando Wield na classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Wield = function (_obj_entity) {
		_obj_entity = new AlterWarrior(AlterPlayerDefault(0,0,, State.Wield, true)).Move(_obj_entity.warriorStyleAttack == WarriorStyleAttack.Hand ? WarriorStyleAttack.Sword : WarriorStyleAttack.Hand);
	}
	
	/// @function							BreakGuard(_obj_entity)
	/// @description						Implementa o comando BreakGuard na classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static BreakGuard = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
	}
	
	/// @function							JumpAttackSpecial(_obj_entity)
	/// @description						Implementa o comando JumpAttackSpecial na classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static JumpAttackSpecial = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
		
		new SpriteControl(_obj_entity).StopIn(3);
	} 
	
}

#endregion

#region Warrior [States]

/// @function	 WarriorStates()
/// @description Atribui as características dos estados para a classe Warrior (Guerreiro)
function WarriorStates (): PlayerStates() constructor {
	
	/// @function							Idle(_obj_entity)
	/// @description						Implementa o estado Idle (Parado) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Idle = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
		
		if (_obj_entity.dash)
			new WarriorCommands().Dash(_obj_entity);
		else if (_obj_entity.wield)
			new WarriorCommands().Wield(_obj_entity);
	}
	
	/// @function							Die(_obj_entity)
	/// @description						Implementa o estado Die (Morto) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Die = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
	}
	
	/// @function							Hit(_obj_entity)
	/// @description						Implementa o estado Hit (Dano) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Hit = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
	}
	
	/// @function							Run(_obj_entity)
	/// @description						Implementa o estado Run (Correndo) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Run = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
	}
	
	/// @function							Dash(_obj_entity)
	/// @description						Implementa o estado Dash para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Dash = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
		
		_obj_entity = AlterPlayerDefault(_obj_entity.speed_horizontal + (_obj_entity.dashDistance * _obj_entity.scale_x));
		
		if (new Utils(_obj_entity).ListenerSpriteIndex(1)) _obj_entity = AlterPlayerDefault(0, 0,, State.Idle, true);
	}
	
	/// @function							Jump(_obj_entity)
	/// @description						Implementa o estado Jump (Pulando) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Jump = function (_obj_entity) {
		if (_obj_entity.hadGroundCollised)
			_obj_entity = new AlterWarrior(AlterPlayerDefault()).Attack(,, false);
		
		new Utils(_obj_entity).AssignSpriteToObject();
	}
	
	/// @function							Walk(_obj_entity)
	/// @description						Implementa o estado Walk (Andando) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Walk = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
		
		if (_obj_entity.dash)
			new WarriorCommands().Dash(_obj_entity);
		else if (_obj_entity.wield)
			new WarriorCommands().Wield(_obj_entity);
	}
	
	/// @function							Climb(_obj_entity)
	/// @description						Implementa o estado Climb (Escala) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Climb = function (_obj_entity) {
		new Utils(_obj_entity).AssignSpriteToObject();
	}
	
	/// @function							Wield(_obj_entity)
	/// @description						Implementa o estado Wield (Empunhar) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Wield = function (_obj_entity) {
		_obj_entity = AlterPlayerDefault(0,0);
		
		new Utils(_obj_entity).AssignSpriteToObject();
		
		if (new Utils(_obj_entity).ListenerSpriteIndex(1))
			_obj_entity = AlterPlayerDefault(0, 0,, State.Idle, true);
	}
	
	/// @function							Attack(_obj_entity)
	/// @description						Implementa o estado Attack (Ataque) para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Attack = function (_obj_entity) {
		switch (_obj_entity.warriorTypeAttack) {
			case WarriorTypeAttack.Break:
				if (_obj_entity.hadGroundCollised)
					new WarriorCommands().BreakGuard(_obj_entity);
				break;
			case WarriorTypeAttack.Normal:
				if (!_obj_entity.hadGroundCollised)
					new WarriorAttack(_obj_entity).Air();
				else
					new WarriorAttack(_obj_entity).Ground();
				break;
			case WarriorTypeAttack.JumpAttackSpecial:
				if (!_obj_entity.hadGroundCollised && _obj_entity.warriorStyleAttack == WarriorStyleAttack.Sword) 
					new WarriorCommands().JumpAttackSpecial(_obj_entity);
				else
					_obj_entity = AlterPlayerDefault(,,, State.Idle);
				
				break;
		}
	}
	
	/// @function							Cutscene(_obj_entity)
	/// @description						Implementa o estado Cutscene para a classe Warrior (Guerreiro)
	/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
	static Cutscene = function (_obj_entity) {}
}

#endregion

#region Warrior [Attack]

/// @function	 WarriorAttack()
/// @description Implementa as mecânicas de ataque para a classe Warrior (Guerreiro)
function WarriorAttack (_obj_entity) constructor {
	_obj = _obj_entity;
	
	/// @function	 Air()
	/// @description Implementa a lógica dos ataques no ar para a classe Warrior (Guerreiro)
	static Air = function () {
		if (!_obj.jumpAttack) {
			new Utils(_obj).AssignSpriteToObject();
			_obj = new AlterWarrior(AlterPlayerDefault()).Attack(,, true);
		}
		
		if (new Utils(_obj).ListenerSpriteIndex(1)) 
			_obj = new AlterWarrior(AlterPlayerDefault(,,, State.Jump, false));
	}
	
	/// @function	 Ground()
	/// @description Implementa a lógica dos ataques no chão para a classe Warrior (Guerreiro)
	static Ground = function () {
		_obj = AlterPlayerDefault(0,0);
		
		new Utils(_obj).AssignSpriteToObject();
		
		var isComboIndexValid = _obj.comboIndex <= WarriorComboIndex.Second;
		var isFrameComboValid = new Utils(_obj).ListenerSpriteIndex(2);
		
		if (_obj.attack && isFrameComboValid)
			_obj = new AlterWarrior(AlterPlayerDefault(0,0)).Attack(true, WarriorComboIndex.First);
		else if (new Utils(_obj).ListenerSpriteIndex(1))
			_obj = new AlterWarrior(AlterPlayerDefault(,,, State.Idle, true)).Attack(false, WarriorComboIndex.None);
		
		if (isComboIndexValid && new Utils(_obj).ListenerSpriteIndex(1)) {
			switch (_obj.comboIndex) {
				case WarriorComboIndex.First:
					_obj = new AlterWarrior(AlterPlayerDefault(,,,, true)).Attack(, WarriorComboIndex.Second);
					break;
				case WarriorComboIndex.Second:
					_obj = new AlterWarrior(AlterPlayerDefault(,,,, true)).Attack(false, WarriorComboIndex.None);
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
		
		return _obj;
	}
	
	/// @function											Attack(comboState, comboIndex, jumpAttack, warriorTypeAttack)
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
		
		return _obj;
	}
}

#endregion