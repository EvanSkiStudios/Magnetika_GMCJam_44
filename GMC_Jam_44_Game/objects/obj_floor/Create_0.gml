dip_height = 2;
dip_current = 0;
hover_dist = 0;
timer = 0;
delay = 1 * room_speed;

fall_speed = 0;
fall_accel = 0.25;

outro_drop_speed = 0;
outro_drop_accel = 0.1;

outro_platform_rise_speed = 0;
outro_platform_rise_accel = 0.02;

did_outro = false;
did_intro = false;
in_waiting = true;

current_tile_pos = [0,0];

_x = 0;
_y = 0;

image_speed = 0;

enum FLOOR_STATES {
	idle,
	intro,
	exit_platform_outro,
	outro_init,
	outro,
	init,
	level_complete,
	deactivate_init,
	deactivated,
	standby,
}

state = FLOOR_STATES.standby;

update_tile_position = function () {
	current_tile_pos[0] = floor(_x / global.tile_width);
	current_tile_pos[1] = floor(_y / global.tile_height);
}

/// @function set_delay(_delay);
set_delay = function (_delay) {
	//show_debug_message ("set_delay:" + string(_delay));
	delay = _delay * room_speed;	
	if (current_tile_pos[0] == 8 && current_tile_pos[1] == 10) {
		//show_debug_message("floor:" + string(id) + "set_delay(), timer:" + string(timer) + ", delay:" + string(delay));
	}
}

/// @function get_floor_at(_tile_x, _tile_y);
get_floor_at = function (_tile_x, _tile_y) {
	if (current_tile_pos[0] == _tile_x && current_tile_pos[1] == _tile_y) {
		return self;	
	}
	return -1;
}

/// @function do_intro(_delay);
do_intro = function (_delay) {
	if (!did_intro) {
		did_intro = true;
		in_waiting = false;
		set_delay(_delay);
		state = FLOOR_STATES.init;
	}
}

/// @function do_outro(_delay);
do_outro = function (_delay) {
	if (!did_outro) {
		did_outro = true;
		set_delay(_delay);
		state = FLOOR_STATES.outro_init;
	}
}

///@function deactivate();
deactivate = function (_delay) {
	fall_speed = 0;
	did_intro = false;
	set_delay(_delay);
	//tilemap_set(global.map_id, TILE_DATA.none, current_tile_pos[0], current_tile_pos[1]);
	state = FLOOR_STATES.deactivate_init;
}

//show_debug_message("A floor is created.");
