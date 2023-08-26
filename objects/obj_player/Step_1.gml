var _left  = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _jump  = keyboard_check_pressed(vk_space);

var _attack = mouse_check_button(mb_left);
var _ground = place_meeting(x, y + 1, obj_block_player_collider);
	
if (!_ground) {
	if (speed_vertical < speed_vertical_max * 2)
		speed_vertical += GRAVIDADE * bulk;
}

speed_horizontal = (_right - _left) * speed_horizontal_max;

stateMachine(obj_player, _right, _left, _jump, _ground);