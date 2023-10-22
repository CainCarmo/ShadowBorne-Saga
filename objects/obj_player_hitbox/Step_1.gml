// @Get Objects Collised
oCollised = instance_place_list(x, y, enemies, collision_list, false);

if (oCollised > 0 && !executed) {
	executed = true;
	
	for (var i = 0; i < ds_list_size(collision_list); i++) {
		var enemy = collision_list[| i];
		
		if (!ds_list_find_value(hitbox_list, enemy)) {
			ds_list_add(hitbox_list, enemy);
			
			with (enemy) {
				status.Life.Atual -= obj_player.status.Strenght.Atual + obj_player.status.Strenght.Buffed;
			}
		}
	}
}