if (objectAtual.identity != Identity.Player && objectAtual.identity != Identity.NPC) {
	var hGUI = display_get_gui_height();
	
	draw_rectangle_color(
		objectAtual.x - 50,
		hGUI - objectAtual.sprite_height - 20,
		objectAtual.x + 50,
		hGUI - objectAtual.sprite_height - 30,
		c_red, c_red, c_red, c_red,
		false
	);
}