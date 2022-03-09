event_inherited();
floating = false;
lost = false;

/// @function move(_dir);
move = function (_dir) {
	switch (_dir) {
		case TILE_DIRECTIONS.UP:
			_y -= global.tile_height;
		break;
		
		case TILE_DIRECTIONS.RIGHT:
			_x += global.tile_width;
		break;
		
		case TILE_DIRECTIONS.DOWN:
			_y += global.tile_height;
		break;
		
		case TILE_DIRECTIONS.LEFT:
			_x -= global.tile_width;
		break;
	}
	//clear piece from old position
	global.moveable_objects[current_tile_pos[0]][current_tile_pos[1]] = -1;
	update_tile_position();
}

/// @function update_current_tile_position();
update_tile_position = function () {
	current_tile_pos[0] = floor(_x / global.tile_width);
	current_tile_pos[1] = floor(_y / global.tile_height);
	global.moveable_objects[current_tile_pos[0]][current_tile_pos[1]] = id;
}

lost_floor = function () {
	var data = tilemap_get(global.map_id, current_tile_pos[0], current_tile_pos[1]);
	if (data == 0) {
		lost = true;
		
		global.moveable_objects[current_tile_pos[0]][current_tile_pos[1]] = -1;
		return true;
	}
	return false;	
}

/// @function set_moveable_lost();
set_moveable_lost = function () {
	state = FLOOR_STATES.falling;
}

/// @function notify_picked_up();
notify_picked_up = function() {
	//OVERRIDE	
}