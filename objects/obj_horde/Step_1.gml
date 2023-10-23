if (!started) return;

if (steps == 1) {
	if (completed) {
		
		steps++;
		completed = false;
	}
	else {
		if (!spawned) {
			new Utils(self).SetTimer(2);
			
			if (timer == 0) {
				for (var i = 0; i <= limit[steps - 1] - 1; i++)
					instance_create_layer(x + (150 * i), y, "Enemies", obj_slime);
					
				timer   = -1;
				spawned = true;
			}
		}
		else {
			enemiesDied = limit[steps - 1] - instance_number(obj_enemy);
				
			porcentageAtual = ceil((enemiesDied / limit[steps - 1]) * 100);
				
			if (porcentageAtual == 100) { 
				timer     = -1;
				completed = true;
				spawned   = false;
			}
		}
	}
}
else if (steps == 2 && !nextRoom) {
	if (completed) {
		
		completed = false;
		nextRoom  = true;
	}
	else {
		if (!spawned) {
			new Utils(self).SetTimer(2);
			
			if (timer == 0) {
				for (var i = 0; i <= limit[steps - 1] - 1; i++)
					instance_create_layer(x + (150 * i), y, "Enemies", obj_gobin);
					
				timer   = -1;
				spawned = true;
			}
		}
		else {
			enemiesDied = limit[steps - 1] - instance_number(obj_enemy);
				
			porcentageAtual = ceil((enemiesDied / limit[steps - 1]) * 100);
				
			if (porcentageAtual == 100) { 
				timer     = -1;
				completed = true;
				spawned   = false;
			}
		}
	}
}

if (steps == stepsAll && nextRoom) {
	new Utils(self).SetTimer(5);
	
	if (timer == 0) {
		room_goto(rm_arena);
	}
}