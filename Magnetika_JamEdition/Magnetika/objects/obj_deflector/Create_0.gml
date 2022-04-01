event_inherited();
image_speed = 0;
deflector_direction = DEFLECTOR_DIR.LEFT_DOWN;
laser_dir = 0;

laser_offset = [];
laser_offset_right = [32,-12];
laser_offset_down = [15,-12];
laser_offset_left = [4,-12];
laser_offset_up = [15,-6];

switch_id = -1;

laser_offset_end = [];

laser_offset_right_end = [-12,-28];
laser_offset_down_end = [-1,-32];
laser_offset_left_end = [0,-28];//11 on 1st
laser_offset_up_end = [-1,-10];

beam_list = [];

laser_length = 0;
beam_on = true;
was_hit = false;
hit_object = -1;
shadow_on = true;

laser_color = 0;

/// @function get_max_beam_count();
/// @description returns the max number of laser segments to create
get_max_beam_count = function () {
	return (room_width / global.tile_width) + (room_height / global.tile_height);
}

max_beam_count = get_max_beam_count();

enum DEFLECTOR_DIR {
	LEFT_DOWN,
	LEFT_UP,
	RIGHT_UP,
	RIGHT_DOWN
}

for (var i = 0; i < max_beam_count; i++) {
	var beam = instance_create_layer(0, 0, "Event_Layer", obj_beam);
	array_push(beam_list, beam);
}

/// @function notify_picked_up();
notify_picked_up = function() {
	if (instance_exists(obj_beam)) {
		with (obj_beam) {
			laser_on = false;
		}
	}
	deflector_direction++;
	deflector_direction = deflector_direction mod 4;//ROTATE EACH TIME PICKED UP
	//show_debug_message("DEFLECTOR_DIRECTION:" + string(deflector_direction));
}

/// @function move(_dir);
move = function (_dir) {
	switch (_dir) {
		case TILE_DIRECTIONS.UP:
			_y -= global.tile_height;
		break;
		
		case TILE_DIRECTIONS.RIGHT:
			_x += global.tile_width;
		break;
		
		case TILE_DIRECTIONS.DOWN:
			_y += global.tile_height;
		break;
		
		case TILE_DIRECTIONS.LEFT:
			_x -= global.tile_width;
		break;
	}
	//clear piece from old position
	global.moveable_objects[current_tile_pos[0]][current_tile_pos[1]] = -1;
	global.deflector_objects[current_tile_pos[0]][current_tile_pos[1]] = -1;
	update_tile_position();
}

/// @function update_current_tile_position();
update_tile_position = function () {
	current_tile_pos[0] = floor(_x / global.tile_width);
	current_tile_pos[1] = floor(_y / global.tile_height);
	global.moveable_objects[current_tile_pos[0]][current_tile_pos[1]] = id;
	global.deflector_objects[current_tile_pos[0]][current_tile_pos[1]] = id;
}

/// @function do_laser_hit(_dir);
do_laser_hit = function (_laser_id, _dir) {
	laser_dir = _dir;
	switch_id = _laser_id;
	switch(_dir) {
		case LASER_DIRECTIONS.RIGHT:
			if (deflector_direction == DEFLECTOR_DIR.LEFT_DOWN) {
				calculate_laser(switch_id, LASER_DIRECTIONS.DOWN);
				was_hit = true;
			} else if (deflector_direction == DEFLECTOR_DIR.LEFT_UP) {
				calculate_laser(switch_id, LASER_DIRECTIONS.UP);
				was_hit = true;
			}
		break;
		case LASER_DIRECTIONS.DOWN:
			if (deflector_direction == DEFLECTOR_DIR.LEFT_UP) {
				calculate_laser(switch_id, LASER_DIRECTIONS.LEFT);
				was_hit = true;
			} else if (deflector_direction == DEFLECTOR_DIR.RIGHT_UP) {
				calculate_laser(switch_id, LASER_DIRECTIONS.RIGHT);
				was_hit = true;
			}
		
		break;
		case LASER_DIRECTIONS.LEFT:
			if (deflector_direction == DEFLECTOR_DIR.RIGHT_UP) {
				calculate_laser(switch_id, LASER_DIRECTIONS.UP);
				was_hit = true;
			} else if (deflector_direction == DEFLECTOR_DIR.RIGHT_DOWN) {
				calculate_laser(switch_id, LASER_DIRECTIONS.DOWN);
				was_hit = true;
			}
		
		break;
		case LASER_DIRECTIONS.UP:
			if (deflector_direction == DEFLECTOR_DIR.LEFT_DOWN) {
				calculate_laser(switch_id, LASER_DIRECTIONS.LEFT);
				was_hit = true;
			} else if (deflector_direction == DEFLECTOR_DIR.RIGHT_DOWN) {
				calculate_laser(switch_id, LASER_DIRECTIONS.RIGHT);
				was_hit = true;
			}
		
		break;
	}
	if (was_hit) {
		set_beams_on(true);
	}
}

/// @function set_all_beams_off
set_all_beams_off = function () {
	was_hit = false;
	beam_on = false;
	for (var i = 0; i < laser_length; i++) {
		var beam = beam_list[i];
		beam.laser_on = false;
		beam.laser_offset = laser_offset;
	}
	if (hit_object != -1) {
		hit_object.set_all_beams_off();
		hit_object = -1;
	}
}

/// @function set_beams_on(_on);
set_beams_on = function (_on) {
	for (var i = 0; i < max_beam_count; i++) {
		var beam = beam_list[i];
		beam.laser_on = false;
	}
	for (var i = 0; i < laser_length; i++) {
		var beam = beam_list[i];
		beam.shadow_on = shadow_on;
		beam.laser_color = laser_color;
		beam.laser_offset = laser_offset;
		beam.laser_on = _on;
		if (beam.laser_on) beam.shadow_on = shadow_on;
		if (i == laser_length -1) { //removed -1
			beam.laser_offset_end = laser_offset_end;	
		} else {
			beam.laser_offset_end = laser_offset;	
		}
	}
	if (_on) {
		beam_on = true;
		was_hit = false;
	}
}

/// @function set_beams_on(_on);
set_beams_color = function (_color) {
	laser_color = _color;
	for (var i = 0; i < laser_length; i++) {
		var beam = beam_list[i];
		beam.laser_color = laser_color;
	}
}

draw_inner_beam = function (on_left) {
	gpu_set_blendmode(bm_add);
	if (on_left) {
		draw_line_width_color(_x + 1, _y - 12,_x + 16, _y - 12, 2, laser_color, laser_color);
	} else {
		draw_line_width_color(_x + 32, _y - 12, _x + 14, _y -12, 2, laser_color, laser_color);
	}
	gpu_set_blendmode(bm_normal);
}
