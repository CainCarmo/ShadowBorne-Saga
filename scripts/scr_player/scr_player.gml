#region States

function playerIdle(_obj_entity){
	sprite_index = stateSprite(_obj_entity);
	
	if (_obj_entity.left != _obj_entity.right)
		_obj_entity.state = State.Run;
	else if (_obj_entity.jump) {
		_obj_entity.state = State.Jump;
		_obj_entity.speed_vertical = (-_obj_entity.speed_vertical_max);
		
		image_index = 0;
	}
	else if (_obj_entity.attack) {
		image_index = 0;
		
		_obj_entity.state = State.Attack;
	}
}
function playerRun(_obj_entity)  {
	sprite_index = stateSprite(_obj_entity);
	
	if (abs(_obj_entity.speed_horizontal) < .1) {
		_obj_entity.state = State.Idle;
		_obj_entity.speed_horizontal = 0; 
	}
	else if (_obj_entity.jump) {
		_obj_entity.state = State.Jump;
		_obj_entity.speed_vertical = -_obj_entity.speed_vertical_max;
	}
	else if (_obj_entity.attack) {
		image_index = 0;
		
		_obj_entity.state = State.Attack;
	}
}
function playerJump(_obj_entity) {
	sprite_index = stateSprite(_obj_entity);
	
	if (image_index >= image_number) image_index = image_number - 1;
	
	if (groundCollided) {
		_obj_entity.state = State.Idle;
		_obj_entity.speed_vertical   = 0;
		_obj_entity.speed_horizontal = 0;
	}
}
function playerAttack(_obj_entity) {
	_obj_entity.speed_horizontal = 0;
	
	// Verifica se está no estado de combo
	var isComboState = function (_obj_entity) {
		
	}
	
	if (_obj_entity.attack) {
		sprite_index = stateSprite(_obj_entity);
	}
	
	if (image_index > image_number - 1)
		_obj_entity.state = State.Idle
}
function playerHit(_obj_entity)  {
	sprite_index = stateSprite(_obj_entity);
}
function playerDie(_obj_entity)  {
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