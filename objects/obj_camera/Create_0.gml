#region Manage [Resolution]

screenWidth  = display_get_width();
screenHeight = display_get_height();

gameWidth  = 1366;
gameHeight = 768;

scaleX = screenWidth / gameWidth;
scaleY = screenHeight / gameHeight;

scaleMin = 2;

#endregion

#region [Camera]

_cameraX = 0;
_cameraY = 0;

#endregion

alarm[0] = 1;

#region Resize [Resolution]

display_set_gui_maximize(scaleMin);

window_set_size(gameWidth * scaleMin, gameHeight * scaleMin);
surface_resize (application_surface, gameWidth, gameHeight);

display_set_gui_size(gameWidth, gameHeight);

#endregion

#region [Custom]

cameraHeightUpDown = 0;	

#endregion