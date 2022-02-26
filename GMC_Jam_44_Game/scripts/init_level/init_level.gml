global.tile_width = 32;
global.tile_height = 16;
global.floor_objects = [];
global.moveable_objects = [];
global.spring = .25;
global.map_id = -1;
global.lay_id = -1;
global.this_floor = -1;
global.tile_intro_delay = 1.5;
global.tile_intro_delay_inc = 0.03;//0.01
global.level_intro_done = false;
global.level_completed = false;
global.level_end_reached = false;

enum TILE_DATA {
	none = 0,
	floor = 1,
	floor_switch = 50,
	level_exit = 100,
}

function init_level(){
	
	global.floor_objects = [];
	global.moveable_objects = [];
	
	global.lay_id = layer_get_id("Floor_Layer");
	layer_set_visible(global.lay_id, false);//HIDE EDITOR TILES
	global.map_id = layer_tilemap_get_id(global.lay_id);
	var intro_delay = global.tile_intro_delay;
	
	//PLAYER SPAWN POINT
	if (!instance_exists(obj_icon_start)) {
		show_error("ROOM MUST HAVE A START POSITION ICON ON THE EVENT LAYER", false);
	}
	
	if (!instance_exists(obj_icon_end)) {
		show_error("ROOM MUST HAVE AN END POSITION ICON ON THE EVENT LAYER", false);
	}
	
	var player = instance_create_layer(0, -2000, "Event_Layer", obj_girl);
	player._x = obj_icon_start.x + global.tile_width * .5;
	player._y = obj_icon_start.y + global.tile_height * .5;
	player.update_tile_position();
	
	instance_destroy(obj_icon_start);
	//END OF PLAYER SPAWN POINT
	
	//FLOOR_SWITCH
		if (instance_exists(obj_icon_floor_switch)) {
			
			with (obj_icon_floor_switch) {
				
				var sw_tile_x = x / global.tile_width;
				var sw_tile_y = y / global.tile_height;
				
				var floor_switch = -1;
				
				if (start_in_floor) {
					floor_switch = instance_create_layer(x, y, "Event_Layer", obj_floor_switch);
					floor_switch.is_toggle = is_toggle;
					tilemap_set(global.map_id, TILE_DATA.floor_switch, sw_tile_x, sw_tile_y);
					//array_push(global.moveable_objects, floor_switch);
					array_push(global.floor_objects, floor_switch);
				} else {
					//set entry delay later when we parse the floors
					floor_switch = instance_create_layer(x, y, "Event_Layer", obj_moveable);
					array_push(global.moveable_objects, floor_switch);
					array_push(global.floor_objects, floor_switch);
				}
				
				
				floor_switch.floor_entry_delay = floor_entry_delay;
				floor_switch.switch_id = switch_id;
				floor_switch.floor_list = floor_list;
				floor_switch._x = x;
				floor_switch._y = y;
				//floor_switch.update_tile_position();
				floor_switch.current_tile_pos = [sw_tile_x, sw_tile_y];
				
				instance_destroy();
			}
		}
	//END OF FLOOR_SWITCH
	
	//Hidden Floors
	
	if (instance_exists(obj_icon_hidden_floor)) {
		with (obj_icon_hidden_floor) {
			
			var sw_tile_x = x / global.tile_width;
			var sw_tile_y = y / global.tile_height;
			
			if (activated) {
				//set the tile here
				tilemap_set(global.map_id, TILE_DATA.floor, sw_tile_x, sw_tile_y);
			} else {
			//hide these, but leave them in the level so we can look up id strings
			global.this_floor = instance_create_layer(0, 4000, "Event_Layer", obj_floor);
			array_push(global.floor_objects, global.this_floor);
			global.this_floor._x = x;
			global.this_floor._y = y;
			global.this_floor.update_tile_position();
			global.this_floor.deactivate(0);
			}
			visible = false;
		}
	}
	
	//END OF HIDDEN FLOORS

	//LEVEL_EXIT
	if (instance_exists(obj_icon_end)) {
			
		with (obj_icon_end) {
			visible = false;	
			
			var level_exit = instance_create_layer(x, y, "Event_Layer", obj_level_exit);
			var sw_tile_x = x / global.tile_width;
			var sw_tile_y = y / global.tile_height;
			
			level_exit.current_tile_pos = [sw_tile_x, sw_tile_y];
			
			tilemap_set(global.map_id, TILE_DATA.level_exit, sw_tile_x, sw_tile_y);
			//create level exit
			
			
		}
	}
	
	//END OF LEVEL_EXIT

	
	//FLOOR GENERATION
		for (var j = 0; j < room_height / global.tile_height; j++) {
			
			for (var i = 0; i < room_width / global.tile_width; i++) {
			
			var data = tilemap_get(global.map_id, i, j);
			
			global.this_floor = -1;
			
			 if (data == TILE_DATA.floor || data == TILE_DATA.floor_switch || data == TILE_DATA.level_exit) {
				 
					//if we're a floor switch, swap out floor graphic for switch
					if (data == TILE_DATA.floor_switch) {
						
						with (obj_floor_switch) {
							if (get_switch_at(i, j)) {
								global.this_floor = self;
							}
							sprite_index = spr_floor_switch;
						}

					}else if (data == TILE_DATA.level_exit) {
						with (obj_level_exit) {
							global.this_floor = self;
						}
					} else {
						global.this_floor = instance_create_layer(0, 0, "Event_Layer", obj_floor);
						array_push(global.floor_objects, global.this_floor);
					}
					
					if (global.this_floor != -1) {
						global.this_floor._x = global.tile_width * i;
						global.this_floor._y = global.tile_height * j;
						global.this_floor.update_tile_position();
						global.this_floor.do_intro(intro_delay);
					}
					
					//set any moveables to enter here
					if (instance_exists(obj_moveable)) {
						
						var a_moveable = get_moveable_at(i, j);
							if (a_moveable != -1) {
								a_moveable.do_intro(intro_delay);
							}
						
					}
					
					
					
					//if player should spawn here, make the player rise up with this floor piece.
					if (player.current_tile_pos[0] == global.this_floor.current_tile_pos[0] && player.current_tile_pos[1] == global.this_floor.current_tile_pos[1]) {
						player.set_delay(intro_delay);
						player.state = GIRL_STATES.init;
					}
					
					intro_delay += global.tile_intro_delay_inc;
					
			 } else if (data >= 2 && data <= 9) {
				 var scaffold = instance_create_layer(0, 0, "Event_Layer", obj_scaffolding);
				 scaffold.x = global.tile_width * i;
				 scaffold.y = global.tile_height * j;
				 scaffold.image_index = data - 2; //cooresponding with the image frame in the tileset
			 }
			 
			 global.this_floor = -1;
			
		}
	}
	
	//END OF FLOOR GENERATION
	
	show_debug_message("LEVEL CREATED!")
	
}

