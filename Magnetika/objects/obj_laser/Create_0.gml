event_inherited();
image_speed = 0;
image_index = 0;

time_on = .5 * room_speed;
time_off = .5 * room_speed;
timer = 0;

aim_direction = LASER_DIRECTIONS.RIGHT;
powered_on = true;
laser_on = false;

laser_state = LASER_STATES.powered_off;

laser_points = [0,0];
laser_length = 0;

max_beam_count = room_width / global.tile_width;

laser_offset = [];
laser_offset_right = [0,-12];
laser_offset_down = [15,0];
laser_offset_left = [32,-12];
laser_offset_up = [15,-6];

laser_offset_end = [];
laser_offset_right_end = [16,-12];
laser_offset_down_end = [15,-16];
laser_offset_left_end = [18,-12];
laser_offset_up_end = [15,-6];

beam_list = [];

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
	off,
	on,
}


get_laser_points = function () {
	laser_points = [];
	set_beams_on(false);
	var c_random = irandom_range(c_aqua, c_silver);
	set_beams_color(c_random);
	laser_length = 0;
	var blocked = false;
	var len = array_length(global.moveable_objects);
	var test_position = current_tile_pos;
	var offset = [0, 0];
	
	switch (aim_direction) {
		
		case LASER_DIRECTIONS.RIGHT:
			offset[0] = 1;
			laser_offset = laser_offset_right;
			laser_offset_end = laser_offset_right_end;
		break;
		case LASER_DIRECTIONS.DOWN:
			offset[1] = 1;
			laser_offset = laser_offset_down;
			laser_offset_end = laser_offset_down_end;
			
		break;
		case LASER_DIRECTIONS.LEFT:
			offset[0] = -1;
			laser_offset = laser_offset_left;
			laser_offset_end = laser_offset_left_end;
		break;
		case LASER_DIRECTIONS.UP:
			offset[1] = -1;
			laser_offset = laser_offset_up;
			laser_offset_end = laser_offset_up_end;
		break;
	}
	
	
	while(!blocked) {
		
		beam_list[laser_length].x1 = test_position[0] * global.tile_width;
		beam_list[laser_length].y1 = test_position[1] * global.tile_height;
		
		test_position[0] += offset[0];
		test_position[1] += offset[1];
		
		beam_list[laser_length].x2 = test_position[0] * global.tile_width;
		beam_list[laser_length].y2 = test_position[1] * global.tile_height;
		
		if (test_position[0] >= 0 && test_position[0] < room_width / global.tile_width && test_position[1] >= 0 && test_position[1] < room_height / global.tile_height) {
				for (var i = 0; i < len; i++) {
					var a_moveable = global.moveable_objects[i];
					if (a_moveable != -1) {
						if (a_moveable.current_tile_pos[0] == test_position[0] && a_moveable.current_tile_pos[1] == test_position[1]) {
							//test_position[0] += offset[0] * .25;
							//test_position[1] += offset[1] * .25;
							array_push(laser_points, [a_moveable.x, a_moveable.y]);
							laser_length++;
							blocked = true;
							show_debug_message("LASER BLOCKED");
							return;
						}
					}
				}
				//show_debug_message("LASER ADD POS:" + string(test_position[0]) + "," + string(test_position[1]));
				array_push(laser_points, [test_position[0], test_position[1]]);
				laser_length++;
				
			//TEST IF HIT GIRL
			if (obj_girl.current_tile_pos[0] == test_position[0] && obj_girl.current_tile_pos[1] == test_position[1]) {
				obj_girl.vaporize();
				show_debug_message("GIRL VAPORIZED");
			}
		} else {
			blocked = true;
		}
	}
	//var lp =  [laser_points[0], laser_points[laser_length -1]];
	//laser_points = lp;
	//laser_length = 2;
}

/// @function set_beams_on(_on);
set_beams_on = function (_on) {
	for (var i = 0; i < laser_length; i++) {
		var beam = beam_list[i];
		beam.laser_offset = laser_offset;
		beam.laser_on = _on;
		if (i == laser_length -1) {
			beam.laser_offset_end = laser_offset_end;	
		} else {
			beam.laser_offset_end = laser_offset;	
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