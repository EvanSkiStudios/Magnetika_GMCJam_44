left_pressed = false;
right_pressed = false;
up_pressed = false;
down_pressed = false;
fire_pressed = false;

left = false;
right = false;
up = false;
down = false;
fire = false;

instance_create_layer(40, 40, "Event_Layer", obj_arrow);
instance_create_layer(40, 40, "Event_Layer", obj_energy_field);
instance_create_layer(40, 40, "Event_Layer", obj_gun);
potential_moveable_piece = -1;

dip_current = 0;

delay = 0;
current_tile_pos = [0,0];
potential_tile = -1;

facing_dir = TILE_DIRECTIONS.DOWN;

current_moveable_piece = -1;

_x = 0;
_y = 0;

y_run_speed = 1;
x_run_speed = 2;

timer = 0;
death_time = 2 * room_speed;

fall_speed = 0;
fall_accel = 0.25;
vaporized = false;

test_tile_x = 0;
test_tile_y = 0;


state = GIRL_STATES.null;

stand_sprite = spr_girl_front;

gun_anim_speed = 1;
gun_sprite = spr_gun_neutral_front;

gun_neutral_front = spr_gun_neutral_front;
gun_neutral_side = spr_gun_neutral_side;
gun_neutral_back = spr_gun_neutral_back;

gun_force_front = spr_gun_energy_front;
gun_force_side = spr_gun_energy_side;
gun_force_back = spr_gun_energy_back;

gun_neutral_sprite = gun_neutral_front;
gun_energy_sprite = gun_force_front;

enum GIRL_STATES {
	idle,
	running,
	activated_gun,
	disabled,
	init,
	room_intro,
	room_outro,
	falling,
	vaporized,
	dead,
	null,
}

