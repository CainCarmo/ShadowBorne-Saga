event_inherited();

hadGroundCollised = place_meeting(objectAtual.x, objectAtual.y + 1, obj_collider);

// @Apply Gravity
new Utils(objectAtual).ApplyGravity();

// @State Machine
new MachineState().Enimies(self);