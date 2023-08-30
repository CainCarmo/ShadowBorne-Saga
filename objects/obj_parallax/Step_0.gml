var _cameraX = camera_get_view_x(view_camera[0]);

if (room == rm_grove) {
	layer_x("Backgrounds_2", _cameraX * .4);
	layer_x("Backgrounds_3", _cameraX * .6);
}