function ControllerSprite (_obj_entity) constructor {
	_obj = _obj_entity;
	
	static StopIn = function (index) {
		if (_obj.image_index >= _obj.image_number - index)
			_obj.image_index = index;
	}
	
	static AssignSpriteToObject = function () {
		switch (_obj.identity) {
			case Identity.Player:
				_obj.sprite_index = new MachineSprite().Player();
				break;
			case Identity.NPC:
				_obj.sprite_index = new MachineSprite().NPC();
				break;
			case Identity.Boss:
				_obj.sprite_index = new MachineSprite().Boss();
				break;
			case Identity.SubBoss:
				_obj.sprite_index = new MachineSprite().SubBoss();
				break;
			case Identity.Minion:
				_obj.sprite_index = new MachineSprite().Minion();
				break;
			case Identity.Obelisk:
				_obj.sprite_index = new MachineSprite().Obelisk();
				break;
			case Identity.Totem:
				_obj.sprite_index = new MachineSprite().Totem();
				break;
			case Identity.Chest:
				_obj.sprite_index = new MachineSprite().Chest();
				break;
		}	
	}
	
	static ListenerSpriteIndex = function (index) {
		return _obj.image_index >= _obj.image_number - index;
	}
}