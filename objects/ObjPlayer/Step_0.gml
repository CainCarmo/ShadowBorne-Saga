#region Controles
key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A"))
key_jump = keyboard_check(vk_space)
key_shoot = mouse_check_button_pressed(mb_left) //keyboard_check_pressed(ord("X"))
key_Run = keyboard_check(vk_shift)

#endregion 
#region movimentação
	scp_player_andando();
	#region movi-antigo
	/*var move = key_right - key_left

	hspd = move * spd;
	vspd = vspd + grv;

	if (hspd != 0)            
	{
	
		image_xscale = sign(hspd);
	}



	//colisão horizontal
	if place_meeting(x+hspd, y, colisor)
	{
		while (!place_meeting(x+sign(hspd),y,colisor))
		{
			x = x+sign(hspd);
		}
		hspd = 0;
	}
	x = x +hspd;
	//colisão vertical
	if place_meeting(x, y+vspd, colisor)
	{
		while (!place_meeting(x,y+sign(vspd),colisor))
		{
			y = y+sign(vspd);
		}
		vspd = 0;
	}
	y = y +vspd;

	//jump

	if place_meeting(x,y+1,colisor) and key_jump
	{
		vspd-=5;
	
	}*/
	#endregion
#endregion
#region tiro
	scp_player_tiro();
	#region tiro-antigo
	/*var flipped = direction;
	var mag_x = (x+4) * (flipped)
	var _xx = x + lengthdir_x(15, image_angle)
	var y_offset = lengthdir_y(-20, image_angle)

	if key_shoot and global.mana_max > 0
	{
	
		with (instance_create_layer(_xx,y,"tiro",ObjTiro))
		{
	
		  global.mana_max = global.mana_max - 10;
		  speed = 5;
		  direction = point_direction(x,y,window_mouse_get_x(),window_mouse_get_y());
		  image_angle = direction;
	  
		}
	}
	if (global.mana_max <300)
	{
		global.mana_max ++;
	}*/
	#endregion
#endregion
#region troca de sprite
	scp_player_troca_sprite();
	#region troca-antiga
	/*
	if(!place_meeting(x, y+1,colisor))
	{
		image_index = 0;
		sprite_index = jumpSpriteMage;

	}
	else
	{
		if (hspd != 0)
		{
			sprite_index = walkSpriteMage;
		}
	}
	if hspd = 0
	{
		if place_meeting(x,y+1,colisor)
		{
			sprite_index = idleSpriteMage;
		}
	}
	if hspd != 0
	{
		if place_meeting(x, y+1, colisor)
		{
			sprite_index = walkSpriteMage;
		}
	}
	if place_meeting(x,y+1,colisor) and key_Run and hspd != 0
	{
		spd = 10;
		sprite_index = runSpriteMage;
	}
	else
	{
		spd = 5;
	}*/
	#endregion
#endregion
#region dialogo
 scp_player_dialogo();
 
#endregion