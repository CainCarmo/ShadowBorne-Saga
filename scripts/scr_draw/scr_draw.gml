#region Draw [GUI]

/// @function	 DrawGUI(_obj_entity)
/// @description Funções para desenhar no evento Draw GUI (Desenha na Tela)
function DrawGUI () {
	
	/// @function						Text(_obj_entity)
	/// @description					Desenha o texto passado na tela
	/// @param {Asset.GMFont}	 font	Fonte a ser utilizada no texto
	/// @param {Constant.Halign} halign Alinhamento na horizontal
	/// @param {Constant.Valign} valign Alinhamento na vertical
	/// @param {String}			 text   Texto a ser exibido
	/// @param {Constant.Color}	 color	Cor do texto
	/// @param {Real}			 x		Posição no eixo X
	/// @param {Real}			 y		Posição no eixo Y
	/// @param {Real}			 xscale Escala no eixo X
	/// @param {Real}			 yscale Escala no eixo Y
	/// @param {Bool}			 border Desenha uma borda "sombra" no texto
	static Text = function (font, hal, val, text, color, _x, _y, _sx, _sy, border = false) {
		draw_set_font(font);
		draw_set_halign(hal);
		draw_set_valign(val);
		
		if (border) {
			draw_set_color(c_black);
			draw_text_transformed(_x + 2, _y + 2, text, _sx, _sy, 0);
		}
		
		draw_set_color(color);
		draw_text_transformed(_x, _y, text, _sx, _sy, 0);
		
		draw_set_font(-1);
		draw_set_color(-1);
		
		draw_set_halign(-1);
		draw_set_valign(-1);
	}
}

#endregion