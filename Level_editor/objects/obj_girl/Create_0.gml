left = false;
right = false;
up = false;
down = false;

dip_current = 0;

intro_height = 1000;
delay = 0;
current_tile_pos = [0,0];
potential_tile = -1;

current_moveable_piece = -1;

_x = 0;
_y = 0;

y_run_speed = 1;
x_run_speed = 2;

timer = 0;


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
				//FOUND VALID PIECE
				//SET GUN TO ACTIVATED
				show_debug_message("FOUND PIECE. GUN ACTIVATED")
				current_moveable_piece = movable_piece;
				return;
			}
			//set check position further
			check_position[0] += offset[0];
			check_position[1] += offset[1];
		} else {
			blocked = false;	
		}
	}
}

run = function (dir) {
	
	switch (dir) {
		
		case TILE_DIRECTIONS.LEFT:
			sprite_index = spr_girl_run_side;
			stand_sprite = spr_girl_side;
			image_xscale = -1;
			x += -x_run_speed;
		break;
		
		case TILE_DIRECTIONS.RIGHT:
			sprite_index = spr_girl_run_side;
			stand_sprite = spr_girl_side;
			image_xscale = 1;
			x += x_run_speed;
		break;
		
		case TILE_DIRECTIONS.UP:
			sprite_index = spr_girl_run_up;
			stand_sprite = spr_girl_back;
			image_xscale = 1;
			y -= y_run_speed;
		break;
		
		case TILE_DIRECTIONS.DOWN:
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
	
	if (keyboard_check_pressed(vk_space)) {
		fire = true;	
	}
	
	if (keyboard_check(vk_left)) {
		left = true;	
	} else if (keyboard_check(vk_right)) {
		right = true;
	}
	
	if (keyboard_check(vk_up)) {
		up = true;	
	} else if (keyboard_check(vk_down)) {
		down = true;
	}
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