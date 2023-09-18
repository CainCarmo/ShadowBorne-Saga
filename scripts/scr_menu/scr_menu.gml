#region [Menu]

/// @function	 Create()
/// @description Funções para criações de menu
function CreateMenu () constructor {
	
	/// @function	 Initial(_obj_entity)
	/// @description Cria o menu principal
	static Initial = function () {
		var menuOptions = {
			Continuar: ["Continuar", function () { room_goto(rm_loading); }],
			NovoJogo : ["Novo Jogo", function () {}],
			Opcoes	 : ["Opções",    function () {}],
			Creditos : ["Créditos",  function () {}],
			Sair	 : ["Sair",      function () { game_end(); }]
		}
		
		var arrOptions = [
			menuOptions.Continuar, 
			menuOptions.NovoJogo, 
			menuOptions.Opcoes, 
			menuOptions.Creditos, 
			menuOptions.Sair
		];
		
		var optionSelection = undefined;
			optionSelection[array_length(arrOptions) - 1] = 0;
		
		var _mouseX = device_mouse_x_to_gui(0);
		var _mouseY = device_mouse_y_to_gui(0);
		
		var _widthGUI  = display_get_gui_width();
		var _heightGUI = display_get_gui_height();
		
		#region Draw [Title]
		
		new DrawGUI()
			.Text(
				ft_menu_initial_title,
				fa_center,
				fa_middle,
				GAMETITLE,
				c_white,
				_widthGUI  / 2,
				_heightGUI / 4 - 50,
				1,
				1,
				true
			);
			
		#endregion
		
		for (var i = 0; i < array_length(optionSelection); i++) 
			optionSelection[i] = 1;
		
		#region Draw [Options]
		
		for (var i = 0; i < array_length(arrOptions); i++) {
			
			var _widthString  = string_width(arrOptions[i][0]);
			var _heightString = string_height("I") + 50;
			
			// @Top Left
			var _x1 = _widthGUI  / 2 - _widthString;
			var _y1 = _heightGUI / 2 - _heightString / 2 + _heightString * i;
			
			// @Button Right
			var _x2 = _widthGUI  / 2 + _widthString;
			var _y2 = _heightGUI / 2 + _heightString / 2 + _heightString * i;
			
			var _fontColor = undefined;
			
			if (point_in_rectangle(_mouseX, _mouseY, _x1 - 30, _y1, _x2 + 30, _y2)) {
				_fontColor = c_red;
				optionSelection[i] = lerp(optionSelection[i], 1.4, .05);
				
				if (mouse_check_button(mb_left)) arrOptions[i][1]();
			}
			else {
				_fontColor = c_white;
				optionSelection[i] = lerp(optionSelection[i], 1, .05);
			}
			
			new DrawGUI()
				.Text(
					ft_menu_initial_options,
					fa_center,
					fa_middle,
					arrOptions[i][0],
					_fontColor,
					_widthGUI  / 2,
					_heightGUI / 2 + _heightString * i,
					optionSelection[i],
					optionSelection[i],
					true
				);
		}
		
		#endregion
	}
} 

#endregion