event_inherited();

if (status.Life.Atual == 0 || status.Life.Atual < 0 && state != EntityState.Hit)
	state = EntityState.Die;

if (self.state == EntityState.Die) return;

if (hadGroundCollised) speed_vertical = 0;

if (distance_to_object(obj_player) <= dist_aggro && state != EntityState.Hit) {	
	
	if (distance_to_object(obj_player) <= 35 && name != Minion.Slime) {
		new Utils(self).SetTimer(.4);
		
		if (timer == 0 && new ControllerSprite(self).ListenerSpriteIndex(1)) {
			speed_horizontal = 0; 
			
			state = EntityState.Attack;
			
			timer = -1;
		}
	}
	else if (distance_to_object(obj_player) >= 5 && state != EntityState.Attack) {
		var _dist = point_direction(x, y, obj_player.x, y);
		
		speed_horizontal = lengthdir_x(2, _dist);
			
		if (state != EntityState.Walk) 
			state = EntityState.Walk;
	}
	
}

// @Damage
if (instance_exists(obj_player) && place_meeting(x, y, obj_player) && obj_player.timer == -1 && obj_player.state != EntityState.Dash && obj_player.state != EntityState.Attack) {
	var damage = self.damage;
		
	if ((obj_player.status.Life.Atual - damage) < 0) {
		obj_player.status.Life.Atual -= (obj_player.status.Life.Atual - damage) + damage;
			
		obj_player.state = EntityState.Die;
	}
	else {
		obj_player.image_alpha = .4;
		obj_player.status.Life.Atual -= damage; 
		
		obj_player.state = EntityState.Hit;
		
		new Utils(obj_player).SetTimer(2);
	}
}