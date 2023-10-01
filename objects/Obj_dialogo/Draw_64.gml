var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

var _xx = 0;
var _yy = _guia - 200;
var _c = c_black;
draw_set_font(m);
draw_rectangle_color(_xx, _yy, _guil, _guia, _c, _c, _c, _c, false);
draw_text_ext(_xx + 32, _yy + 32, texto[pagina], 32, _guil - 64);

if op_draw == true
{
	var _opx = _xx + 32;
	var _opy = _yy - 48;
	var _opsep = 48;
	var _opborda = 6;
	 
	op_selec += keyboard_check_pressed(ord("W")) - keyboard_check_pressed(ord("S"));
	op_selec = clamp(op_selec, 0, op_num-1);
	
	for (var i = 0; i< op_num; i++)
	{
		var _stringw = string_width(op[i]);
		draw_sprite_ext(Sprite62, 0, _opx, _opy - (_opsep * i), (_stringw + _opborda * 2)/16, 1, 0, c_white, 1);
		draw_text(_opx + _opborda, _opy - (_opsep * i), op[i]);
		
		if op_selec == i
		{
 			draw_sprite(Sprite63, 0, _xx + 8, _opy - (_opsep * i) + 8);
		}
	}
	if (keyboard_check_pressed(ord("f")))
	{
			
			var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
			_dialogo.npc_nome = op_resposta[op_selec];
			instance_destroy();
	}
}
