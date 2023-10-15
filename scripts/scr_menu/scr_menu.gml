function CreateMenu () constructor {
	static Initial = function () {
		var menuOptions = {
			Continue:   ["Continuar",  function () { obj_menu.selectedOption = MenuInitialOptions.Continue   }],
			NewGame:    ["Novo Jogo",  function () { obj_menu.selectedOption = MenuInitialOptions.NewGame    }],
			Disclaimer: ["Disclaimer", function () { obj_menu.selectedOption = MenuInitialOptions.Disclaimer }],
			Credits:    ["Créditos",   function () { obj_menu.selectedOption = MenuInitialOptions.Credits    }],
			Close:      ["Sair",	   function () { obj_menu.selectedOption = MenuInitialOptions.Close      }]
		}
		
		var arrOptions = [
			menuOptions.Continue,
			menuOptions.NewGame,
			menuOptions.Disclaimer,
			menuOptions.Credits,
			menuOptions.Close
		]
		
		var optionSelection = undefined;
			optionSelection[array_length(arrOptions) - 1] = 0;
			
		var mouseX = device_mouse_x_to_gui(0);
		var mouseY = device_mouse_y_to_gui(0);
		
		var wGUI = display_get_gui_width();
		var hGUI = display_get_gui_height();
		
		new DrawGUI()
			.Text(GAMETITLE, wGUI / 2, hGUI / 4 - 50, 1, 1, ft_logo,, true, c_black, fa_center, fa_middle);
			
		new DrawGUI()
			.Text(VERSION, wGUI - (wGUI / 2) * .65, hGUI / 4, 1, 1, ft_logo_version,, true, c_black, fa_center, fa_middle);
			
		if (!new CreateSave().CountAllSaves() > 0) array_shift(arrOptions);
		
		for (var i = 0; i < array_length(optionSelection); i++) optionSelection[i] = 1;
		
		for (var i = 0; i < array_length(arrOptions); i++) {
			var wStr = string_width (arrOptions[i][0]);
			var hStr = string_height("I") + 30;
			
			var _x1 = wGUI / 2 - wStr;
			var _y1 = hGUI / 2 - hStr / 2 + hStr * i;
			
			var _x2 = wGUI / 2 + wStr;
			var _y2 = hGUI / 2 + hStr / 2 + hStr * i;
	
			var _colorText = undefined;
			
			if (point_in_rectangle(mouseX, mouseY, _x1 - 30, _y1, _x2 + 30, _y2)) {
				_colorText = c_red;
				optionSelection[i] = lerp(optionSelection[i], 1.4, .05);
				
				if (mouse_check_button(mb_left)) arrOptions[i][1]();
			}
			else {
				_colorText = c_white;
				optionSelection[i] = lerp(optionSelection[i], 1, .05);
			}
			
			new DrawGUI()
				.Text(arrOptions[i][0], wGUI  / 2, hGUI / 2 + hStr * i, optionSelection[i], optionSelection[i], ft_menu_initial, _colorText, true,  c_black, fa_center, fa_middle);
		}
	}
}