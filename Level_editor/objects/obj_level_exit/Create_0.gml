event_inherited();


/// @function do_level_exit();
do_level_exit = function () {
	
	global.level_end_reached = true;
	
	var floor_arrays_container = get_floor_circular_arrays(current_tile_pos[0], current_tile_pos[1]);
	var drop_delay = 0;
	
	for (var i = 0; i < array_length(floor_arrays_container); i++) {
		
		var this_group = floor_arrays_container[i];
		
		for (var j = 0; j < array_length(this_group); j++) {
			var a_floor = this_group[j];
			
			a_floor.do_outro(drop_delay);
		}
		
		drop_delay += .2;
	}
	
	
	with (obj_scaffolding) {
		set_on(false);
	} 
	
	state = FLOOR_STATES.exit_platform_outro;
	
}
