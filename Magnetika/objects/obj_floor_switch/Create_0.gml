event_inherited();

switch_id = 0;
floor_entry_delay = 0;
floor_num = -1;
is_toggle = false;
is_pressure = false;
pressure_applied = false;

image_speed = 0;
image_index = 0;

switch_activated = false;

floors = [];

/// @function get_switch_at(_tile_x, _tile_y);
get_switch_at = function (_tile_x, _tile_y) {
	if (current_tile_pos[0] == _tile_x && current_tile_pos[1] == _tile_y) {
		return true;	
	}
	return false;
}

/// @function girl_standing();
girl_standing = function () {
	return obj_girl.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_tile_pos[1] == current_tile_pos[1];
}

/// @function pressed_by_moveable();
pressed_by_moveable = function () {
	var pressed = false;
	var len = array_length(global.moveable_objects);
	for (var i = 0; i < len; i++) {
		var b = global.moveable_objects[i];
		show_debug_message("MOVEABLE OBJECT COUNT:" + string(len));
		show_debug_message("SWITCH POSITION:" + string(current_tile_pos[0]) + "," + string(current_tile_pos[1]));
		show_debug_message("MOVEABLE " + string(i) + " POSITION:" + string(b.current_tile_pos[0]) + "," + string(b.current_tile_pos[1]));
		
		if (b.current_tile_pos[0] == current_tile_pos[0] && b.current_tile_pos[1] == current_tile_pos[1]) {
			if (obj_girl.current_moveable_piece != -1 && obj_girl.current_moveable_piece.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_moveable_piece.current_tile_pos[1] == current_tile_pos[1]) {
				if (!obj_girl.current_moveable_piece.floating) {
					return true;	
				}
			} else {
				show_debug_message("MOVEABLE OBJECT COUNT:" + string(len));
				show_debug_message("SWITCH POSITION:" + string(current_tile_pos[0]) + "," + string(current_tile_pos[1]));
				return true;
			}
		}
	}
	return pressed;
}

/// @function floors_ready();;
floors_ready = function() {
	var all_ready = true;
	var len = array_length(floors);
	for (var i = 0; i < len; i++) {
		var a_floor = floors[i];
		if (!a_floor.movement_complete) {
			all_ready = false;	
		}
	}
	if (all_ready == true) {
		//show_debug_message("SWITCH ALL FLOORS READY!");	
	}
	return all_ready;
}

/// @function activate_switch();
activate_switch = function () {
	if (!switch_activated) {
		//show_debug_message("SWITCH ACTIVATED!");
		image_index = 1;
		switch_activated = true;
		toggle_floors(floor_list, floor_entry_delay);
	}
}



function toggle_floors (floor_list, _delay) {
		var this_delay = 0;
		for (var i = 0; i < array_length(floors); i++) {
			var a_floor = floors[i];
			if (a_floor.state == FLOOR_STATES.idle) {
				a_floor.deactivate(this_delay);
			} else {
				a_floor.do_intro(this_delay);
			}
		this_delay += _delay;
		}
}

///@function init_floors
init_floors = function () {
	show_debug_message("INIT_FLOORS()");
	for (var i = 0; i < array_length(floor_list); i++) {
		with (obj_icon_hidden_floor) {
			var _tile_x = x / global.tile_width;
			var _tile_y = y / global.tile_height;
			
			if (floor_id == other.floor_list[i]) {
				other.insert_floor(get_floor_at(_tile_x, _tile_y));
			}
		}
	}
}

insert_floor = function (_floor) {
	show_debug_message("INSERTING FLOOR: " + string(_floor.floor_id))
	array_push(floors, _floor);	
}
