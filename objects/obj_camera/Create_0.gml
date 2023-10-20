// @Timer
timer = -1;

// @Variables - Manage [Resolution]
screenWidth  = display_get_width();
screenHeight = display_get_height();

gameWidth  = 1366;
gameHeight = 768;

scaleX = screenWidth  / gameWidth;
scaleY = screenHeight / gameHeight;

scaleMin = 2;

cameraHeightUpDown = 0;	

// @Camera
_cameraX = 0;
_cameraY = 0;

// @Alarm
alarm[0] = 1;

// @Resize - Resolution

display_set_gui_maximize(scaleMin);

window_set_size(gameWidth * scaleMin, gameHeight * scaleMin);
surface_resize (application_surface, gameWidth, gameHeight);

display_set_gui_size(gameWidth, gameHeight);

// @Camera Shake
isShake = false;

// @Settings
objectTarget = obj_player;