/// @function notify_room_intro_complete();
function notify_room_intro_complete() {
	show_debug_message("ROOM INTRO COMPLETE");
	global.level_intro_done = true;
	if (instance_exists(obj_girl)) {
		obj_girl.state = GIRL_STATES.idle;
	}	
}

/// @function notify_room_outro_complete();
function notify_room_outro_complete() {
	show_debug_message("ROOM OUTRO COMPLETE");
	global.level_completed = true;
}

function get_floor_at(_tile_x, _tile_y) {
	
	var len = array_length(global.floor_objects);
	
	for (var i = 0; i < len; i++) {
			var a_floor = global.floor_objects[i];
			if (a_floor.current_tile_pos[0] == _tile_x && a_floor.current_tile_pos[1] == _tile_y) {
			return a_floor;	
		}	
	}
	
	return -1;
}

function get_moveable_at(_tile_x, _tile_y) {
	
	var len = array_length(global.moveable_objects);
	
	for (var i = 0; i < len; i++) {
			var a_floor = global.moveable_objects[i];
			if (a_floor.current_tile_pos[0] == _tile_x && a_floor.current_tile_pos[1] == _tile_y) {
			return a_floor;	
		}	
	}
	
	return -1;
}

function get_floor_circular_arrays(_tile_x, _tile_y) {
	
	current_x_min = _tile_x - 1;
	current_x_max = _tile_x + 1;
	current_y_min = _tile_y - 1;
	current_y_max = _tile_y + 1;
	
	var floor_groups = [];
	
	while (current_x_min >= 0 || current_x_max <= room_width / global.tile_width || current_y_min >= 0 || current_y_max <= room_height / global.tile_height) {
		
		var this_group = [];
		
		for (var i = current_x_min; i <= current_x_max; i++) {
			
			for (var j = current_y_min; j <= current_y_max; j++) {

				var a_floor = get_floor_at(i, j);
							
					if (i >= 0 && i <= room_width / global.tile_width && j >= 0 && j <= room_height / global.tile_height) {
		
					if (a_floor.current_tile_pos[0] == i && a_floor.current_tile_pos[1] == j) {
						array_push(this_group, a_floor);
					}
				}
			}
		}
		
		array_push(floor_groups, this_group);
		
		current_x_min --;
		current_x_max ++;
		current_y_min --;
		current_y_max ++;
		
	}
	
	return floor_groups;
	
}

/*
/// @function spawn_floor_list(floor_list, _delay);
function spawn_floor_list (floor_list, _delay) {
	
	if (!instance_exists(obj_icon_hidden_floor)) return;
	
	var this_delay = 0;
	
	var hidden_floor_icons = [];
		
	for (var k = 0; k < instance_number(obj_icon_hidden_floor); k++){
		hidden_floor_icons[k] = instance_find(obj_icon_hidden_floor,k);
	}
		
	for (var i = 0; i < array_length(floor_list); i++) {
		//show_debug_message("PROCESSING FLOOR ICON:" + string(i));
		floor_num = floor_list[i];
		
		for (var j = 0; j < array_length(hidden_floor_icons); j++) {
			
			var a_floor_icon = hidden_floor_icons[j];
			
			if (a_floor_icon.floor_id == floor_num) {

				//show_debug_message("FLOOR ID:" + string(a_floor_icon.floor_id) + string("tile_x:" + string(a_floor_icon.x / global.tile_width) + "tile_y:" + string(a_floor_icon.y / global.tile_height)));
				global.this_floor = get_floor_at(a_floor_icon.x / global.tile_width, a_floor_icon.y / global.tile_height);
				if (global.this_floor != -1) {
					if (global.this_floor.state == FLOOR_STATES.idle) {
						global.this_floor.deactivate(this_delay);
					} else {
						global.this_floor.do_intro(this_delay);
					}
				}
				
				this_delay += _delay;
				//show_debug_message("SPAWNING NEW FLOORS:" + string(this_delay));
				continue;
			}
		}
	 }
}
*/
