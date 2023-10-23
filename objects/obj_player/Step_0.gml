event_inherited();

// @Movimentation
obj_player.speed_horizontal = (obj_player.right - obj_player.left) * obj_player.speed_horizontal_max;

DealDamage();
ListenerLevel();
new MachineState().Player();