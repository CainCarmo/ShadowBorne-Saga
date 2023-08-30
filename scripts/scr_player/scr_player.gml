#region States

function playerIdle(_obj_entity) 
{
	sprite_index = stateSprite(_obj_entity);
	
	if (_obj_entity.left != _obj_entity.right)
		_obj_entity = alterPlayer(
			_obj_entity.life_atual, 
			_obj_entity.speed_horizontal, 
			_obj_entity.speed_vertical, 
			_obj_entity.bulk, 
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			State.Run
		);
	else if (_obj_entity.jump) 
		_obj_entity = alterPlayer(
			_obj_entity.life_atual, 
			_obj_entity.speed_horizontal, 
			(-_obj_entity.speed_vertical_max), 
			_obj_entity.bulk, 
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			State.Jump,
			true
		);
	else if (_obj_entity.attack) 
		_obj_entity = alterPlayer(
			_obj_entity.life_atual, 
			_obj_entity.speed_horizontal, 
			_obj_entity.speed_vertical, 
			_obj_entity.bulk, 
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			State.Attack,
			true
		);
}

function playerRun(_obj_entity)  
{
	sprite_index = stateSprite(_obj_entity);
	
	if (abs(_obj_entity.speed_horizontal) < .1) 
		_obj_entity = alterPlayer(
			_obj_entity.life_atual, 
			0, 
			_obj_entity.speed_vertical, 
			_obj_entity.bulk, 
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			State.Idle
		);
	else if (_obj_entity.jump) 
		_obj_entity = alterPlayer(
			_obj_entity.life_atual,
			_obj_entity.speed_horizontal, 
			(-_obj_entity.speed_vertical_max),
			_obj_entity.bulk, 
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			State.Jump
		);
	else if (_obj_entity.attack) 
		_obj_entity = alterPlayer(
			_obj_entity.life_atual,
			_obj_entity.speed_horizontal, 
			_obj_entity.speed_vertical, 
			_obj_entity.bulk, 
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			State.Attack,
			true
		);
}
function playerJump(_obj_entity) 
{
	sprite_index = stateSprite(_obj_entity);
	
	if (image_index >= image_number) image_index = image_number - 1;
	
	if (_obj_entity.groundCollided)
		_obj_entity = alterPlayer(
			_obj_entity.life_atual, 
			0,
			0,
			_obj_entity.bulk, 
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			State.Idle
		);
	else if (_obj_entity.attack && !_obj_entity.groundCollided)
		_obj_entity = alterPlayer(
			_obj_entity.life_atual, 
			_obj_entity.speed_horizontal, 
			_obj_entity.speed_vertical, 
			_obj_entity.bulk, 
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			State.Attack
		);
}

function playerAttack(_obj_entity) 
{
	_obj_entity = alterPlayer(
		_obj_entity.life_atual, 
		0,
		_obj_entity.speed_vertical, 
		_obj_entity.bulk, 
		_obj_entity.damage, 
		_obj_entity.comboState, 
		_obj_entity.comboIndex, 
		_obj_entity.state
	);
	
	if (_obj_entity.groundCollided) 
	{
		var isComboIndexValid = (_obj_entity.comboIndex < 2 || _obj_entity.comboIndex == undefined);
		
		if (_obj_entity.attack && isComboIndexValid && image_index >= image_number - 1) 
			_obj_entity = alterPlayer(
				_obj_entity.life_atual, 
				_obj_entity.speed_horizontal, 
				_obj_entity.speed_vertical, 
				_obj_entity.bulk, 
				_obj_entity.damage, 
				true,
				_obj_entity.comboIndex == undefined ? Combo.First : Combo.Second,
				_obj_entity.state,
				true
			);
		if (_obj_entity.comboIndex == Combo.Second && image_index >= image_number - 2) 
			_obj_entity = alterPlayer(
				_obj_entity.life_atual, 
				_obj_entity.speed_horizontal, 
				_obj_entity.speed_vertical, 
				_obj_entity.bulk, 
				_obj_entity.damage, 
				false,
				undefined,
				_obj_entity.state,
				true
			);
		if (!_obj_entity.attack) 
			_obj_entity = alterPlayer(
				_obj_entity.life_atual, 
				_obj_entity.speed_horizontal, 
				_obj_entity.speed_vertical, 
				1,
				_obj_entity.damage, 
				false,
				undefined,
				State.Idle
			);
	}
	else
		_obj_entity = alterPlayer(
			_obj_entity.life_atual, 
			0,
			_obj_entity.speed_vertical, 
			5,
			_obj_entity.damage, 
			_obj_entity.comboState, 
			_obj_entity.comboIndex, 
			_obj_entity.state,
			true
		);
		
	sprite_index = stateSprite(_obj_entity);
}

function playerHit(_obj_entity)  
{
	sprite_index = stateSprite(_obj_entity);
}
function playerDie(_obj_entity)  
{
	sprite_index = stateSprite(_obj_entity);
}
#endregion

#region Interfaces
function playerFly(_obj_entity) {}
function playerBerseker(_obj_entity) {}
function playerCutscene(_obj_entity) {}
#endregion

#region Combat
#endregion

#region PowerUps
#endregion

#region Utils Player
function alterPlayer(life_atual, speed_horizontal, speed_vertical, bulk, damage, comboState, comboIndex, state, clearImageIndex = false) {
	var _obj_entity = variable_clone(obj_player, obj_player.depth);
	
	#region Status
	_obj_entity.life_atual = life_atual;

	_obj_entity.speed_horizontal = speed_horizontal;
	_obj_entity.speed_vertical   = speed_vertical

	_obj_entity.bulk = bulk;
	#endregion

	#region Combat
	_obj_entity.damage = damage;
	
	_obj_entity.comboState = comboState;
	_obj_entity.comboIndex = comboIndex;
	#endregion

	#region Information
	_obj_entity.state = state;
	#endregion
	
	if (clearImageIndex) image_index = 0;
	
	return _obj_entity;
}
#endregion