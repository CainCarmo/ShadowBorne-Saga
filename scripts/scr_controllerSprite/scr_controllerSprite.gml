function ControllerSprite (_obj_entity) constructor {
	_obj = _obj_entity;
	
	static StopIn = function (index) {
		if (_obj.image_index >= _obj.image_number - index)
			_obj.image_index =  _obj.image_number - index; 
	}
	
	static AssignSpriteToObject = function () {
		switch (_obj.identity) {
			case Identity.Player:
				var spritesPlayer = new MachineSprite().Player();
				
				if (_obj.state == EntityState.Attack) {
					_obj.sprite_index = spritesPlayer[0];
					if (instance_exists(obj_player_hitbox)) obj_player_hitbox.sprite_index = spritesPlayer[1];
				}
				else {
					_obj.sprite_index = spritesPlayer;
					//_obj.mask_index   = spritesPlayer;
				}
				
				break;
			case Identity.NPC:
				_obj.sprite_index = new MachineSprite().NPC(_obj);
				break;
			case Identity.Boss:
				var spritesBoss = new MachineSprite().Boss(_obj);
				
				_obj.sprite_index = spritesBoss[0];
				_obj.mask_index   = spritesBoss[1];
				break;
			case Identity.Minion:
				var spritesMinion = new MachineSprite().Minion(_obj);
				
				_obj.sprite_index = spritesMinion[0];
				_obj.mask_index   = spritesMinion[1];
				break;
			case Identity.Obelisk:
				_obj.sprite_index = new MachineSprite().Obelisk();
				break;
			case Identity.Totem:
				_obj.sprite_index = new MachineSprite().Totem();
				break;
		}
	}
	
	static ListenerSpriteIndex = function (index) {
		return _obj.image_index >= _obj.image_number - index;
	}
}