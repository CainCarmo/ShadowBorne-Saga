if (obj_room.state != EnvironmentState.Normal) return;

var wGUI = display_get_gui_width();
var hGUI = display_get_gui_height();

if (started == false) {
	new Utils(self).SetTimer(5) 
	
	if (timer > 0) {
		new DrawGUI()
			.Text("Hordas", wGUI / 2, hGUI / 4 - 50, 1, 1, ft_logo,, true, c_black, fa_center, fa_middle);
		new DrawGUI()
			.Text("Vença as hordas para seguir para o Boss!", wGUI / 2, hGUI / 4, 1, 1, ft_menu,, true, c_red, fa_center, fa_middle);
		new DrawGUI()
			.Text("Começando em: " + string(round(timer / room_speed)), wGUI - 200, 40, 1, 1, ft_status,, true, c_black, fa_left, fa_top);
	}
	else {
		timer   = -1; 
		started = true;
	}
}
else {
	if (timer > 0 && !nextRoom) {
		new DrawGUI()
			.Text("Horda " + string(steps) + " / " + string(stepsAll), wGUI / 2, hGUI / 4 - 50, 1, 1, ft_logo,, true, c_black, fa_center, fa_middle);
	}
	else if (timer > 0 && nextRoom) {
		new DrawGUI()
			.Text("Parabéns por passar pelas Hordas!", wGUI / 2, hGUI / 4, 1, 1, ft_menu,, true, c_black, fa_center, fa_middle);
		new DrawGUI()
			.Text("Movendo para a sala do Boss", wGUI / 2, hGUI / 4 + 30, 1, 1, ft_menu,, true, c_black, fa_center, fa_middle);
		new DrawGUI()
			.Text("Começando em: " + string(round(timer / room_speed)), wGUI - 200, 40, 1, 1, ft_status,, true, c_black, fa_left, fa_top);
	}
	else {
		new DrawGUI()
			.Text("Inimigos restantes: " + string(limit[steps - 1] - enemiesDied), wGUI - 300, 40, 1, 1, ft_status,, true, c_black, fa_left, fa_top);
	}
}