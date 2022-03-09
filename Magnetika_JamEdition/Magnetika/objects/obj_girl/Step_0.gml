depth = -_y;

//TEST ONLY
if (keyboard_check_pressed( ord("R"))) {
	//room_restart();	
}

obj_gun.sprite_index = gun_sprite;
obj_gun.image_xscale = image_xscale;

switch (state) {
	
	case GIRL_STATES.idle:
		
		dip_current = 0;
		
		if (check_for_no_floor()) {
			return;	
		}
		
		get_potential_piece(facing_dir);
		
		get_input();
		
		with (obj_floor) {
			//show_debug_message("TILE POS:" + string(current_tile_pos[0]) + "," + string(current_tile_pos[1]));
			if (obj_girl.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_tile_pos[1] == current_tile_pos[1]) {
				obj_girl.dip_current = dip_current;
			}
		}
		
		if (left && check_tile(TILE_DIRECTIONS.LEFT)) {
			run (TILE_DIRECTIONS.LEFT);
			state = GIRL_STATES.running;
			return;
		} else if (right && check_tile(TILE_DIRECTIONS.RIGHT)) {
			run (TILE_DIRECTIONS.RIGHT);
			state = GIRL_STATES.running;
			return;
		}
		if (up && check_tile(TILE_DIRECTIONS.UP)) {
			run(TILE_DIRECTIONS.UP);
			state = GIRL_STATES.running;
			return;
		} else if (down && check_tile(TILE_DIRECTIONS.DOWN)) {
			run(TILE_DIRECTIONS.DOWN);
			state = GIRL_STATES.running;
			return;
		}
		
		if (fire_pressed) {
			gun_sprite = gun_neutral_sprite;
			shoot_gun(facing_dir);
		}
		
		sprite_index = stand_sprite;
		
	break;
	
	case GIRL_STATES.running:
		
		if (check_for_no_floor()) {
			return;	
		}
		
		get_potential_piece(facing_dir);
		
		get_input();
		
		update_tile_position();
	
		if (left && check_tile(TILE_DIRECTIONS.LEFT)) {
			run (TILE_DIRECTIONS.LEFT);
			return;
		} else if (right && check_tile(TILE_DIRECTIONS.RIGHT)) {
			run (TILE_DIRECTIONS.RIGHT);
			return;
		}
		if (up && check_tile(TILE_DIRECTIONS.UP)) {
			run(TILE_DIRECTIONS.UP);
			return;
		} else if (down && check_tile(TILE_DIRECTIONS.DOWN)) {
			run(TILE_DIRECTIONS.DOWN);
			return;
		}
		
		state = GIRL_STATES.idle;
		
	break;
	
	case GIRL_STATES.activated_gun:
		
		if (check_for_no_floor()) {
			
			if (current_moveable_piece != -1) {
				deactivate_gun();
			}
			
			return;	
		}
		
		get_input();
	
		control_moveable_piece();
		
		if (fire_pressed) {
			deactivate_gun();
			state = GIRL_STATES.idle;
		}
		
	break;
	
	case GIRL_STATES.disabled:
	
	break;
	
	case GIRL_STATES.init:
	
		x = _x;
		y = _y + room_height;
		
		update_tile_position();
		
		timer ++;
		if (timer >= delay) {
			timer = 0;
			state = GIRL_STATES.room_intro;
		}
		
		
	break;
	
	case GIRL_STATES.room_intro:
	
		x = _x;
		y = lerp(y, _y, .2);
	
	break;
	
	case GIRL_STATES.room_outro:
		sprite_index = spr_girl_front;
		
		x = obj_level_exit.x + obj_level_exit.sprite_width * .5;
		y = obj_level_exit.y + obj_level_exit.sprite_height * .25;
		
	break;
	
	case GIRL_STATES.falling:
		y += fall_speed;
		fall_speed += fall_accel;
		
		if (y >= room_height) {
			audio_play_sound(snd_girl_fall, 1, false);
			timer = 0;
			state = GIRL_STATES.dead;
		}
		
	break;
	
	case GIRL_STATES.vaporized:
		if (image_index >= sprite_get_number(sprite_index) -1) {
			image_speed = 0;
			image_index = sprite_get_number(sprite_index) -1;
			state = GIRL_STATES.dead;
		}
		
	break;
	
	case GIRL_STATES.dead:
		timer ++;
		if (timer >= death_time) {
			//FADE OUT
			if (global.playing_laser_hum) {
				audio_stop_sound(snd_laser_loop);
				global.playing_laser_hum = false;
			}
			room_restart();
		}
	break;
}
