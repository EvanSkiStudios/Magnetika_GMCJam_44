event_inherited();
switch_color = c_gray;
switch_type = LASER_SWITCH_TYPES.PRESSURE;
laser_hitting = false;
laser_key_id = -1;
image_speed = 0;
image_index = 0;

switch_activated = false;

switch_delay = 0;
switchables_list = [];
switchables = [];
current_switch_id = -1;
laser_color = c_gray;

from_left = false;
from_right = false;

enum LASER_SWITCH_TYPES {
	ONE_SHOT,
	PRESSURE,
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
			show_debug_message("SWITCH ACTIVATED!");
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
			show_debug_message("SWITCH DEACTIVATED!");
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

set_all_beams_off = function () {
	//LASER HAS TURNED OFF
	laser_hitting = false;
	from_left = false;
	from_right = false;
}

do_laser_hit = function (_switch_id) {
	if (laser_key_id == -1) {
		laser_hitting = true;	
	} else {
		if (_switch_id == laser_key_id) {
			laser_hitting = true;	
		}
	}
}

draw_inner_beam = function (on_left) {
	gpu_set_blendmode(bm_add);
	if (on_left) {
		draw_line_width_color(_x + 1, _y - 12,_x + 8, _y - 12, 2, laser_color, laser_color);
	}
	if (!on_left) {
		draw_line_width_color(_x + 32, _y - 12, _x + 20, _y -12, 2, laser_color, laser_color);
	}
	gpu_set_blendmode(bm_normal);
}