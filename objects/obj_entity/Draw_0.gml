if (obj_room.state != EnvironmentState.Normal) exit;

draw_self();

// @View Debbuger Messages
if (view_debugger) {
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	//draw_text(x, y - sprite_height * 1.2, status.Life.Atual); 
	draw_text(x, y - sprite_height * 1.2, state); 
	
	draw_set_valign(-1);
	draw_set_halign(-1);
}