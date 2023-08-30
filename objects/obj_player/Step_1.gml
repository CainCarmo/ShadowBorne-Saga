left  = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
jump  = keyboard_check_pressed(vk_space);

attack = mouse_check_button(mb_left);
groundCollided = place_meeting(x, y + 1, obj_block_player_collider);

if (!groundCollided) {
	if (speed_vertical < speed_vertical_max * 2)
		speed_vertical += GRAVITY * bulk;
}

speed_horizontal = (right - left) * speed_horizontal_max;

stateMachine(obj_player);