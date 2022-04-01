event_inherited();
drop_delay = 0;

instance_create_layer(x, -1000, "Event_Layer", obj_exit_light_bkg);
instance_create_layer(x, -1000, "Event_Layer", obj_exit_light_fg);

/// @function do_level_exit();
do_level_exit = function () {
	
	global.level_end_reached = true;
	
	for (var i = 0; i < array_length(global.laser_objects); i++) {
		for (var j = 0; j < array_length(global.laser_objects[i]); j++) {
			var laser = global.laser_objects[i][j];
			if (laser != -1) {
				laser.laser_state = LASER_STATES.powered_off;
			}
		}
	}
	
	var floor_arrays_container = get_floor_circular_arrays(current_tile_pos[0], current_tile_pos[1]);
	
	for (var i = 0; i < array_length(floor_arrays_container); i++) {
		
		var this_group = floor_arrays_container[i];
		
		for (var j = 0; j < array_length(this_group); j++) {
			var a_floor = this_group[j];
			with (a_floor) {
				do_outro(other.drop_delay);
			}
		}
		
		drop_delay += .05;
	}
	
	with (obj_scaffolding) {
		set_on(false);
	} 
	
	with (obj_level_main) {
		state = LEVEL_STATES.outro;	
	}
	
	state = FLOOR_STATES.exit_platform_outro;
	
}
