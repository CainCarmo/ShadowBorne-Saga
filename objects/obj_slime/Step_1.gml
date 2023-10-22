if (distance_to_object(obj_player) <= dist_aggro) {
		
	speed_horizontal = -speed_horizontal;
	state = EntityState.Walk;  
	
}