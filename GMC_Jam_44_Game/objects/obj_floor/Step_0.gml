depth = -_y;

switch (state) {
	
	case FLOOR_STATES.idle:
		
		y = lerp(y, _y, .1);
		dip_current =  _y - y;
	
	break;
	
	case FLOOR_STATES.standing:
		
		y = lerp(y, _y + dip_height, .1);
		
		dip_current =  (_y - y);
		
		if (instance_exists(obj_girl)) {
			if (obj_girl.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_tile_pos[1] == current_tile_pos[1]) {
				state = FLOOR_STATES.idle;	
			}
		}
		
	break;
	
	case FLOOR_STATES.intro:
	
	x = _x;
	y = lerp(y, _y, .1);
	
	if (y <= _y + 1) {
		y = _y;
		state = FLOOR_STATES.idle;
		
		var alldone = true;
		with (obj_floor) {
			if (state == FLOOR_STATES.intro || state == FLOOR_STATES.init) {
				alldone = false;	
			}
		}
		if (alldone) {
			notify_room_intro_complete();	
		}
		
	}
	
	break;
	
	case FLOOR_STATES.exit_platform_outro:
	
		y = y - outro_platform_rise_speed;
		outro_platform_rise_speed += outro_platform_rise_accel;
		
		if (y <= -50) {
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
			y = room_height + sprite_height;
			
			state = FLOOR_STATES.level_complete;
		
			var alldone = true;
			with (obj_floor) {
				if (state != FLOOR_STATES.level_complete) {
					alldone = false;	
				}
			}
			if (alldone) {
				notify_room_outro_complete();	
			}
		
		}

	
	break;
	
	case FLOOR_STATES.init:
		
		x = _x;
		y = _y + intro_height;
		
		update_tile_position();
		
		timer ++;
		if (timer >= delay) {
			timer = 0;
			state = FLOOR_STATES.intro;
		}
		
		
	
	break;
}
