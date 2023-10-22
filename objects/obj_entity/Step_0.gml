if (obj_room.state != EnvironmentState.Normal) exit;

// @Ground Collised Check
hadGroundCollised = place_meeting(objectAtual.x, objectAtual.y + 1, obj_collider);

// @Apply Gravity
new Utils(objectAtual).ApplyGravity();