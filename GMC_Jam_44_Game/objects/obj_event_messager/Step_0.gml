
switch (message_state) {
	
	case message_states.entering:
		_timer ++;
		_max_time = (message_in_time * room_speed);
		_percent = (_timer / _max_time);
		//show_debug_message("percent:" + string(_percent));
		//pos_y = message_end_loc_y + (message_start_loc_y - message_end_loc_y) - ((message_start_loc_y - message_end_loc_y) * percent);
		pos_y = (_h * message_end_loc_y) + (_h * move_dist - (_h * move_dist) * _percent);
		if (_percent >= 1) {
			_timer = 0;
			message_state = message_states.displaying;
		}
	break;
	
	case message_states.displaying:
	
		_timer ++;
		_max_time = (message_duration * room_speed);
		_percent = (_timer / _max_time);
	
		if (_percent >= 1) {
			_timer = 0;
			message_state = message_states.exiting;
		}
	
	break;
	
	case message_states.exiting:
	
		_timer ++;
		_max_time = (message_out_time * room_speed);
		_percent = (_timer / _max_time);
		
		pos_y = (_h * message_start_loc_y) - (_h * move_dist - (_h * move_dist) * _percent);
	
		if (_percent >= 1) {
			var idx = ds_list_find_index(message_queue, current_message);
			ds_list_delete(message_queue, idx);
			
			if (ds_list_empty(message_queue)) {
				ds_list_destroy(message_queue);
				instance_destroy();	
			} else {
				current_message = ds_list_find_value(message_queue, 0);
				_timer = 0;
				message_state = message_states.entering;
			}
		}
	
	break;
}
