global.cameraWidth  = 1280;
global.cameraHeight = 720;
global.cameraHeightUpDown = 200;
global.windowScale  = 2;

window_set_size(global.cameraWidth * global.windowScale, global.cameraHeight * global.windowScale);

alarm[0] = 1;

surface_resize(application_surface, global.cameraWidth, global.cameraHeight);
display_set_gui_size(global.cameraWidth, global.cameraHeight);