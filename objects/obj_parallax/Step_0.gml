var _cameraX = camera_get_view_x(view_camera[0]);

if (room == rm_grove) {
	layer_x("Backgrounds_2", _cameraX * .6);
	layer_x("Backgrounds_3", _cameraX * .4);
}
//layer_x("Backgrounds_1", _cameraX * .3);
//layer_x("Backgrounds_2", _cameraX * .6);
//layer_x("Backgrounds_3", _cameraX * .4);
//layer_x("Backgrounds_4", _cameraX * .5);
//layer_x("Backgrounds_5", _cameraX * .2);
//layer_x("Backgrounds_6", _cameraX * .3);
//layer_x("Backgrounds_7", _cameraX * .4);