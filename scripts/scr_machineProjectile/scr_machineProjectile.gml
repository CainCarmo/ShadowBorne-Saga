function MachineProjectile () constructor {
	static Player = function () {
		new Utils(obj_player).SetTimerProjectile(.5);
		
		if (obj_player.timerProjectile == 0) {
			obj_player.status.Mana.Atual -= 5;
			
			var projectile = instance_create_layer(
				(obj_player.x + obj_player.sprite_width  / 2), 
				(obj_player.y - obj_player.sprite_height / 2), 
				"Instances", 
				obj_player_projectile
			);
			
			var _direction = point_direction(projectile.x, projectile.y, mouse_x, mouse_y)
			
			projectile.sprite_index = spr_wizard_combat_f_projectile;
			projectile.image_angle  = _direction;
			projectile.direction    = _direction;
			projectile.speed = 6;
			
			obj_player.timerProjectile = -1;
		}
	}
}