state = LEVEL_STATES.intro;
timer = 0;

time_to_scaffold_on = 1 * room_speed;
global.level_intro_done = false;
global.level_completed = false;

enum LEVEL_STATES {
	init,
	intro,
	floor_pieces_enter,
	playing,
	paused,
	outro,
	standby,
}

init_level();

init_level_create_bloom();
init_create_level_text_drawer();

