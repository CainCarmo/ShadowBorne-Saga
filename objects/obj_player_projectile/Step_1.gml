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
				
				state = EntityState.Hit;
				
				dist_aggro = 3000;
				
				var attack = irandom_range(0, 1);
				
				if (instance_exists(obj_player) && name == Boss.Death && attack == 1) {
					state = EntityState.Attack;
					
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
			}
		}
	}
	
	instance_destroy();
}
else {
	if (place_meeting(x, y - obj_player_projectile.sprite_height, obj_collider)) instance_destroy();
}