function scp_colisao()
{
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

}
function scp_checar_player()
{
	if distance_to_object(ObjPlayer) <= dist_aggro
	{
		estado = scp_perseguindo;
	}
}
function Scp_Escolher_estado()
{
	scp_checar_player();
	proximo_estado = choose(Scp_andando, Scp_parado);
	
	if  proximo_estado == Scp_andando
	{
		estado = Scp_andando;
		dest_x = irandom_range(0,room_width);
	}
	else if proximo_estado == Scp_parado
	{
		estado = Scp_parado;
	}
}

function Scp_andando()
{
	scp_checar_player();
	if distance_to_point(dest_x, y) > spd
	{
		var _dir = point_direction(x, y, dest_x, y);
		hspd = lengthdir_x(spd, _dir);
		scp_colisao();
		image_xscale = sign(hspd);
		sprite_index = runSpriteGoblin;
	}
	else
	{
		x = dest_x;
		image_xscale = sign(hspd);
		sprite_index = runSpriteGoblin;
	}
}
function Scp_parado()
{
	scp_checar_player();
	sprite_index = IdleSpriteGoblin;
}

function scp_perseguindo()
{
	dest_x = ObjPlayer.x ;
	var _dir = point_direction(x, y, dest_x, y);
	hspd = lengthdir_x(spd_pers, _dir);
	image_xscale = sign(hspd);
	sprite_index = runSpriteGoblin;
	scp_colisao();
	if (objGoblin.x == ObjPlayer.x)
	{
		sprite_index = attackSpriteGoblin;
	}
	if distance_to_object(ObjPlayer) >= dist_desaggro
	{
		image_xscale = sign(hspd);
		estado = Scp_Escolher_estado;
		alarm[0] = irandom_range(120, 240);
	}
}