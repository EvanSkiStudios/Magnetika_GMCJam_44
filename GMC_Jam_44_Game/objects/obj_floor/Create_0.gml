dip_height = 3;
intro_height = 1000;
timer = 0;
delay = 0;

_x = 0;
_y = 0;

state = FLOOR_STATES.init;

enum FLOOR_STATES {
	idle,
	standing,
	intro,
	outro,
	init,
}

function set_delay (_delay) {
	delay = _delay * room_speed;	
}

show_debug_message("A floor is created.");
