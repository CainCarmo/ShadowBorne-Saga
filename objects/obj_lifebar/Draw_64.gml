draw_rectangle_color(
	5,
	32,
	vida,
	52,
	c_red, c_red, c_red, c_red, 
	false
);

draw_sprite(spr_hud_vida, 0, 3, 3);

if (keyboard_check(ord("P"))) {
	vida = vida - 10;
	
	if (vida <= 0) {
		vida = 0;	
		obj_player.state = EntityStates.Die;
	}
}