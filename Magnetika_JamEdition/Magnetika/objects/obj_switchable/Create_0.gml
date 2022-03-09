timer = 0;
switch_activated = false;
switch_completed = true;
/// @function activate(_delay);
activate = function (_delay) {
//OVERRIDE
}

/// @function switch_deactivate();
deactivate = function (_delay) {
//OVERRIDE	
}

/// @function update_current_tile_position();
update_tile_position = function () {
	current_tile_pos[0] = floor(_x / global.tile_width);
	current_tile_pos[1] = floor(_y / global.tile_height);
}