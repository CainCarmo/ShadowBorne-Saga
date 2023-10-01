if inicializar == false
{
	scr_Textos();
 	inicializar = true;
}
if mouse_check_button_pressed(mb_left)
{
	if pagina < array_length(texto) -1
	{
		pagina++;
	}else
	{
		if op_num != 0
		{
			op_draw = true;
		}else{
		instance_destroy();
		}
	}
} 