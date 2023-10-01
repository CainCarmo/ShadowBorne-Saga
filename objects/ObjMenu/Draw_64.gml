draw_set_font(ft_menu);

for (var i = 0; i < op_max; i++)
{
	if(index = i)
	{
		draw_set_color(c_yellow);
	}else
	{
		draw_set_color(c_white);
	}
	
	draw_text(30,30 +(30 * i), opcoes[i]);
}
draw_set_font(-1);
