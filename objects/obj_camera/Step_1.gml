camera_set_view_size(view_camera[0], gameWidth, gameHeight);

obj_camera.x = lerp(obj_camera.x, obj_player.x, .1);
obj_camera.y = lerp(obj_camera.y, obj_player.y, .1);