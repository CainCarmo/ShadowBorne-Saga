camera_set_view_size(view_camera[0], gameWidth, gameHeight);

if (instance_exists(objectTarget)) {
	obj_camera.x = lerp(obj_camera.x, objectTarget.x, .1);
	obj_camera.y = lerp(obj_camera.y, objectTarget.y, .1);
}