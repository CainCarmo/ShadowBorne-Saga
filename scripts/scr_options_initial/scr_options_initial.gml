function OptionsInitial () constructor {
	static Continue = function () {
		new CreateSave().LoadAllStruct();
		
		room_goto(global.SaveData.Saves[global.SaveData.LastSavePlayed].Character.Local.Room);
	}
	static NewGame = function () {
		new DrawOptionsInitial().BackToHome();
		
		new CreateSave().LoadAllStruct();
		
		if (obj_menu.selectorCharacter) new DrawOptionsInitial().CharacterSelector();
		else {
			new DrawGUI().SaveBoard();
			new DrawOptionsInitial().SaveCards();
		}
	}
	static Credits = function () {
		new DrawOptionsInitial().BackToHome();
	}
	static Close = function () {
		game_end();
	}
}

function DrawOptionsInitial () constructor {
	static SaveCards = function () {
		var optionsActions = {
			LoadBar: {
				DrawLoadBar: function (wGUI, hGUI, index) {
					draw_rectangle_color(
						(wGUI / 2) * .25 + 20,
						(hGUI / 2) * .75 + (50  + (140 * index)),
						wGUI - (wGUI / 2) * .25 - 20, 
						(hGUI / 2) * .75 + (140 + (140 * index)),
						#204051, #204051, #204051, #204051,
						false
					);
					
					draw_rectangle_color(
						(wGUI / 2) * .25 + 30,
						(hGUI / 2) * .75 + (60  + (140 * index)),
						(wGUI / 2) * .25 + 30 * 5,
						(hGUI / 2) * .75 + (130 + (140 * index)),
						#000000, #000000, #000000, #000000,
						false
					);
					
					draw_sprite(
						global.SaveData.Saves[index].Character.Class == PlayerClass.Warrior ? spr_icon_warrior : spr_icon_wizard,
						0,
						(wGUI / 2) * .25 + 35,
						(hGUI / 2) * .75 + (60  + (140 * index))
					);
					
					draw_rectangle_color(
						(wGUI / 2 + 10) * .25 + 35 * 5 - 15,
						(hGUI / 2 + 10) * .75 + (110 + (140 * index)),
						(wGUI / 2 + 10) * .25 + 35 * 5 + 15,
						(hGUI / 2 + 10) * .75 + (128 + (140 * index)),
						#000000, #000000, #000000, #000000,
						false
					);
					
					draw_rectangle_color(
						(wGUI / 2) * .25 + 35 * 5 - 15,
						(hGUI / 2) * .75 + (110 + (140 * index)),
						(wGUI / 2) * .25 + 35 * 5 + 15,
						(hGUI / 2) * .75 + (128 + (140 * index)),
						#A7D129, #A7D129, #A7D129, #A7D129,
						false
					);
					
					draw_rectangle_color(
						(wGUI / 2 + 10) * .25 + 35 * 5 + 40,
						(hGUI / 2 + 10) * .75 + (110 + (140 * index)),
						(wGUI / 2 + 10) * .25 + 35 * 5 + 80,
						(hGUI / 2 + 10) * .75 + (128 + (140 * index)),
						#000000, #000000, #000000, #000000,
						false
					);
					
					draw_rectangle_color(
						(wGUI / 2) * .25 + 35 * 5 + 40,
						(hGUI / 2) * .75 + (110 + (140 * index)),
						(wGUI / 2) * .25 + 35 * 5 + 80,
						(hGUI / 2) * .75 + (128 + (140 * index)),
						#C70039, #C70039, #C70039, #C70039,
						false
					);
					
					draw_sprite(
						spr_icon_play,
						0, 
						(wGUI / 2) * .25 + (35 * 5), 
						(hGUI / 2) * .75 + (118 + (140 * index))
					);
					
					draw_sprite(
						spr_icon_trash,
						0, 
						(wGUI / 2) * .25 + (35 * 5) + 60, 
						(hGUI / 2) * .75 + (118 + (140 * index))
					);
					
					new DrawGUI()
						.Text("Load: " + string(index + 1),	(wGUI / 2) * .25 + 43 * 5, (hGUI / 2) * .75 + (80 + (140 * index)), 1, 1, ft_default,, true, c_black, fa_center, fa_middle);
				},
				Start:  function (saveIndex) {
					global.SaveData.LastSavePlayed = saveIndex;
					
					new CreateSave().Save();
					new CreateSave().Load(saveIndex);
					new CreateSave().Save();
					
					room_goto(global.SaveData.Saves[saveIndex].Character.Local.Room);
				},
				Delete: function (saveIndex) {
					new CreateSave().Delete(saveIndex);
				}
			},
			SaveBar: {
				DrawSaveBar: function (wGUI, hGUI, index) {
					draw_rectangle_color(
						(wGUI / 2) * .25 + 20,
						(hGUI / 2) * .75 + (50 + (140 * index)),
						wGUI - (wGUI / 2) * .25 - 20, 
						(hGUI / 2) * .75 + (140 + (140 * index)),
						#3A8891, #3A8891, #3A8891, #3A8891,
						false
					);
					
					draw_circle_color(
						(wGUI / 2) + 2,
						(hGUI / 2) + (140 * index) + 2,
						40,
						#000000, #000000,
						false
					);
					
					draw_circle_color(
						(wGUI / 2),
						(hGUI / 2) + (140 * index),
						40,
						#0E5E6F, #0E5E6F,
						false
					);
					
					draw_rectangle_color(
						(wGUI / 2) - 30,
						(hGUI / 2) + (140 * index) - 5,
						(wGUI / 2) + 30,
						(hGUI / 2) + (140 * index) - 5 + 10,
						#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF,
						false
					);
					
					draw_rectangle_color(
						(wGUI / 2) - 5,
						(hGUI / 2) + (140 * index) - 5 - 25,
						(wGUI / 2) + 5,
						(hGUI / 2) + (140 * index) - 5 + 30,
						#FFFFFF, #FFFFFF, #FFFFFF, #FFFFFF,
						false
					);
				},
				Click: function (saveIndex) { 
					obj_menu.timer = -1;
					obj_menu.saveIndex = saveIndex;
					obj_menu.selectorCharacter = true;
				}
			}
		}
		
		var arrSaves = [];
		
		var wGUI = display_get_gui_width();
		var hGUI = display_get_gui_height();
		
		var mouseX = device_mouse_x_to_gui(0);
		var mouseY = device_mouse_y_to_gui(0);
		
		for (var i = 0; i < new CreateSave().CountAllSaves(); i++) array_push(arrSaves, optionsActions.LoadBar);
		
		if (array_length(arrSaves) < 3) array_push(arrSaves, optionsActions.SaveBar);
		
		new Utils(obj_menu).SetTimer(1);
		
		for (var i = 0; i < array_length(arrSaves); i++) {
			if (arrSaves[i] == optionsActions.LoadBar) {
				arrSaves[i].DrawLoadBar(wGUI, hGUI, i);
				
				if (point_in_rectangle(
					mouseX, mouseY,
					(wGUI / 2) * .25 + 35 * 5 - 15,
					(hGUI / 2) * .75 + (110 + (140 * i)),
					(wGUI / 2) * .25 + 35 * 5 + 35,
					(hGUI / 2) * .75 + (148 + (140 * i))
				) && mouse_check_button(mb_left) && obj_menu.timer == 0)
				{
					arrSaves[i].Start(i);
				}
					
				if (point_in_rectangle(
					mouseX, mouseY, 
					(wGUI / 2) * .25 + 35 * 5 + 40,
					(hGUI / 2) * .75 + (110 + (140 * i)),
					(wGUI / 2) * .25 + 35 * 5 + 80,
					(hGUI / 2) * .75 + (128 + (140 * i))
				) && mouse_check_button(mb_left) && obj_menu.timer == 0)
				{
					arrSaves[i].Delete(i);
					
					obj_menu.timer = -1;
				}
			}
			else {
				arrSaves[i].DrawSaveBar(wGUI, hGUI, i);
			
				if (point_in_rectangle(
					mouseX, mouseY, 
					(wGUI  / 2) * .25 + 20, 
					(hGUI / 2) * .75 + ( 50 + (140 * i)),
					wGUI - (wGUI / 2) * .25 - 20, 
					(hGUI / 2) * .75 + (160 + (140 * i))
				) && mouse_check_button(mb_left) && obj_menu.timer == 0)
				{
					arrSaves[i].Click(i);
				}
			}
		}
		
		new DrawGUI()
			.Text("Limite: " + string(new CreateSave().CountAllSaves()) + "/3", wGUI - (wGUI / 2) * .25 - 110, (hGUI / 2) * .65 + 60, 1, 1, ft_default,, true, c_black, fa_center, fa_middle);
	}
	static CharacterSelector = function () {
		var charactersAvailable = {
			Wizard: {
				Name: "Mago",
				Class: PlayerClass.Wizard,
				Sprite: spr_selection_wizard
			},
			Warrior: {
				Name: "Guerreiro",
				Class: PlayerClass.Warrior,
				Sprite: spr_selection_warrior
			}
		}
		
		var arrCharacters = [charactersAvailable.Wizard, charactersAvailable.Warrior];
		
		var wGUI  = display_get_gui_width();
		var hGUI = display_get_gui_height();
		
		var mouseX = device_mouse_x_to_gui(0);
		var mouseY = device_mouse_y_to_gui(0);
		
		new Utils(obj_menu).SetTimer(1);
		
		for (var i = 0; i < array_length(arrCharacters); i++) {
			var colorRectangle = undefined;
					
			if (point_in_rectangle (
					mouseX, mouseY,
					wGUI - (wGUI / 2) - 150,
					hGUI - 100,
					(wGUI / 2) + 150,
					hGUI - 50
			) && mouse_check_button(mb_left) && obj_menu.saveIndex != undefined) 
			{
				new CreateSave().LoadAllStruct();
				
				global.SaveData.Saves[obj_menu.saveIndex].IsEmpty = false;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Class = obj_menu.classSelected;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Life.Max   = 100;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Life.Atual = 100;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Life.Regen = 2;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Stamina.Max   = 100;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Stamina.Atual = 100;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Stamina.Regen = 1;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Mana.Max   = 100;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Mana.Atual = 100;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Mana.Regen = 1;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Armor.Atual  = obj_menu.classSelected == PlayerClass.Warrior ? 5 : 7;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Armor.Buffed = 0;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Strenght.Atual  = obj_menu.classSelected == PlayerClass.Warrior ? 6 : 8;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Strenght.Buffed = 0;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Level.XP      = 0;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Level.LimitXP = 150;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Level.Count   = 0;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Status.Bulk = 1;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Movimentation.Speed.Vertical   = 8;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Movimentation.Speed.Horizontal = 6;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Combat.Wield = false;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Combat.Dash.Distance = 8;
				
				global.SaveData.Saves[obj_menu.saveIndex].Character.Local.Room = rm_astravens;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Local._x   = 195;
				global.SaveData.Saves[obj_menu.saveIndex].Character.Local._y   = 400;
				
				global.SaveData.LastSavePlayed = obj_menu.saveIndex;
				
				new CreateSave().Save();
				
				room_goto(global.SaveData.Saves[obj_menu.saveIndex].Character.Local.Room);
			}
			
			colorRectangle = obj_menu.classSelected == arrCharacters[i].Class 
				? #A7D129
				: #0E5E6F;
				
			draw_rectangle_color(
				wGUI / 2 * .65 + (250 * i) + 5,
				hGUI / 2 * .65 + 5,
				wGUI / 2 * .65 + 200 + (250 * i) + 5,
				hGUI / 2 * .65 + 200 + 5,
				#000000, #000000, #000000, #000000,
				false
			);
			
			draw_rectangle_color(
				wGUI / 2 * .65 + (250 * i),
				hGUI / 2 * .65,
				wGUI / 2 * .65 + 200 + (250 * i),
				hGUI / 2 * .65 + 200,
				colorRectangle, colorRectangle, colorRectangle, colorRectangle,
				false
			);
			
			draw_sprite(
				arrCharacters[i].Sprite,
				0,
				wGUI / 2 * .65 + (250 * i),
				hGUI / 2 * .65
			)
			
			if (point_in_rectangle (
					mouseX, mouseY,
					wGUI / 2 * .65 + (250 * i),
					hGUI / 2 * .65,
					wGUI / 2 * .65 + 200 + (250 * i),
					hGUI / 2 * .65 + 200
			) && mouse_check_button(mb_left) && obj_menu.timer == 0)
			{
				obj_menu.classSelected = arrCharacters[i].Class;
			}
		}
		
		new DrawGUI()
			.Text("Selecione sua Classe", (wGUI / 2), (hGUI / 2) * .25, 1, 1, ft_menu,, true, c_black, fa_center, fa_middle);
			
		if (obj_menu.classSelected != undefined) {
			draw_rectangle_color(
				(wGUI / 2) + 155,
				hGUI - 45,
				wGUI - (wGUI / 2) - 145,
				hGUI - 100,
				#000000, #000000, #000000, #000000, 
				false
			);
		
			draw_rectangle_color(
				(wGUI / 2) + 150,
				hGUI - 50,
				wGUI - (wGUI / 2) - 150,
				hGUI - 100,
				#A7D129, #A7D129, #A7D129, #A7D129,
				false
			);
			
			new DrawGUI()
				.Text("Iniciar", (wGUI / 2), hGUI - 75, 1, 1, ft_menu,, true, c_black, fa_center, fa_middle);
		}
	}
	static BackToHome = function () {
		var wGUI = display_get_gui_width();
		var hGUI = display_get_gui_height();
		
		var mouseX = device_mouse_x_to_gui(0);
		var mouseY = device_mouse_y_to_gui(0);
		
		if (point_in_rectangle(mouseX, mouseY, 70, 25, 195, 70)) {
			new DrawGUI()
				.Text("< Home", 110, 50, lerp(1, 1.4, .05), lerp(1, 1.4, .05), ft_default, c_red, true, c_black, fa_center, fa_middle);
				
			if (mouse_check_button(mb_left)) {
				obj_menu.timer = -1;
				obj_menu.saveIndex = undefined;
				obj_menu.selectedOption = undefined;
				obj_menu.selectorCharacter = false;	
				obj_menu.classSelected = undefined;
			}
		}
		else
			new DrawGUI()
				.Text("< Home", 110, 50, 1, 1, ft_default, c_white, true, c_black, fa_center, fa_middle);
	}
}