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
switch_was_activated = false;

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
	
	if (instance_exists(obj_moveable)){
		if (obj_moveable.current_tile_pos[0] == current_tile_pos[0] && obj_moveable.current_tile_pos[1] == current_tile_pos[1]){
		
			if (obj_girl.current_moveable_piece != -1) {
			
				var p = obj_girl.current_moveable_piece;
			
				if (p.floating) {
				
				} else {
					pressed = true;	
				}
		
			} else {
				pressed = true;	
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



/*
function spawn_floor_list (floor_list, _delay) {
	
	if (!instance_exists(obj_icon_hidden_floor)) return;
	
	var this_delay = 0;
	
	var hidden_floor_icons = [];
		
	for (var k = 0; k < instance_number(obj_icon_hidden_floor); k++){
		hidden_floor_icons[k] = instance_find(obj_icon_hidden_floor,k);
	}
		
	for (var i = 0; i < array_length(floor_list); i++) {
		//show_debug_message("PROCESSING FLOOR ICON:" + string(i));
		floor_num = floor_list[i];
		
		for (var j = 0; j < array_length(hidden_floor_icons); j++) {
			
			var a_floor_icon = hidden_floor_icons[j];
			
			if (a_floor_icon.floor_id == floor_num) {

				//show_debug_message("FLOOR ID:" + string(a_floor_icon.floor_id) + string("tile_x:" + string(a_floor_icon.x / global.tile_width) + "tile_y:" + string(a_floor_icon.y / global.tile_height)));
				global.this_floor = get_floor_at(a_floor_icon.x / global.tile_width, a_floor_icon.y / global.tile_height);
				if (global.this_floor != -1) {
					if (global.this_floor.state == FLOOR_STATES.idle) {
						global.this_floor.deactivate(this_delay);
					} else {
						global.this_floor.do_intro(this_delay);
					}
				}
				
				this_delay += _delay;
				//show_debug_message("SPAWNING NEW FLOORS:" + string(this_delay));
				continue;
			}
		}
	 }
}

*/

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
