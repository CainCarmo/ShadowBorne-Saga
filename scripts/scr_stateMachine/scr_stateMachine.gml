function stateMachine(_obj_person, right, left, jump, ground) {
	switch(_obj_person.state) {
		case "idle":
			sprite_index = spr_warrior_idle_sheathed;
			
			if (right != left)
				_obj_person.state = "run";
			else if (jump) {
				_obj_person.state = "jump";
				_obj_person.speed_vertical = -_obj_person.speed_vertical_max;
			}
				
			break;
		case "run":
			sprite_index = spr_warrior_run;
			
			if (abs(_obj_person.speed_horizontal) < .1) {
				_obj_person.state = "idle";
				_obj_person.speed_horizontal = 0;
			}
			else if (jump) {
				_obj_person.state = "jump";
				_obj_person.speed_vertical = -_obj_person.speed_vertical_max;
			}
				
			break;
		case "jump":
			if (_obj_person.speed_vertical > 0)
				sprite_index = spr_warrior_fall;
			else {
				sprite_index = spr_warrior_jump;
				
				if (image_index >= image_number)
					image_index = image_number - 1;
			}
				
			if (ground) {
				_obj_person.state = "idle";
				_obj_person.speed_vertical   = 0;
				_obj_person.speed_horizontal = 0;
			}
			
			break;
		case "attack":
			
			break;
	}
}