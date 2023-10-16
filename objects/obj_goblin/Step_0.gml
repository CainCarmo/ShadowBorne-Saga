 script_execute(estado);

if (vida<=0)
{
	//obj_player.xp += 50;
	instance_destroy();
}

// @Ground Collised Check
hadGroundCollised = place_meeting(obj_goblin.x, obj_goblin.y + 1, obj_colliders);

var speedLimitVertical = obj_goblin.vspd < obj_goblin.vspd_max * 2;
		
if (!obj_goblin.hadGroundCollised && speedLimitVertical)
	obj_goblin.vspd += GRAVITY * obj_goblin.bulk;
	
move_and_collide(hspd, vspd, obj_colliders);