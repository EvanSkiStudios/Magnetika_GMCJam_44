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

gun_control_x_speed = .5;
gun_control_y_speed = .25;

timer = 0;
death_time = 2 * room_speed;

fall_speed = 0;
fall_accel = 0.25;


state = GIRL_STATES.null;

stand_sprite = spr_girl_front;

enum GIRL_STATES {
	idle,
	running,
	activated_gun,
	disabled,
	init,
	room_intro,
	room_outro,
	falling,
	dead,
	null,
}

enum TILE_DIRECTIONS {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

/// @function shoot_gun(dir);
shoot_gun = function (dir) {
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
			
			//check for moveable piece
			var movable_piece = get_moveable_at(check_position[0], check_position[1]);
			if (movable_piece != -1) {
				state = GIRL_STATES.activated_gun;
				show_debug_message("FOUND PIECE. GUN ACTIVATED");
				current_moveable_piece = movable_piece;
				return;
			}
			//set check position further
			check_position[@ 0] += offset[@ 0];
			check_position[@ 1] += offset[@ 1];
		} else {
			blocked = true;	
		}
	}
	show_debug_message("GUN COULD NOT FIND MOVEABLE PIECE.");
}

control_moveable_piece = function () {
	
	current_moveable_piece.hover_dist = 3;
	current_moveable_piece.floating = true;
	
	var can_move_x = false;
	var can_move_y = false;
	
	var test_tile_x = current_moveable_piece.current_tile_pos[0];
	var test_tile_y = current_moveable_piece.current_tile_pos[1];
	
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
			if (girl_tile_x != test_tile_x || girl_tile_y != test_tile_y) {
				var data = tilemap_get(global.map_id, test_tile_x, test_tile_y);
				if (data == 1) {
						current_moveable_piece._x -= global.tile_width;
				}
			}
			
		} else if (right_pressed) {
			test_tile_x += 1;
			if (girl_tile_x != test_tile_x || girl_tile_y != test_tile_y) {
				var data = tilemap_get(global.map_id, test_tile_x, test_tile_y);
				if (data == 1) {
						current_moveable_piece._x += global.tile_width;
				}
				
			}
		}
	} else if (can_move_y) {
		if (up_pressed) {
			test_tile_y -= 1;
			if (girl_tile_x != test_tile_x || girl_tile_y != test_tile_y) {
				var data = tilemap_get(global.map_id, test_tile_x, test_tile_y);
				if (data == 1) {
						current_moveable_piece._y -= global.tile_height;
				}
			}
		} else if (down_pressed) {
			test_tile_y += 1;
			if (girl_tile_x != test_tile_x || girl_tile_y != test_tile_y) {
				
				var data = tilemap_get(global.map_id, test_tile_x, test_tile_y);
				if (data == 1) {
						current_moveable_piece._y += global.tile_height;
				}
			}
		}
	}
	current_moveable_piece.update_tile_position();
}

/// @function deactivate_gun();
deactivate_gun = function () {
	show_debug_message("GUN DEACTIVATED");
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
			image_xscale = -1;
			x += -x_run_speed;
		break;
		
		case TILE_DIRECTIONS.RIGHT:
			facing_dir = TILE_DIRECTIONS.RIGHT;
			sprite_index = spr_girl_run_side;
			stand_sprite = spr_girl_side;
			image_xscale = 1;
			x += x_run_speed;
		break;
		
		case TILE_DIRECTIONS.UP:
			facing_dir = TILE_DIRECTIONS.UP;
			sprite_index = spr_girl_run_up;
			stand_sprite = spr_girl_back;
			image_xscale = 1;
			y -= y_run_speed;
		break;
		
		case TILE_DIRECTIONS.DOWN:
			facing_dir = TILE_DIRECTIONS.DOWN;
			sprite_index = spr_girl_run_down;
			stand_sprite = spr_girl_front;
			image_xscale = 1;
			y += y_run_speed;
		break;
	}
	
	with (obj_floor_switch) {
		if (obj_girl.current_tile_pos[0] == current_tile_pos[0] && obj_girl.current_tile_pos[1] == current_tile_pos[1]) {
			activate_switch();
		}
	}
	
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
	
	if ( !(global.GAME_IS_PAUSED) && !(instance_exists(obj_ETW_Dialog_Typewriter)) ){
	
		if ( fhInputActionCheckDown(FHINPUTACTION_Activate) || fhInputActionCheckDown(FHINPUTACTION_ActivateAlt) || fhInputActionCheckDown(FHINPUTACTION_ActivateAltLH) ) {
			fire = true;	
		}
		if ( fhInputActionCheckPressed(FHINPUTACTION_Activate) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAlt) || fhInputActionCheckPressed(FHINPUTACTION_ActivateAltLH) )  {
			fire_pressed = true;
		}
	
		if ( fhInputActionCheckDown(FHINPUTACTION_Left)) {
			left = true;	
		} else if ( fhInputActionCheckDown(FHINPUTACTION_Right)) {
			right = true;
		}
	
		if ( fhInputActionCheckPressed(FHINPUTACTION_Left)) {
			left_pressed = true;	
		} else if ( fhInputActionCheckPressed(FHINPUTACTION_Right)) {
			right_pressed = true;
		}
	
		if ( fhInputActionCheckDown(FHINPUTACTION_Up)) {
			up = true;	
		} else if ( fhInputActionCheckDown(FHINPUTACTION_Down)) {
			down = true;
		}
		if ( fhInputActionCheckPressed(FHINPUTACTION_Up)) {
			up_pressed = true;	
		} else if ( fhInputActionCheckPressed(FHINPUTACTION_Down)) {
			down_pressed = true;
		}
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
	
	//CHECK FOR BLOCKING OBJECTS
	if (instance_exists(obj_moveable)) {
		with (obj_moveable) {
			if (current_tile_pos[0] == other.potential_tile[0] && current_tile_pos[1] == other.potential_tile[1]) {
				return false;
			}
		}
	}
	
	var _x = potential_tile[0];
	var _y = potential_tile[1];
	
	if ((_x < 0) || (_x > (room_width / global.tile_width)) || (_y < 0) || (_y > (room_height / global.tile_height))) {
		return false;	
	}
	
	var data = tilemap_get(map_id, _x, _y);
	
	if (data == TILE_DATA.floor) return true;
	if (data == TILE_DATA.floor_switch) return true;
	if (data == TILE_DATA.level_exit) return true;
	if (data == TILE_DATA.none) return false;
	
}

function set_delay (_delay) {
	delay = _delay * room_speed;	
}

