	function DrawGUI () constructor {
	static Text = function (text, _x, _y, _sx, _sy, font = undefined, colorDefault = undefined, border = false, colorBorder = undefined, hal = undefined, val = undefined) {
		if (font != undefined) draw_set_font(font);
		if (hal  != undefined) draw_set_halign(hal);
		if (val  != undefined) draw_set_valign(val);
		
		if (border) {
			_ = colorBorder != undefined ? draw_set_color(colorBorder) : draw_set_color(-1);
			draw_text_transformed(_x + 2, _y + 2, text, _sx, _sy, 0);
		}
		
		_ = colorDefault != undefined ? draw_set_color(colorDefault) : draw_set_color(-1);
		
		draw_text_transformed(_x, _y, text, _sx, _sy, 0);
		
		// @Reset
		draw_set_font  (-1);
		draw_set_color (-1);
		draw_set_halign(-1);
		draw_set_valign(-1);
			
	}
	static SaveBoard = function () {
		var wGUI = display_get_gui_width();
		var hGUI = display_get_gui_height();
		
		draw_rectangle_color(
			(wGUI  / 2) * .25 + 10,
			(hGUI / 2) * .75 + 10,
			wGUI  - (wGUI  / 2) * .25 + 10, 
			hGUI - 40,
			#000000, #000000, #000000, #000000,
			false
		);
		
		draw_rectangle_color(
			(wGUI  / 2) * .25,
			(hGUI / 2) * .75,
			wGUI  - (wGUI  / 2) * .25, 
			hGUI - 50,
			#0E5E6F, #0E5E6F, #0E5E6F, #0E5E6F,
			false
		);
		
		draw_rectangle_color(
			(wGUI  / 2) * .85 - 5,
			(hGUI / 2) * .65 - 5,
			wGUI - (wGUI  / 2) * .85 + 5,
			(hGUI / 2) * .65 + 65,
			#000000, #000000, #000000, #000000,
			false
		);
		
		draw_rectangle_color(
			(wGUI  / 2) * .85,
			(hGUI / 2) * .65,
			wGUI - (wGUI  / 2) * .85,
			(hGUI / 2) * .65 + 60,
			#84A9AC, #84A9AC, #84A9AC, #84A9AC,
			false
		);
		
		new DrawGUI()
			.Text(GAMETITLE, wGUI / 2, hGUI / 4 - 50, 1, 1, ft_logo,, true, c_black, fa_center, fa_middle);
			
		new DrawGUI()
			.Text(VERSION, wGUI - (wGUI / 2) * .65, hGUI / 4, 1, 1, ft_logo_version,, true, c_black, fa_center, fa_middle);
		
		new DrawGUI()
			.Text("Saves", (wGUI  / 2), (hGUI / 2) * .75 - 10, 1, 1, ft_menu,, true, c_black, fa_center, fa_middle);
	}
	static LoadingBar = function (x1, y1, x2, y2, outline = false, color = undefined, timer, timeSecs) {
		var progressBar = (x2 / timeSecs) * (timer / 60);
		
		draw_rectangle(x1, y1, x2, y2, outline);
		draw_rectangle_color(x1 + 1, y1 - 1, x2 - 1, y2, c_gray, c_gray, c_gray, c_gray, false);
		draw_rectangle_color(x1 + 1, y1 - 1, x2 - progressBar, y2, color, color, color, color, false);
	}
}