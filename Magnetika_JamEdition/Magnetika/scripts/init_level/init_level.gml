global.tile_width = 32;
global.tile_height = 16;
global.floor_objects[0][0] = -1;
global.moveable_objects[0][0] = -1;
global.laser_objects[0][0] = -1;
global.deflector_objects[0][0] = -1;
global.laser_switch_objects[0][0] = -1;
global.spring = .25;
global.map_id = -1;
global.lay_id = -1;
global.this_floor = -1;
global.tile_intro_delay = 1.5;
global.tile_intro_delay_inc = 0.03;//0.01
global.level_intro_done = false;
global.level_completed = false;
global.level_end_reached = false;
global.box_lost = false;
global.playing_laser_hum = false;

enum TILE_DATA {
	none = 0,
	floor = 1,
	floor_switch = 50,
	level_exit = 100,
	laser = 200,
	laser_switch = 400,
}

function init_level(){
	
	//init floor object 2d array
	var x_tiles = room_width / global.tile_width;
	var y_tiles = room_height / global.tile_height;
	for (var i = 0; i <= x_tiles; i++) {
		for (var j = 0; j <= y_tiles; j++) {
			global.floor_objects[i][j] = -1;
			global.moveable_objects[i][j] = -1;
			global.laser_objects[i][j] = -1;
			global.deflector_objects[i][j] = -1;
			global.laser_switch_objects[i][j] = -1;
		}
	}

	global.box_lost = false;
	
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
				floor_switch = instance_create_layer(x, y, "Event_Layer", obj_floor_switch);
				floor_switch.switch_type = variable_instance_get(id, "switch_type");
				floor_switch.switch_color = switch_color;
				tilemap_set(global.map_id, TILE_DATA.floor_switch, sw_tile_x, sw_tile_y);
				//array_push(global.floor_objects, floor_switch);
				global.floor_objects[sw_tile_x][sw_tile_y] = floor_switch;
				floor_switch.button_invisible = invisible;
				floor_switch.switch_delay = switch_delay;
				floor_switch.switchables_list = switchables_list;
				floor_switch._x = x;
				floor_switch._y = y;
				floor_switch.update_tile_position();
				
				instance_destroy();
			}
		}
	//END OF FLOOR_SWITCH
	
	//Hidden Floors
	
	if (instance_exists(obj_icon_hidden_floor)) {
		with (obj_icon_hidden_floor) {
			
			var sw_tile_x = x / global.tile_width;
			var sw_tile_y = y / global.tile_height;
			
			global.this_floor = instance_create_layer(0, 4000, "Event_Layer", obj_floor);
			global.this_floor.switch_id = switch_id;
			global.floor_objects[sw_tile_x][sw_tile_y] = global.this_floor;
			tilemap_set(global.map_id, TILE_DATA.floor, sw_tile_x, sw_tile_y);
			global.this_floor._x = x;
			global.this_floor._y = y;
			global.this_floor.update_tile_position();
			global.this_floor.switch_activated = activated;
			if (!activated) {
				global.this_floor.movement_complete = true;
			}
			visible = false;
		}
	}
	
	//END OF HIDDEN FLOORS
	
	//BLOCKS
	
	if (instance_exists(obj_icon_block)) {
		with (obj_icon_block) {
			
			var sw_tile_x = x / global.tile_width;
			var sw_tile_y = y / global.tile_height;
			
			var block = instance_create_layer(0, 4000, "Event_Layer", obj_block);
			block._x = x;
			block._y = y;
			block.true_y = block._y;
			block.update_tile_position();
			
			global.moveable_objects[sw_tile_x][sw_tile_y] = block;
			
			visible = false;
		}
	}
	
	//END OF BLOCKS
	
	//LASERS
	
	if (instance_exists(obj_icon_laser)) {
		
		with (obj_icon_laser) {
			
			var sw_tile_x = x / global.tile_width;
			var sw_tile_y = y / global.tile_height;
			
			var laser = instance_create_layer(0, 4000, "Event_Layer", obj_laser);
			laser.aim_direction = variable_instance_get(id, "aim_direction");
			//show_debug_message("LASER ICON AIM DIRECTION: " + string(variable_instance_get(id, "aim_direction")));
			laser.switch_id = switch_id;
			laser.switchable = switchable;
			laser.turret_color = turret_color;
			laser.off_at_start = off_at_start;
			laser.time_on = variable_instance_get(id, "time_on") * room_speed;
			laser.time_off = variable_instance_get(id, "time_off") * room_speed;
			laser._x = x;
			laser._y = y;
			laser.update_tile_position();
			global.laser_objects[laser.current_tile_pos[0]][laser.current_tile_pos[1]] = laser;
			visible = false;
		}
	}
	
	//END OF LASERS
	
	//DEFLECTORS
	if (instance_exists(obj_icon_deflector)) {
		with (obj_icon_deflector) {
			var sw_tile_x = x / global.tile_width;
			var sw_tile_y = y / global.tile_height;
			var deflector = instance_create_layer(0, 4000, "Event_Layer", obj_deflector);
			deflector.deflector_direction = variable_instance_get(id, "deflector_direction");
			deflector._x = x;
			deflector._y = y;
			deflector.update_tile_position();
			global.moveable_objects[sw_tile_x][sw_tile_y] = deflector;
			global.deflector_objects[sw_tile_x][sw_tile_y] = deflector;
			visible = false;
		}
	}
	//END OF DEFLECTORS
	
	//LASER_SWITCHES
	if (instance_exists(obj_icon_laser_switch)) {
		with (obj_icon_laser_switch) {
			var sw_tile_x = x / global.tile_width;
			var sw_tile_y = y / global.tile_height;
			var laser_switch = instance_create_layer(0, 4000, "Event_Layer", obj_laser_switch);
			laser_switch.switch_color = switch_color;
			laser_switch.switch_type = variable_instance_get(id, "switch_type");
			laser_switch.switch_delay = switch_delay;
			laser_switch.laser_key_id = laser_key_id;
			laser_switch.switchables_list = switchables_list;
			laser_switch._x = x;
			laser_switch._y = y;
			laser_switch.update_tile_position();
			global.laser_switch_objects[sw_tile_x][sw_tile_y] = laser_switch;
			visible = false;
		}
	}
	
	//END OF LASER_SWITCHES

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
							if (is_switch_at(i, j)) {
								global.this_floor = self;
								global.floor_objects[i][j] = global.this_floor;
								do_intro(intro_delay);
							}
						}
						
					}else if (data == TILE_DATA.level_exit) {
						with (obj_level_exit) {
							global.this_floor = self;
							global.this_floor._x = global.tile_width * i;
							global.this_floor._y = global.tile_height * j;
							global.this_floor.update_tile_position();
							do_intro(intro_delay);
						}
					} else {
						global.this_floor = get_floor_at(i, j);
						if (global.this_floor != -1) {
							//found a hidden floor already here	
							if (global.this_floor.switch_activated) {
								global.this_floor.do_intro(intro_delay);
							}
							show_debug_message("hidden floor at " + string(i) + "," + string(j));
						} else {
							//CREATE A NEW FLOOR
							global.this_floor = instance_create_layer(0, 0, "Event_Layer", obj_floor);
							global.this_floor.switch_activated = true;
							global.floor_objects[i][j] = global.this_floor;
							global.this_floor._x = global.tile_width * i;
							global.this_floor._y = global.tile_height * j;
							global.this_floor.update_tile_position();
							global.this_floor.do_intro(intro_delay);
						}
					}
					
					//Set any lasers to enter here
					var a_laser = get_laser_at(i, j);
					if (a_laser != -1) {
						a_laser.do_intro(intro_delay);
					}
					
					//Set any laser switches to enter here
					var a_laser_switch = get_laser_switch_at(i, j);
					if (a_laser_switch != -1) {
						a_laser_switch.do_intro(intro_delay);
					}
					
					//set any moveables to enter here
					if (instance_exists(obj_block)) {
						var a_moveable = get_moveable_at(i, j);
						if (a_moveable != -1) {
							a_moveable.do_intro(intro_delay);
						}
					}

					//if player should spawn here, make the player rise up with this floor piece.
					if (player.current_tile_pos[0] == i && player.current_tile_pos[1] == j) {
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

	if (instance_exists(obj_floor_switch)) {
		with (obj_floor_switch) {
			init_switchables();	
		}
	}
	
	if (instance_exists(obj_laser_switch)) {
		with (obj_laser_switch) {
			init_switchables();	
		}
	}
	
	//END OF ASSIGN FLOORS TO SWITCHES
	
	
	show_debug_message("LEVEL CREATED!")
	
}

