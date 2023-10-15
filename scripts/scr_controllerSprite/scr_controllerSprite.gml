function ControllerSprite (_obj_entity) constructor {
	_obj = _obj_entity;
	
	static StopIn = function (index) {
		if (_obj.image_index >= _obj.image_number - index)
			_obj.image_index = index;
	}
	
	static AssignSpriteToObject = function () {
		switch (_obj.type) {
			case EntityType.Player:
				_obj.sprite_index = new MachineSprite().Player();
				break;
			case EntityType.NPC:
				_obj.sprite_index = new MachineSprite().NPC();
				break;
			case EntityType.Boss:
				_obj.sprite_index = new MachineSprite().Boss();
				break;
			case EntityType.SubBoss:
				_obj.sprite_index = new MachineSprite().SubBoss();
				break;
			case EntityType.Minion:
				_obj.sprite_index = new MachineSprite().Minion();
				break;
			case EntityType.Obelisk:
				_obj.sprite_index = new MachineSprite().Obelisk();
				break;
			case EntityType.Totem:
				_obj.sprite_index = new MachineSprite().Totem();
				break;
			case EntityType.Chest:
				_obj.sprite_index = new MachineSprite().Chest();
				break;
		}	
	}
	
	static ListenerSpriteIndex = function (index) {
		return _obj.image_index >= _obj.image_number - index;
	}
}