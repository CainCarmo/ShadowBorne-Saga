event_inherited();

// @Verify Death
if (status.Life.Atual <= 0) state = EntityState.Die;

if (state == EntityState.Die) return;

if (hadGroundCollised) speed_vertical = 0;

// @Attack and Chase
if (distance_to_object(obj_player) <= dist_aggro && state != EntityState.Hit) {
	if (distance_to_object(obj_player) <= 35 && name != Minion.Slime) {
		state = EntityState.Attack;
		
		speed_horizontal = 0;
	}
	else if (distance_to_object(obj_player) > 1) {
		state = EntityState.Walk;
		
		speed_horizontal = lengthdir_x(2, point_direction(x, y, obj_player.x, y));
	}
	else
		speed_horizontal = 0;
}

if (instance_exists(obj_player) && place_meeting(x, y, obj_player) && obj_player.timerHit == 0 && (obj_player.state != EntityState.Dash || obj_player.state != EntityState.Attack)) {
	var damageOnPlayer = self.damage;
	
	if ((obj_player.status.Life.Atual - damageOnPlayer) < 0) {
		obj_player.state = EntityState.Die;
		
		obj_player.status.Life.Atual = 0;
	}
	else {
		obj_player.state = EntityState.Hit;
		
		obj_player.image_alpha = .4;
		obj_player.image_index =  0;
		obj_player.status.Life.Atual -= damageOnPlayer;
	}
		
	obj_player.timerHit = -1;
}