/// @function notify_room_intro_complete();
function notify_room_intro_complete() {
	show_debug_message("ROOM INTRO COMPLETE");
	global.level_intro_done = true;
	if (instance_exists(obj_girl)) {
		obj_girl.state = GIRL_STATES.idle;
	}	
	
	//TODO: ONLY TURN ON THE LASERS WHICH ARE HOT HIDDEN AND POWERED ON
	for (var i = 0; i < array_length(global.laser_objects); i++) {
		for (var j = 0; j < array_length(global.laser_objects[i]); j++) {
			var laser = global.laser_objects[i][j];
			if (laser != -1) {
				if (laser.switchable) {
					if (laser.off_at_start) {
						laser.switch_activated = false;
						//NOTHING
					} else {
						laser.power_on();
					}
				} else {
					laser.power_on();
				}
			}
		}
	}
}

/// @function notify_room_outro_complete();
function notify_room_outro_complete() {
	//show_debug_message("ROOM OUTRO COMPLETE");
	global.level_completed = true;
	//room_goto_next();//TEST ONLY
}

/// @function notify_box_lost();
function notify_box_lost() {
	//show_debug_message("A BOX HAS BEEN LOST FOREVER");
	global.box_lost = true;
}

function get_floor_at(_tile_x, _tile_y) {
	var this_floor = global.floor_objects[_tile_x][_tile_y];
	if (this_floor != noone) {
		return this_floor;	
	}
	return -1;
}

