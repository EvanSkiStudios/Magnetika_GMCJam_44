event_inherited();
depth = -_y;

switch (state) {
	
	case FLOOR_STATES.standby:
	
	break;
	
	case FLOOR_STATES.idle:
		
		x = lerp(x, _x, .1);
		true_y = lerp(true_y, _y, .1);
		y = lerp(y, _y - hover_dist + dip_current, .1);
		
		//for gun energy
		var x_dif = abs(x - _x);
		var y_dif = abs(y - (_y - hover_dist + dip_current));
		if (x_dif <= 4 && y_dif <= 4) {
			travel_complete = true;
		} else {
			travel_complete = false;	
		}
		
		if (instance_exists(obj_girl)) {
			if (obj_girl.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_tile_pos[1] == current_tile_pos[1]) {
				dip_current = dip_height;
			} else {
				dip_current = 0;
			}
		}
	
	break;
	
	case FLOOR_STATES.intro:
	x = _x;
	y = lerp(y, _y, .2);
	
	if (y <= _y + 1) {
		movement_complete = true;
		switch_completed = true;
		y = _y;
		//show_debug_message("floor:" + string(id) + ",x:" + string(_x) + ", y:" + string(_y) + ", timer:" + string(timer) + ", delay:" + string(delay));
		if (switch_id == 14) {
			show_debug_message("PAT WAS HERE");	
		}
		state = FLOOR_STATES.idle;
		tilemap_set(global.map_id, TILE_DATA.floor, current_tile_pos[0], current_tile_pos[1]);
	
	}
	
	break;
	
	case FLOOR_STATES.exit_platform_outro:
	
		y = y - outro_platform_rise_speed;
		outro_platform_rise_speed += outro_platform_rise_accel;
		
		if (y <= -50) {
			movement_complete = true;
			state = FLOOR_STATES.level_complete;
		}
		
		
	break;
	
	case FLOOR_STATES.outro_init:
	
		timer ++;
		if (timer >= delay) {
			timer = 0;
			state = FLOOR_STATES.outro;
		}
		
	break;
	
	case FLOOR_STATES.outro:

		y = y + outro_drop_speed;
		outro_drop_speed += outro_drop_accel;
	
		if (y > room_height) {
			movement_complete = true;
			y = room_height + sprite_height;
			state = FLOOR_STATES.level_complete;
		}
		
	break;
	
	case FLOOR_STATES.init:
		
		x = _x;
		y = _y + room_height;
		
		timer ++;
		if (timer >= delay) {
			timer = 0;
			state = FLOOR_STATES.intro;
		}
		
	break;
	
	case FLOOR_STATES.deactivate_init:
		timer ++;
		if (timer >= delay) {
			tilemap_set(global.map_id, TILE_DATA.none, current_tile_pos[0], current_tile_pos[1]);
			timer = 0;
			state = FLOOR_STATES.deactivated;
		}
	break;
	
	case FLOOR_STATES.deactivated:
		x = _x;
		if (y <= room_height) {
			fall_speed += fall_accel;
			y += fall_speed;
		} else {
			movement_complete = true;
			switch_completed = true;
			state = FLOOR_STATES.standby;	
		}
		
	break;
}
