function scp_player_andando(){
	#region movimentação
		var move = key_right - key_left

		hspd = move * spd;
		vspd = vspd + grv;

		if (hspd != 0)            
		{
	
			image_xscale = sign(hspd);
		}


		
		
		//colisão horizontal
		chao = place_meeting(x+hspd, y, colisor);
		if chao == true
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
		
		if (place_meeting(x+sign(hspd), y, ESCADA))
		{
			if (place_meeting(x+sign(hspd), y-1, ESCADA))
			{
				y--;
			}
		}
		
		//jump

		if place_meeting(x,y+1,colisor) and key_jump
		{
			vspd-=5;
	
		}
		if (alarm[2] > 0)
		{
			if image_alpha >= 1
			{
				alfa_hit = -0.05;
				
			}else if image_alpha <= 0
			{
				alfa_hit = 0.05;
			}
			image_alpha += alfa_hit;
		}else
		{
			image_alpha = 1;
		}
	#endregion
}
function scp_player_troca_sprite()
{
	#region troca de sprite
	
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
		}
		
	#endregion
}
function scp_player_tiro()
{
	#region tiro
	var flipped = direction;
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
	}
	#endregion
}
function scp_player_atacando()
{
	
}
function scp_player_dialogo()
{
	if distance_to_object(Obj_par_npc) <= 10
	{
		
		if keyboard_check_pressed(ord("F"))
		{
			var _npc = instance_nearest(x, y, Obj_par_npc);
			var _dialogo = instance_create_layer(x, y, "dialogo", Obj_dialogo);
			_dialogo.npc_nome = _npc.nome;
		}
	}
	
}