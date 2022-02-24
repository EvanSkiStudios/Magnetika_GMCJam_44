global.tile_width = 0;
global.tile_height = 0;
global.floor_objects = 0;
global.spring = 0;

enum TILE_DATA {
	none,
	floor,
}

function init_level(){
	
	global.tile_width = 32;
	global.tile_height = 16;
	//spring = .25;
	//floor_objects = array_create()

	var lay_id = layer_get_id("Floor_Layer");
	layer_set_visible(lay_id, false);//HIDE EDITOR TILES
	var map_id = layer_tilemap_get_id(lay_id);
	var tile_intro_delay = 0;
	var tile_intro_delay_inc = 0.03;//0.01

	for (var i = 0; i < room_width / global.tile_width; i++) {
		for (var j = 0; j < room_height / global.tile_height; j++) {
			
			var data = tilemap_get(map_id, i, j);
			
			 if (data == TILE_DATA.floor) {
					var this_floor = instance_create_layer(0, 0, "Instances", obj_floor);
					this_floor._x = global.tile_width * i;
					this_floor._y = global.tile_height * j;
					this_floor.set_delay(tile_intro_delay);
					tile_intro_delay += tile_intro_delay_inc;
					this_floor.state = FLOOR_STATES.init;
			 }
			
		}
	}
	
	show_debug_message("LEVEL CREATED!")
	
}


function spring_to(target_x, target_y) {
	
}
