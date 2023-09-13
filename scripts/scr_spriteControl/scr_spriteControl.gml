/// @function		SpriteControl(_obj_entity)
/// @description	Controla o fluxo de sprite do objeto passado
/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
function SpriteControl (_obj_entity) constructor {
	_obj = _obj_entity;
	
	static Resume = function () {
		if (image_index >= image_index - 1)
			sprite_index = sprite_index;
		else
			image_index++;
	}
	
	static Stop	= function () {}
	
	/// @function			 StopIn(amount)
	/// @description		 Para o fluxo da sprite do objeto passado
	/// @param {real} amount Index da sprite
	static StopIn = function (amount) {
		if (_obj.image_index >= _obj.image_number - (amount--)) {
			_obj.image_index = amount;
		}
	}
}