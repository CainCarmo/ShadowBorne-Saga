// @Get All Objects Enemies in Room
enemies = []

for (var i = 0; i < instance_number(obj_enemy); ++i;)
{
    if (instance_find(obj_enemy, i).identity != Identity.Player && instance_find(obj_entity, i).identity != Identity.NPC)
		enemies[i] = instance_find(obj_enemy, i);
}

// @List Object Collised
collision_list = ds_list_create();
hitbox_list    = ds_list_create();

oCollised = undefined;

// @Controller
executed = false;

// 
randomize();