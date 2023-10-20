if (obj_room.state != EnvironmentState.Normal) exit;

if (speed_horizontal != 0)
	scale_x = sign(speed_horizontal);
image_xscale = scale_x;

move_and_collide(objectAtual.speed_horizontal, objectAtual.speed_vertical, obj_collider);