event_inherited();

switch_delay = 0;
switch_type = SWITCH_TYPES.ONE_SHOT;

image_speed = 0;
image_index = 0;

switch_activated = false;

switchables_list = [];
switchables = [];
current_switch_id = -1;
switch_color = c_green;

interval_timer = 0;
interval_time_on = 3 * room_speed;
interval_time_off = 3 * room_speed;

button_invisible = false;

enum SWITCH_TYPES {
	TOGGLE,
	PRESSURE,
	ONE_SHOT,
	INTERVAL
}

/// @function is_switch_at(_tile_x, _tile_y);
is_switch_at = function (_tile_x, _tile_y) {
	return current_tile_pos[0] == _tile_x && current_tile_pos[1] == _tile_y;
}

/// @function girl_standing();
girl_standing = function () {
	return obj_girl.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_tile_pos[1] == current_tile_pos[1];
}

/// @function pressed_by_moveable();
pressed_by_moveable = function () {
	var b = global.moveable_objects[current_tile_pos[0], current_tile_pos[1]];
	if (b != -1) {
		if (!b.floating) {
			return true;	
		}
	}
	return false;
}

/// @function switchables_ready();;
switchables_ready = function() {
	var all_ready = true;
	var len = array_length(switchables);
	for (var i = 0; i < len; i++) {
		var a_switchable = switchables[i];
		if (!a_switchable.switch_completed) {
			all_ready = false;	
		}
	}
	if (all_ready == true) {
		//show_debug_message("SWITCH ALL SWITCHABLES READY!");	
	}
	return all_ready;
}

/// @function activate_switch();
activate_switch = function () {
	if (!switch_activated) {
		if (switchables_ready()) {
			//show_debug_message("SWITCH ACTIVATED!");
			image_index = 1;
			switch_activated = true;
			toggle_switches();
		}
	}
}


/// @function deactivate_switch();
deactivate_switch = function() {
	if (switch_activated) {
		if (switchables_ready()) {
			//show_debug_message("SWITCH DEACTIVATED!");
			image_index = 0;
			switch_activated = false;
			toggle_switches();
		}
	}
}

function toggle_switches () {
		var this_delay = 0;
		for (var i = 0; i < array_length(switchables); i++) {
			var a_switchable = switchables[i];
			if (a_switchable.switch_activated) {
				a_switchable.deactivate(this_delay);
			} else {
				a_switchable.activate(this_delay);
			}
			
		this_delay += switch_delay;
	}
}


///@function init_switchables
init_switchables = function () {
	show_debug_message("init_switchables()");
	var len = array_length(switchables_list);
	for (var i = 0; i < len; i++) {
		current_switch_id = switchables_list[i];
		with (obj_switchable) {
			if (switch_id == other.current_switch_id) {
				other.insert_switchable(id);	
			}
		}
	}
}


insert_switchable = function (_switchable) {
	show_debug_message("INSERTING SWITCHABLE: " + string(_switchable.switch_id))
	array_push(switchables, _switchable);	
}

