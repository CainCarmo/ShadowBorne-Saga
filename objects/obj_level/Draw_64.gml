var wGUI  = display_get_gui_width();
var hGUI = display_get_gui_height();

draw_rectangle_color(
	(wGUI / 2) * .25,
	hGUI - 30,
	wGUI - (wGUI / 2) * .25,
	hGUI - 50,
	#000000, #000000, #000000, #000000,
	false
);

draw_rectangle(
	(wGUI / 2) * .25,
	hGUI - 30,
	wGUI - (wGUI / 2) * .25,
	hGUI - 50,
	true
);

draw_rectangle_color(
	(wGUI / 2) * .25,
	hGUI - 30,
	(wGUI / 2) * .25 + ((experience_point/experience_point_limit) * (wGUI - (wGUI / 2) * .50)),
	hGUI - 50,
	c_lime, c_lime, c_lime, c_lime,
	false
);

draw_text((wGUI / 2) * .25 + 5, hGUI - 95, "Level: " + string(experience_level));
draw_text((wGUI / 2) * .25 + 5, hGUI - 75, "XP: " + string(experience_point) + "/" + string(experience_point_limit));