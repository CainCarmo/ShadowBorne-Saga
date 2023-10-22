function Utils (_obj_entity) constructor {
	_obj = _obj_entity;
	
	static ApplyGravity = function () {
		var speedLimitVertical = _obj.speed_vertical < _obj.speed_vertical_max * 2;
		
		if (!_obj.hadGroundCollised && speedLimitVertical)
			_obj.speed_vertical += GRAVITY * _obj.status.Bulk;
	}
	static SetTimer = function (time) {
		if (_obj.timer == -1)
			_obj.timer = room_speed * time;
		
		new Utils(_obj).ListenerTimer();
	}
	static ListenerTimer = function () {
		return _obj.timer > 0 ? _obj.timer-- : _obj.timer;
	}
	static SetTimerProjectile = function (time) {
		if (_obj.timerProjectile == -1)
			_obj.timerProjectile = room_speed * time;
		
		new Utils(_obj).ListenerTimerProjectile();
	}
	static ListenerTimerProjectile = function () {
		return _obj.timerProjectile > 0 ? _obj.timerProjectile-- : _obj.timerProjectile;
	}
	static VerifySaveFileExists = function () {
		return file_exists(FILESAVENAME);
	}
}