#region [Loading Room]

function CreateLoading (_obj_entity) constructor {
	_obj = _obj_entity;
	
	static Cave = function () {}
	
	static City = function () {
		
		if (_obj.timer == -1) new Utils(_obj).SetTimer(5);
		
		var cityBackgrounds = [
			spr_loading_city_background_1,
		];
		
		var layerID = layer_get_id("Background");
		var backsID = layer_background_get_id(layerID);
		
		var guid = random(array_length(cityBackgrounds) - 1);
		
		var _mouseX = device_mouse_x_to_gui(0);
		var _mouseY = device_mouse_y_to_gui(0);
		
		var _widthGUI  = display_get_gui_width();
		var _heightGUI = display_get_gui_height();
		
		if (new Utils(_obj).CountTimer() == 0) {
			
			// do something
		}
		else {
			
		}
		
		layer_background_sprite(backsID, cityBackgrounds[guid]);

		// Loading Text
		var loadingMessages = [
			"Loading",
			"Loading.",
			"Loading..",
			"Loading..."
		]
		
		new DrawGUI().Text(ft_menu_initial_options,,, loadingMessages[3], c_white, _heightGUI - 30 - 10, 5, 1, 1);

		// Perfect loadingbar wrap
		draw_rectangle(3, _heightGUI, _widthGUI - 3, _heightGUI - 30, true);
		
		// Perfect loadingbar [full]
		draw_rectangle_color(3 + 1, _heightGUI - 1, _widthGUI - 3 - 1, _heightGUI - 30, c_lime, c_lime, c_lime, c_lime, false);
	}
	
	static Forest = function () {}
	
	static Montain = function () {}
}

#endregion