/// @function get_moveable_at(_tile_x, _tile_y);
function get_moveable_at(_tile_x, _tile_y) {
	//show_debug_message("h_tiles:" + string(room_width / global.tile_width) + ", v_tiles:" + string(room_height / global.tile_height));
	//show_debug_message("get_moveable_at(" + string(_tile_x) + "," + string(_tile_y) +")");
	var this_moveable = global.moveable_objects[_tile_x][_tile_y];
	if (this_moveable != -1) {
		return this_moveable;	
	}
	return -1;
}

/// @function get_laser_at(_tile_x, _tile_y);
function get_laser_at(_tile_x, _tile_y) {
	var this_laser = global.laser_objects[_tile_x][_tile_y];
	if (this_laser != -1) {
		return this_laser;	
	}
	return -1;
}

/// @function get_deflector_at(_tile_x, _tile_y);
function get_deflector_at(_tile_x, _tile_y) {
	var this_deflector = global.deflector_objects[_tile_x][_tile_y];
	if (this_deflector != -1) {
		return this_deflector;	
	}
	return -1;
}

/// @function get_laser_switch_at(_tile_x, _tile_y);
function get_laser_switch_at(_tile_x, _tile_y) {
	var this_laser_switch = global.laser_switch_objects[_tile_x][_tile_y];
	if (this_laser_switch != -1) {
		return this_laser_switch;	
	}
	return -1;
}

/// @function get_floor_circular_arrays(_tile_x, _tile_y);
function get_floor_circular_arrays(_tile_x, _tile_y) {
	
	var x_min = 0;
	var y_min = 0;
	var x_max = (room_width / global.tile_width) -1;
	var y_max = (room_height / global.tile_height) -1;
	
	current_x_min = _tile_x - 1;
	current_x_max = _tile_x + 1;
	current_y_min = _tile_y - 1;
	current_y_max = _tile_y + 1;
	
	var floor_groups = [];
	
	while (current_x_min != x_min || current_x_max != x_max || current_y_min != y_min || current_y_max != y_max) {
		var this_group = [];
		for (var i = current_x_min; i <= current_x_max; i++) {
			for (var j = current_y_min; j <= current_y_max; j++) {
				//FIND A FLOOR
				var a_floor = get_floor_at(i, j);
				if (a_floor != -1) {
					array_push(this_group, a_floor);
				}
				//FIND A MOVEABLE
				var a_moveable = get_moveable_at(i, j);
				if (a_moveable != -1) {
					array_push(this_group, a_moveable);
				}
				
				//FIND A LASER
				var a_laser = get_laser_at(i, j);
				if (a_laser != -1) {
					array_push(this_group, a_laser);
				}
				
				//FIND A LASER SWITCH
				var a_laser_switch = get_laser_switch_at(i, j);
				if (a_laser_switch != -1) {
					array_push(this_group, a_laser_switch);
				}
			}
		}
		
		array_push(floor_groups, this_group);
		
		current_x_min = max(x_min, current_x_min - 1);
		current_x_max = min(current_x_max + 1, x_max);
		current_y_min = max(y_min, current_y_min - 1);
		current_y_max = min(current_y_max + 1, y_max);
		
	}
	
	return floor_groups;
	
}

