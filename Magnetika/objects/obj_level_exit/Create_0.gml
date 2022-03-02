event_inherited();
drop_delay = 0;

/// @function do_level_exit();
do_level_exit = function () {
	gml_pragma("forceinline");
	global.level_end_reached = true;
	
//causes glevel end stutter and crash on YYC
	var floor_arrays_container = get_floor_circular_arrays(current_tile_pos[0], current_tile_pos[1]);
	
	var _array_len = array_length(floor_arrays_container);
	for (var i = 0; i < _array_len; ++i) {
		
		var this_group = floor_arrays_container[i];
		
		var _array_len_tg = array_length(this_group);
		for (var j = 0; j < _array_len_tg; ++j) {
			var a_floor = this_group[j];
			with (a_floor) {
				do_outro(other.drop_delay);
			}
		}
		
		drop_delay += .2;
	}
	
	var _array_len = array_length(global.laser_objects);
	for (var i = 0; i < _array_len; ++i) {
		var l = global.laser_objects[i];
		l.laser_state = LASER_STATES.powered_off;
	}
	
	with (obj_scaffolding) {
		set_on(false);
	} 
	
	with (obj_level_main) {
		fhAudioSoundPlay(SND_LEVEL_OUT);
		state = LEVEL_STATES.outro;	
	}
	
	state = FLOOR_STATES.exit_platform_outro;
	
}