enum TILE_DIRECTIONS {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

/// @function get_potential_piece;
get_potential_piece = function (dir) {
	potential_moveable_piece = -1;
	var blocked = false;
	var offset = [0,0];
	switch (dir) {
		case TILE_DIRECTIONS.LEFT:
			offset = [-1, 0];
			gun_energy_sprite = gun_force_side;
			gun_neutral_sprite = gun_neutral_side;
			gun_anim_speed = 1;
		break;
		case TILE_DIRECTIONS.RIGHT:
			offset = [1, 0];
			gun_energy_sprite = gun_force_side;
			gun_neutral_sprite = gun_neutral_side;
			gun_anim_speed = 1;
						
		break;
		case TILE_DIRECTIONS.UP:
			offset = [0, -1];
			if (facing_dir == TILE_DIRECTIONS.UP) {
				gun_energy_sprite = gun_force_back;
				gun_neutral_sprite = gun_neutral_back;
				gun_anim_speed = 1;
			}
		break;
		case TILE_DIRECTIONS.DOWN:
			offset = [0, 1];
			if (facing_dir == TILE_DIRECTIONS.DOWN) {
				gun_energy_sprite = gun_force_front;
				gun_neutral_sprite = gun_neutral_front;
				gun_anim_speed = 1;
			}
		break;
	}
	
	var check_position = current_tile_pos;
	check_position[0] += offset[0];
	check_position[1] += offset[1];
	
	//CHECK EACH SQUARE IN A LINE UNTIL WE EITHER 
	//HIT END OF ROOM, BLOCKER, OR GRAB A MOVABLE PIECE
	while(blocked == false) {
		//check movable pieces
		if (check_position[0] >= 0 && check_position[0] <= room_width / global.tile_width && check_position[1] >= 0 && check_position[1] <= room_height / global.tile_height) {
			
			var laser = get_laser_at(check_position[0], check_position[1]);
			if (laser != -1) {
				blocked = true;
			}
			
			//check for moveable piece
			var movable_piece = get_moveable_at(check_position[0], check_position[1]);
			if (movable_piece != -1) {
				potential_moveable_piece = movable_piece;
				return;
			}
			//set check position further
			check_position[@ 0] += offset[@ 0];
			check_position[@ 1] += offset[@ 1];
		} else {
			blocked = true;	
		}
	}
	//show_debug_message("NO PIECE");
	return -1;
}

/// @function shoot_gun(dir);
shoot_gun = function (dir) {
	gun_sprite = gun_neutral_sprite;
	//obj_gun.sprite_index = gun_sprite;
	current_moveable_piece = -1;
	var blocked = false;
	var offset = [0,0];
	switch (dir) {
		case TILE_DIRECTIONS.LEFT:
			offset = [-1, 0];
		break;
		case TILE_DIRECTIONS.RIGHT:
			offset = [1, 0];
		break;
		case TILE_DIRECTIONS.UP:
			offset = [0, -1];
		break;
		case TILE_DIRECTIONS.DOWN:
			offset = [0, 1];
		break;
	}
	
	var check_position = current_tile_pos;
	check_position[0] += offset[0];
	check_position[1] += offset[1];
	
	//CHECK EACH SQUARE IN A LINE UNTIL WE EITHER 
	//HIT END OF ROOM, BLOCKER, OR GRAB A MOVABLE PIECE
	while(blocked == false) {
		//check movable pieces
		if (check_position[0] >= 0 && check_position[0] <= room_width / global.tile_width && check_position[1] >= 0 && check_position[1] <= room_height / global.tile_height) {
			
			var laser = get_laser_at(check_position[0], check_position[1]);
			if (laser != -1) {
				blocked = true;
				continue;
			}
			
			//check for moveable piece
			var movable_piece = get_moveable_at(check_position[0], check_position[1]);
			if (movable_piece != -1) {
				state = GIRL_STATES.activated_gun;
				//show_debug_message("FOUND PIECE. GUN ACTIVATED");
				current_moveable_piece = movable_piece;
				current_moveable_piece.notify_picked_up();
				audio_play_sound(snd_gun_on, 1, 0);
				return;
			}
			//set check position further
			check_position[@ 0] += offset[@ 0];
			check_position[@ 1] += offset[@ 1];
		} else {
			blocked = true;	
		}
	}
	audio_play_sound(snd_gun_fail, 1, 0);
	//show_debug_message("GUN COULD NOT FIND MOVEABLE PIECE.");
}

/// @function is_moveable_blocking();
is_moveable_blocking = function () {
	//CHECK MOVEABLES
	var block = global.moveable_objects[test_tile_x][test_tile_y];
	if (block != -1) {
		return true;
	}
	//CHECK LASER OBJECTS
	var laser = global.laser_objects[test_tile_x][test_tile_y];
	if (laser != -1) {
		return true;
	}
	
	//CHECK LASER SWITCH OBJECTS
	var laser_switch = global.laser_switch_objects[test_tile_x][test_tile_y];
	if (laser_switch != -1) {
		return true;
	}
	return false;
}

control_moveable_piece = function () {
	obj_gun.visible = false;
	current_moveable_piece.hover_dist = 3;
	current_moveable_piece.floating = true;
	
	var can_move_x = false;
	var can_move_y = false;
	
	test_tile_x = current_moveable_piece.current_tile_pos[0];
	test_tile_y = current_moveable_piece.current_tile_pos[1];
	
	var girl_tile_x = obj_girl.current_tile_pos[0];
	var girl_tile_y = obj_girl.current_tile_pos[1];
	
	switch (facing_dir) {
		case TILE_DIRECTIONS.LEFT:
		can_move_x = true;
		break;
		case TILE_DIRECTIONS.RIGHT:
		can_move_x = true;
		break;
		case TILE_DIRECTIONS.UP:
		can_move_y = true;
		break;
		case TILE_DIRECTIONS.DOWN:
		can_move_y = true;
		break;
	}
	
	if (can_move_x) {
		if (left_pressed) {
			test_tile_x -= 1;
			var blocking = is_moveable_blocking();
			if ((girl_tile_x != test_tile_x || girl_tile_y != test_tile_y) && !blocking) {
				var data = tilemap_get(global.map_id, test_tile_x, test_tile_y);
				if (data == 1) {
					//current_moveable_piece._x -= global.tile_width;
					//global.moveable_objects[current_moveable_piece.current_tile_pos[0]][current_moveable_piece.current_tile_pos[1]] = -1;
					current_moveable_piece.move(TILE_DIRECTIONS.LEFT);
					if (facing_dir == TILE_DIRECTIONS.LEFT) {
						gun_anim_speed = 1;	
					} else if (facing_dir == TILE_DIRECTIONS.RIGHT) {
						gun_anim_speed = -1;	
					}
				}
				
			}
			
		} else if (right_pressed) {
			test_tile_x += 1;
			var blocking = is_moveable_blocking();
			if ((girl_tile_x != test_tile_x || girl_tile_y != test_tile_y)  && !blocking) {
				var data = tilemap_get(global.map_id, test_tile_x, test_tile_y);
				if (data == 1) {
						//current_moveable_piece._x += global.tile_width;
						//global.moveable_objects[current_moveable_piece.current_tile_pos[0]][current_moveable_piece.current_tile_pos[1]] = -1;
						current_moveable_piece.move(TILE_DIRECTIONS.RIGHT);
						if (facing_dir == TILE_DIRECTIONS.RIGHT) {
							gun_anim_speed = 1;	
						} else if (facing_dir == TILE_DIRECTIONS.LEFT) {
							gun_anim_speed = -1;	
						}
				}
				
				
			}
		}
	} else if (can_move_y) {
		if (up_pressed) {
			test_tile_y -= 1;
			var blocking = is_moveable_blocking();
			if ((girl_tile_x != test_tile_x || girl_tile_y != test_tile_y)  && !blocking) {
				var data = tilemap_get(global.map_id, test_tile_x, test_tile_y);
				if (data == 1) {
						current_moveable_piece.move(TILE_DIRECTIONS.UP);
						//current_moveable_piece._y -= global.tile_height;
						//global.moveable_objects[current_moveable_piece.current_tile_pos[0]][current_moveable_piece.current_tile_pos[1]] = -1;
						if (facing_dir == TILE_DIRECTIONS.UP) {
						gun_anim_speed = 1;	
					} else if (facing_dir == TILE_DIRECTIONS.DOWN) {
						gun_anim_speed = -1;	
					}
				}
			}
		} else if (down_pressed) {
			test_tile_y += 1;
			var blocking = is_moveable_blocking();
			if ((girl_tile_x != test_tile_x || girl_tile_y != test_tile_y)  && !blocking) {
				var data = tilemap_get(global.map_id, test_tile_x, test_tile_y);
				if (data == 1) {
					//current_moveable_piece._y += global.tile_height;
					//global.moveable_objects[current_moveable_piece.current_tile_pos[0]][current_moveable_piece.current_tile_pos[1]] = -1;
					current_moveable_piece.move(TILE_DIRECTIONS.DOWN);
					if (facing_dir == TILE_DIRECTIONS.DOWN) {
						gun_anim_speed = 1;	
					} else if (facing_dir == TILE_DIRECTIONS.UP) {
						gun_anim_speed = -1;	
					}
						
				}
			}
		}
	}
	//current_moveable_piece.update_tile_position();
	//y, _y - hover_dist + dip_current
	if (!current_moveable_piece.travel_complete) {
		gun_sprite = gun_energy_sprite;
	} else {
		gun_sprite = gun_neutral_sprite;
	}
	obj_gun.sprite_index = gun_sprite;
	obj_gun.image_speed =gun_anim_speed;
}

/// @function deactivate_gun();
deactivate_gun = function () {
	//show_debug_message("GUN DEACTIVATED");
	audio_stop_sound(snd_gun_on);
	audio_play_sound(snd_gun_off, 1, 0);
	current_moveable_piece.floating = false;
	current_moveable_piece.hover_dist = 0;
	current_moveable_piece = -1;
}

run = function (dir) {
	
	switch (dir) {
		
		case TILE_DIRECTIONS.LEFT:
			facing_dir = TILE_DIRECTIONS.LEFT;
			sprite_index = spr_girl_run_side;
			stand_sprite = spr_girl_side;
			gun_force_sprite = gun_force_side;
			gun_neutral_sprite = gun_neutral_side;
			image_xscale = -1;
			x += -x_run_speed;
		break;
		
		case TILE_DIRECTIONS.RIGHT:
			facing_dir = TILE_DIRECTIONS.RIGHT;
			sprite_index = spr_girl_run_side;
			stand_sprite = spr_girl_side;
			gun_force_sprite = gun_force_side;
			gun_neutral_sprite = gun_neutral_side;
			image_xscale = 1;
			x += x_run_speed;
		break;
		
		case TILE_DIRECTIONS.UP:
			facing_dir = TILE_DIRECTIONS.UP;
			sprite_index = spr_girl_run_up;
			stand_sprite = spr_girl_back;
			gun_force_sprite = gun_force_back;
			gun_neutral_sprite = gun_neutral_back;
			image_xscale = 1;
			y -= y_run_speed;
		break;
		
		case TILE_DIRECTIONS.DOWN:
			facing_dir = TILE_DIRECTIONS.DOWN;
			sprite_index = spr_girl_run_down;
			stand_sprite = spr_girl_front;
			gun_force_sprite = gun_force_front;
			gun_neutral_sprite = gun_neutral_front;
			image_xscale = 1;
			y += y_run_speed;
		break;
	}
	
	gun_sprite = gun_neutral_sprite;
	
	/*
	with (obj_floor_switch) {
		if (obj_girl.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_tile_pos[1] == current_tile_pos[1]) {
			activate_switch();
		}
	}
	*/
	
	with (obj_level_exit) {
		
		if (obj_girl.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_tile_pos[1] == current_tile_pos[1]) {
			obj_girl.state = GIRL_STATES.room_outro;
			
			obj_girl.x = x + sprite_width * .5;
			obj_girl.y = y + sprite_height * .25;
			
			do_level_exit();
		}
	}
	
	_y = y;
	_x = x;
	
}

/// @function get_input();
get_input = function () {
	
	left = false;
	right = false;
	up = false;
	down = false;
	fire = false;
	
	left_pressed = false;
	right_pressed = false;
	up_pressed = false;
	down_pressed = false;
	fire_pressed = false;
	
	if (keyboard_check(vk_space)) {
		fire = true;	
	}
	if (keyboard_check_pressed(vk_space)) {
		fire_pressed = true;
	}
	
	if (keyboard_check(vk_left)) {
		left = true;	
	} else if (keyboard_check(vk_right)) {
		right = true;
	}
	
	if (keyboard_check_pressed(vk_left)) {
		left_pressed = true;	
	} else if (keyboard_check_pressed(vk_right)) {
		right_pressed = true;
	}
	
	if (keyboard_check(vk_up)) {
		up = true;	
	} else if (keyboard_check(vk_down)) {
		down = true;
	}
	if (keyboard_check_pressed(vk_up)) {
		up_pressed = true;	
	} else if (keyboard_check_pressed(vk_down)) {
		down_pressed = true;
	}
}

/// @function check_for_no_floor();
check_for_no_floor = function () {
	var data = tilemap_get(global.map_id, current_tile_pos[0], current_tile_pos[1]);
	if (data == 0) {
		state = GIRL_STATES.falling;
		return true;
	}
	return false;
}

update_tile_position = function () {
	current_tile_pos[0] = floor(_x / global.tile_width);
	current_tile_pos[1] = floor(_y / global.tile_height);
	//show_debug_message("GIRL TILE POS:" + string(current_tile_pos[0]) + "," + string(current_tile_pos[1]));
}

check_tile = function (dir) {
	
	var lay_id = layer_get_id("Floor_Layer");
	var map_id = layer_tilemap_get_id(lay_id);
	
	var current_pos = [x, y];
	
	switch (dir) {
		case TILE_DIRECTIONS.DOWN:
			current_pos[1] += (y_run_speed * 3);
		break;
		case TILE_DIRECTIONS.UP:
			current_pos[1] -= (y_run_speed * 3);
		break;
		case TILE_DIRECTIONS.LEFT:
			current_pos[0] -= (x_run_speed * 3);
		break;
		case TILE_DIRECTIONS.RIGHT:
			current_pos[0] += (x_run_speed * 3);
		break;
	}
	
	potential_tile = [floor (current_pos[0] / global.tile_width), floor(current_pos[1] / global.tile_height)];
	var _x = potential_tile[0];
	var _y = potential_tile[1];
	
	//CHECK FOR BLOCKING OBJECTS
	/*
	if (instance_exists(obj_moveable)) {
		with (obj_moveable) {
			if (current_tile_pos[0] == other.potential_tile[0] && current_tile_pos[1] == other.potential_tile[1]) {
				return false;
			}
		}
	}*/
	
	var moveable = get_moveable_at(_x, _y);
	if (moveable != -1) {
		return false;	
	}
	
	var laser = get_laser_at(_x, _y);
	if (laser != -1) {
		return false;	
	}
	
	var laser_switch = get_laser_switch_at(_x, _y);
	if (laser_switch != -1) {
		return false;	
	}
	
	if ((_x < 0) || (_x > (room_width / global.tile_width)) || (_y < 0) || (_y > (room_height / global.tile_height))) {
		return false;	
	}
	
	var data = tilemap_get(map_id, _x, _y);
	
	if (data == TILE_DATA.floor) return true;
	if (data == TILE_DATA.floor_switch) return true;
	if (data == TILE_DATA.level_exit) return true;
	if (data == TILE_DATA.none) return false;
	
}

set_delay = function (_delay) {
	delay = _delay * room_speed;	
}

/// @function vaporize();
vaporize = function () {
	if (!vaporized){
		vaporized = true;
		sprite_index = spr_girl_vaporized;
		image_index = 0;
		state = GIRL_STATES.vaporized;
	}
}