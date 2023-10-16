if (experience_point >= experience_point_limit) {
	experience_level++;
	
	if (experience_level >= 1 && experience_level <= 9) {
		experience_point_limit = 150;
		experience_point = 0;
	}
	if (experience_level >= 10 && experience_level <= 19) {
		experience_point_limit = 300;
		experience_point = 0;
	}
	if (experience_level >= 20 && experience_level <= 29) {
		experience_point_limit = 500;
		experience_point = 0;
	}
	if (experience_level >= 30 && experience_level <= 39) {
		experience_point_limit = 1000;
		experience_point = 0;
	}
	if (experience_level >= 40 && experience_level <= 49) {
		experience_point_limit = 1500;
		experience_point = 0;
	}
	if (experience_level >= 50 && experience_level <= 59) {
		experience_point_limit = 2500;
		experience_point = 0;
	}
}

if (keyboard_check(vk_enter)) {
	experience_point += 10;
}