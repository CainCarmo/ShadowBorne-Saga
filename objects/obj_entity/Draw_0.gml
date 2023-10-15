draw_self();

// Exibe informações úteis para o debug
if (view_debugger) {
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	draw_text(x, y - sprite_height * 1.2, state);
	
	draw_set_valign(-1);
	draw_set_halign(-1);
}