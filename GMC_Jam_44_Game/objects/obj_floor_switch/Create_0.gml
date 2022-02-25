event_inherited();

switch_id = 0;
floor_entry_delay = 0;
floor_num = -1;

image_speed = 0;
image_index = 0;

switch_activated = false;

/// @function get_switch_at(_tile_x, _tile_y);
get_switch_at = function (_tile_x, _tile_y) {
	if (current_tile_pos[0] == _tile_x && current_tile_pos[1] == _tile_y) {
		return true;	
	}
	return false;
}


/// @function activate_switch();
activate_switch = function () {
	
	if (!switch_activated) {
		show_debug_message("SWITCH ACTIVATED!");
		image_index = 1;
		switch_activated = true;
		spawn_floor_list();
	}
	
}

/// @function spawn_floor_list();
spawn_floor_list = function () {
	
	if (!instance_exists(obj_icon_hidden_floor)) return;
	
	var this_delay = 0;
		
	for (var i = 0; i < array_length(floor_list); i++) {
			
		floor_num = floor_list[i];
		
		for (var k = 0; k < instance_number(obj_icon_hidden_floor); ++k;){
			var a_floor_icon = instance_find(obj_icon_hidden_floor,k);
			
			if (a_floor_icon.floor_id == floor_num) {

				//show_debug_message("FLOOR ID:" + string(floor_id));
				var a_floor = instance_create_layer(0, 9000, "Event_Layer", obj_floor);
				a_floor._x = global.tile_width * (a_floor_icon.x / global.tile_width);
				a_floor._y = global.tile_height * (a_floor_icon.y / global.tile_height);
				
				tilemap_set(global.map_id, TILE_DATA.floor, (a_floor_icon.x / global.tile_width), (a_floor_icon.y / global.tile_height));
				
				a_floor.update_tile_position();
				a_floor.do_intro(this_delay);
				//a_floor.set_delay(other.delay);
				//a_floor.state = FLOOR_STATES.init;
				
				this_delay += floor_entry_delay;
				show_debug_message("SPAWNING NEW FLOORS:" + string(this_delay));
				instance_destroy(a_floor_icon);//kill the icon
				
			}
			
		}
			
		//var a_floor = instance_find(obj_floor,k);
			
		with (obj_icon_hidden_floor) {

			
		}
	 }
}