// @Ground Collised Check
hadGroundCollised = place_meeting(obj_player.x, obj_player.y + 1, obj_colliders);

// @Apply Gravity
new Utils(obj_player).ApplyGravity();

// @Movimentation
obj_player.speed_horizontal = (obj_player.right - obj_player.left) * obj_player.speed_horizontal_max;

// @State Check
new MachineState().Player();