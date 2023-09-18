/// @function							Utils(_obj_entity)
/// @description						Funções utéis no geral
/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
function Utils (_obj_entity) constructor {
	_obj = _obj_entity;
	
	/// @function	 ApplyGravity()
	/// @description Aplica gravidade no objeto
	static ApplyGravity = function () {
		var speedVerticalLimit = _obj.speed_vertical < _obj.speed_vertical_max * 2;
	
		if (!_obj.hadGroundCollised && speedVerticalLimit)
			_obj.speed_vertical += GRAVITY * _obj.bulk;
	}

	/// @function			   ListenerSpriteIndex(_amount)
	/// @description		   Verifica se o index da sprite é igual ou maior que o index passado 
	/// @param	 {Real} _amout Index da sprite a ser verificado
	/// @returns {Bool}
	static ListenerSpriteIndex = function (_amount) {
		return _obj.image_index >= _obj.image_number - _amount;
	}
	
	/// @function	 AssignSpriteToObject()
	/// @description Aplica a sprite no objeto passado
	static AssignSpriteToObject = function () {
		_obj.sprite_index = SpriteMachine(_obj);
	}
	
	static SetTimer = function (time) {
		_obj.timer = room_speed * time;
	}
	
	static CountTimer = function () {
		return _obj.timer > 0 ? _obj.timer -- : _obj.timer;
	}
}