/// @function calculate_laser();
function calculate_laser(_laser_id, _aim_direction) {
	//set_beams_on(false);
	laser_length = 0;
	var blocked = false;
	var test_position = current_tile_pos;
	var offset = [0, 0];
	
	var horizontal = true;
	
	switch (_aim_direction) {
		
		case LASER_DIRECTIONS.RIGHT:
			offset[0] = 1;
			laser_offset = laser_offset_right;
			laser_offset_end = laser_offset_right_end;
			shadow_on = true;
		break;
		case LASER_DIRECTIONS.DOWN:
			offset[1] = 1;
			laser_offset = laser_offset_down;
			laser_offset_end = laser_offset_down_end;
			shadow_on = false;
			horizontal = false;
		break;
		case LASER_DIRECTIONS.LEFT:
			offset[0] = -1;
			laser_offset = laser_offset_left;
			laser_offset_end = laser_offset_left_end;
			shadow_on = true;
		break;
		case LASER_DIRECTIONS.UP:
			offset[1] = -1;
			laser_offset = laser_offset_up;
			laser_offset_end = laser_offset_up_end;
			shadow_on = false;
			horizontal = false;
		break;
	}
	
	
	while(!blocked) {
		
		beam_list[laser_length].x1 = test_position[0] * global.tile_width;
		beam_list[laser_length].y1 = test_position[1] * global.tile_height;
		
		test_position[0] += offset[0];
		test_position[1] += offset[1];
		
		beam_list[laser_length].x2 = (test_position[0] * global.tile_width);
		beam_list[laser_length].y2 = (test_position[1] * global.tile_height);
		
		if (test_position[0] >= 0 && test_position[0] < room_width / global.tile_width && test_position[1] >= 0 && test_position[1] < room_height / global.tile_height) {
				var a_moveable = get_moveable_at(test_position[0], test_position[1]);
					if (a_moveable != -1) {
						if (a_moveable.current_tile_pos[0] == test_position[0] && a_moveable.current_tile_pos[1] == test_position[1]) {
							//test_position[0] += offset[0] * .25;
						
							if (horizontal) {
								beam_list[laser_length].x2 = a_moveable.x + 16; 
								beam_list[laser_length].y2 += 16;
							} else {
								beam_list[laser_length].y2 = a_moveable.true_y + 16;
								beam_list[laser_length].x2 += 16;
							}
	
							blocked = true;
							
							//TEST IF HIT REFLECTOR
							var deflector = get_deflector_at(test_position[0], test_position[1]);
							if (deflector != -1) {
								hit_object = deflector;
								hit_object.laser_color = laser_color;
								hit_object.do_laser_hit(switch_id, _aim_direction);
							}
	
							laser_length++;
							show_debug_message("LASER BLOCKED, LENGTH:" + string(laser_length));
							return;
						}
					}
				laser_length++;
				
			//TEST IF HIT GIRL
			if (obj_girl.current_tile_pos[0] == test_position[0] && obj_girl.current_tile_pos[1] == test_position[1]) {
				obj_girl.vaporize();
				show_debug_message("GIRL VAPORIZED");
			}
			
			//TEST IF HIT LASER
			var laser = get_laser_at(test_position[0], test_position[1]);
			if (laser != -1) {
				blocked = true;
				laser.laser_color = laser_color;
				beam_list[laser_length -1].x2 += 16; 
				beam_list[laser_length -1].y2 += 16;
				laser.turret_heat++;
			}
			
			//TEST IF HIT REFLECTOR
			var laser_switch = get_laser_switch_at(test_position[0], test_position[1]);
			if (laser_switch != -1) {
				blocked = true;
				beam_list[laser_length -1].x2 += 16; 
				beam_list[laser_length -1].y2 += 16;
				hit_object = laser_switch;
				if (_aim_direction == LASER_DIRECTIONS.LEFT) {
					laser_switch.from_right = true;
				} else if (_aim_direction == LASER_DIRECTIONS.RIGHT) {
					laser_switch.from_left = true;
				}
				laser_switch.do_laser_hit(switch_id);
			}
							
		} else {
			beam_list[laser_length -1].x2 += 16; 
			beam_list[laser_length -1].y2 += 16;
			blocked = true;
		}
	}
}

