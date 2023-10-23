var wGUI = display_get_gui_width();
var hGUI = display_get_gui_height();
	
if (deathIsDead) {
	new Utils(self).SetTimer(7);
		
	draw_rectangle_color(
		-1,
		 0,
		wGUI,
		hGUI,
		c_black, c_black, c_black, c_black, 
		false
	);
	
	obj_room.state = EnvironmentState.Cutscene;
	
	new DrawGUI()
		.Text("WINNER", wGUI / 2, hGUI / 4 - 50, 1, 1, ft_logo,, true, c_red, fa_center, fa_middle);
	new DrawGUI()
		.Text("Parabéns você concluiu o jogo!", wGUI / 2, hGUI / 4, 1, 1, ft_menu,, true, c_red, fa_center, fa_middle);
	new DrawGUI()
		.Text("Voltando para menu principal em: " + string(round(timer / room_speed)), wGUI - 450, 40, 1, 1, ft_status,, true, c_black, fa_left, fa_top);
		
	if (timer == 0) {
		new CreateSave().Delete(global.SaveData.LastSavePlayed);
		new CreateSave().Save();
		
		room_goto(rm_initial);
	}
}

if (instance_exists(obj_death) && obj_camera.objectTarget == obj_death && obj_room.state != EnvironmentState.Loading) {
	new DrawGUI()
		.Text("DEATH", wGUI / 2, hGUI / 4 - 50, 1, 1, ft_logo,, true, c_red, fa_center, fa_middle);
}