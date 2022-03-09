event_inherited();
image_speed = 0;
image_index = 0;

time_on = .5 * room_speed;
time_off = .5 * room_speed;

switch_time = 0;
switch_delay = 0;

laser_calc_timer = 0;
laser_calc_time = .05 * room_speed;

aim_direction = LASER_DIRECTIONS.RIGHT;
powered_on = true;
laser_on = false;
shadow_on = true;
laser_state = LASER_STATES.powered_off;

laser_length = 0;

laser_offset = [];
laser_offset_right = [32,-12];
laser_offset_down = [15,0];
laser_offset_left = [0,-12];
laser_offset_up = [15,-6];

laser_offset_end = [];

laser_offset_right_end = [-12,-28];
laser_offset_down_end = [-1,-32];
laser_offset_left_end = [11,-28];
laser_offset_up_end = [-1,-10];

laser_color = irandom_range(c_aqua, c_silver);
turret_color = c_green;

beam_list = [];

switchable = false;
off_at_start = false;

hit_object = -1;

turret_heat = 0;

/// @function get_max_beam_count();
/// @description returns the max number of laser segments to create
get_max_beam_count = function () {
	if (room_width > room_height) {
		return room_width / global.tile_width;
	} 
	return room_height / global.tile_height;
}

max_beam_count = get_max_beam_count();

for (var i = 0; i < max_beam_count; i++) {
	var beam = instance_create_layer(0, 0, "Event_Layer", obj_beam);
	array_push(beam_list, beam);
}

enum LASER_DIRECTIONS {
	RIGHT,
	DOWN,
	LEFT,
	UP
}

enum LASER_STATES {
	powered_off,
	powered_on,
	powering_on,
	powering_off,
	off,
	on,
}

/// @function set_beams_on(_on);
set_beams_on = function (_on) {
	for (var i = 0; i < max_beam_count; i++) {
		var beam = beam_list[i];
		beam.laser_on = false;
	}
	for (var i = 0; i < laser_length; i++) {
		var beam = beam_list[i];
		beam.laser_color = laser_color;
		beam.laser_offset = laser_offset;
		beam.laser_on = _on;
		if (beam.laser_on) beam.shadow_on = shadow_on;
		if (i == laser_length -1) {//removed -1
			beam.laser_offset_end = laser_offset_end;	
		} else {
			beam.laser_offset_end = laser_offset;	
		}
	}
	if (!_on) {
		if (hit_object != -1) {
			hit_object.set_all_beams_off();
			hit_object = -1;
		}
	}
}

/// @function set_beams_on(_on);
set_beams_color = function (_color) {
	for (var i = 0; i < laser_length; i++) {
		var beam = beam_list[i];
		beam.laser_color = _color;
	}
}

/// @function power_on();
power_on = function () {
	laser_state = LASER_STATES.powered_on;
}

/// @function power_off();
power_off = function () {
	laser_state = LASER_STATES.powered_off;
}

activate = function (_delay) {
	switch_activated = true;
	switch_delay = _delay * room_speed;
	switch_timer = 0;
	laser_state = LASER_STATES.powering_on;
}

/// @function switch_deactivate();
deactivate = function (_delay) {
	switch_activated = false;
	switch_delay = _delay * room_speed;
	switch_timer = 0;
	laser_state = LASER_STATES.powering_off;
}

/// @function kill_turret();
kill_turret = function () {
	set_beams_on(false);
	global.laser_objects[current_tile_pos[0]][current_tile_pos[1]] = -1;
	with (obj_floor_switch) {
		var len = array_length(switchables) - 1;
		for (var i = 0; i < len; i++) {
			var laser = switchables[i];
			if (laser == other.id) {
				array_delete(switchables, i, 1);	
			}
		}
	}
	laser_on = false;
	show_debug_message("TURRET DESTROYED");
	var explo = instance_create_layer(x, y, "Event_Layer", obj_explosion);
	explo.depth = depth;
	stop_laser_sound();
	instance_destroy();
}

/// @function stop_laser_sound();
stop_laser_sound = function () {
	var all_lasers_off = true;
		if (obj_laser.laser_on) {
				all_lasers_off = false;	
		}
		if (all_lasers_off) {
			global.playing_laser_hum = false;
			audio_stop_sound(snd_laser_loop);	
		}
			audio_play_sound(snd_laser_off, 1, false);	
}

/// @function draw_turret_color();
draw_turret_color = function () {
	draw_sprite_ext(spr_laser_color, image_index, x, y, 1, 1, 0, turret_color, 1);	
}