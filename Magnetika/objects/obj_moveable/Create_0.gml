event_inherited();
floating = false;
lost = false;

lost_floor = function () {
	var data = tilemap_get(global.map_id, current_tile_pos[0], current_tile_pos[1]);
	if (data == 0) {
		lost = true;
		var len = array_length(global.moveable_objects);
		for (var i = 0; i < len; i++) {
			var a_moveable = global.moveable_objects[i];
			//show_debug_message("YOU LOST THE FLOOR! SELF: " + string(id));	
			if (a_moveable.id == id) {
				//remove this moveable object from the game.
				array_delete(global.moveable_objects, i, 1);
				return true;
			}
		}
		
		return true;
	}
	return false;	
}

/// @function set_moveable_lost();
set_moveable_lost = function () {
	state = FLOOR_STATES.falling;
}
