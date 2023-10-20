_cameraX = obj_camera.x - (gameWidth  / scaleMin);
_cameraY = obj_camera.y - (gameHeight / scaleMin);

_cameraX = clamp(_cameraX, 0, room_width - gameWidth);
_cameraY = clamp(_cameraY, 0, room_height - gameHeight) - cameraHeightUpDown;