var _guil =display_get_gui_width();
var _guia =display_get_gui_height();

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if inven == true
{
	var _invenx = _guil/2 - inven_l/2;
	var _inveny = _guia/2 - inven_a/2;
	
	draw_sprite_ext(hub, 0, _invenx, _inveny, escala, escala, 0, c_white, 1);
	
	
	var _ix = 0;
	var _iy = 0;
	for (var i = 0; i < total_slots; i++)
	{
		
		var _slotsx = _invenx + comeco_x + ((tamanho_slots + buffer) * _ix);
		var _slotsy = _inveny + comeco_y + ((tamanho_slots + buffer) * _iy);
		
		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slots, _slotsy +tamanho_slots)
		{
			draw_sprite_ext(selectHub, 0, _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			if mouse_check_button_pressed(mb_left)
			{
				//caso não item selecionado
				if item_select == -1
				{
					item_select = grid_items[# infos.item, i];
					pos_select = i;
					
				}//caso ja tenha um item selecionado
				else
				{
					//caso o item selecionado seja igual do slot que iremos colocar
					if item_select == grid_items[# infos.item, i] and pos_select != i and grid_items[# infos.Sprite, i] == grid_items[# infos.Sprite, pos_select]
					{
						grid_items[# infos.quant, i] += grid_items[# infos.quant, pos_select];
						
						grid_items[# infos.item, pos_select] = -1;
						grid_items[# infos.quant, pos_select] = -1;
						item_select = -1;
						pos_select = -1;
					}
					//caso o slot esteja vazio
					
					else if grid_items[# infos.item, i] == -1
					{
						grid_items[# infos.item, i] = grid_items[# infos.item, pos_select];
						grid_items[# infos.quant, i] = grid_items[# infos.quant, pos_select];
						grid_items[# infos.Sprite, i] = grid_items[# infos.Sprite, pos_select];
						
						grid_items[# infos.item, pos_select] = -1;
						grid_items[# infos.quant, pos_select] = -1;
						grid_items[# infos.Sprite, pos_select] = -1;
						
						item_select = -1;
						pos_select = -1;
					}
					//caso o slot selecionado ja tenha um item trocar o item
					else if grid_items[# infos.item, pos_select] != grid_items[# infos.item, i] or grid_items[# infos.Sprite, pos_select] != grid_items[# infos.Sprite, i]
					{
						var _item = grid_items[# infos.item, i];
						var _itemquant = grid_items[# infos.quant, i];
						var _spr = grid_items[# infos.Sprite, i];
						
						grid_items[# infos.item, i] = grid_items[# infos.item, pos_select];
						grid_items[# infos.quant, i] = grid_items[# infos.quant, pos_select];
						grid_items[# infos.Sprite, i] = grid_items[# infos.Sprite, pos_select];
						
						grid_items[# infos.item, pos_select] = _item;
						grid_items[# infos.quant, pos_select] = _itemquant;
						grid_items[# infos.Sprite, pos_select] = _spr;
						
						item_select = -1;
						pos_select = -1;
						
					}
				}
			}
		}
		
		var _Sprite = grid_items[# infos.Sprite, i];
		if grid_items[# infos.item, i] != -1
		{
			draw_sprite_ext(_Sprite, grid_items[# 0, i], _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			draw_set_font(ft_menu_initial);
			draw_set_halign(fa_center);
			draw_text(_slotsx + tamanho_slots, _slotsy + tamanho_slots, grid_items[# infos.quant, i]);
			draw_set_font(-1);
			draw_set_halign(-1);
		}
		_ix++;
		if _ix >=slots_h
		{
			_ix = 0;
			_iy++;
		}
	}
	
	if item_select != -1
	{
		draw_sprite_ext(grid_items[# infos.Sprite, pos_select], item_select, _mx, _my, escala, escala, 0, c_white, 0.5);
	}
}