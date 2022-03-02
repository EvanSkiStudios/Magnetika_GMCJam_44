/// @description Insert description here
// You can write your code in this editor

message_queue = ds_list_create();
message_end_loc_x = .98;
message_end_loc_y = .94;
message_start_loc_y = 1;

_w = display_get_gui_width();
_h = display_get_gui_height();

move_dist = message_start_loc_y - message_end_loc_y;

message_duration = 2;

message_in_time = .25;
message_out_time = .25;

pos_y = message_end_loc_y;
pos_x = message_end_loc_x;

_max_time = 0;
_percent = 0;

_timer = 0;
current_message = "";

message_state = message_states.idle;

enum message_states {
	
	idle,
	entering,
	displaying,
	exiting,
}

/// @description shows the message
/// @function do_message(meg_string);
/// @param msg_string the message to show

do_message = function (msg_string) {
	
	var new_msg = false;
	
	if (ds_list_empty(message_queue)) {
			new_msg = true;
	}

	ds_list_add (message_queue, msg_string);
	
	if (new_msg) {
		_timer = 0;
		current_message = ds_list_find_value(message_queue, 0);
		//show_debug_message("do_message(" + current_message + ")");
		message_state = message_states.entering;
	}
}