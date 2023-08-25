camera_set_view_size(view_camera[0], global.cameraWidth, global.cameraHeight);

x = lerp(x, obj_player.x, .1);
y = lerp(y, obj_player.y, .1);

var _cameraX = x - (global.cameraWidth / global.windowScale);
var _cameraY = y - (global.cameraHeight / global.windowScale);

_cameraX = clamp(_cameraX, 0, room_width - global.cameraWidth);
_cameraY = clamp(_cameraY, 0, room_height - global.cameraHeight) - global.cameraHeightUpDown;

camera_set_view_pos(view_camera[0], _cameraX, _cameraY);