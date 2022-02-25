state = LEVEL_STATES.intro;
timer = 0;

time_to_scaffold_on = 1 * room_speed;
global.room_complete = false;
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


