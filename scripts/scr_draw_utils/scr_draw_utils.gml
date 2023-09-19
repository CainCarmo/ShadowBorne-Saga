#region Draw [GUI]

/// @function	 DrawGUI()
/// @description Funções para desenhar no evento Draw GUI (Desenha na Tela)
function DrawGUI () constructor {
	
	/// @function						Text(text, _x, _y, _sx, _sy, font, color, hal, val, border)
	/// @description					Desenha o texto passado na tela
	/// @param {String}			 text   Texto a ser exibido
	/// @param {Real}			 x		Posição no eixo X
	/// @param {Real}			 y		Posição no eixo Y
	/// @param {Real}			 xscale Escala no eixo X
	/// @param {Real}			 yscale Escala no eixo Y
	/// @param {Asset.GMFont}	 font	Fonte a ser utilizada no texto
	/// @param {Constant.Color}	 color	Cor do texto
	/// @param {Constant.Halign} halign Alinhamento na horizontal
	/// @param {Constant.Valign} valign Alinhamento na vertical
	/// @param {Bool}			 border Desenha uma borda "sombra" no texto
	static Text = function (text, _x, _y, _sx, _sy, font = undefined, color = undefined, hal = undefined, val = undefined, border = false) {
		if (font != undefined) draw_set_font(font);
		if (hal  != undefined) draw_set_halign(hal);
		if (val  != undefined) draw_set_valign(val);
		
		if (border) {
			draw_set_color(c_black);
			draw_text_transformed(_x + 2, _y + 2, text, _sx, _sy, 0);
		}
		
		_ = color == undefined ? draw_set_color(-1) : draw_set_color(color);
		
		draw_text_transformed(_x, _y, text, _sx, _sy, 0);
		
		draw_set_font(-1);
		draw_set_color(-1);
		
		draw_set_halign(-1);
		draw_set_valign(-1);
	}
	
	/// @function						  LoadingBar(x1, y1, x2, y2, outline, color, timer, timeSecs)
	/// @description					  Desenha o texto passado na tela
	/// @param {Real}			 x1		  Posição primária no eixo X
	/// @param {Real}			 y1		  Posição primária no eixo Y
	/// @param {Real}			 x2		  Posição secundária no eixo X
	/// @param {Real}			 y2		  Posição secundária no eixo Y
	/// @param {Bool}			 outline  Desenha uma borda na barra
	/// @param {Constant.Color}	 color	  Cor da barra de progresso
	/// @param {Real}			 timer	  Tempo do timer
	/// @param {Real}			 timeSecs Tempo total do timer
	static LoadingBar = function (x1, y1, x2, y2, outline = false, color = undefined, timer, timeSecs) {
		var progressBar = (x2 / timeSecs) * (timer / 60);
		
		draw_rectangle(x1, y1, x2, y2, outline);
		draw_rectangle_color(x1 + 1, y1 - 1, x2 - 1, y2, c_gray, c_gray, c_gray, c_gray, false);
		draw_rectangle_color(x1 + 1, y1 - 1, x2 - progressBar, y2, color, color, color, color, false);
	}
}

#endregion