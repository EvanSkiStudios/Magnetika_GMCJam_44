//Init Values and settings for game that get set on startup

#macro DEBUG_MODE false
global.Load_save = true;

#region default things
//GAME RES SETTINGS
#macro WINDOW_WIDTH 1280
#macro WINDOW_HEIGHT 720

#macro GAME_RES_WIDTH 640
#macro GAME_RES_HEIGHT 360

#macro GAMESPEED game_get_speed(gamespeed_fps)

#endregion


#macro color_purple $fddebf
#macro color_ltpurple $B55689


#macro Level_1 rm_level_1
#macro Level_2 rm_level_2
#macro Level_3 rm_level_3
#macro Level_4 rm_level_4
#macro Level_5 rm_level_5
#macro Level_6 rm_level_6
#macro Level_7 rm_level_7
#macro Level_8 rm_level_8
#macro Level_9 rm_level_9
#macro Level_10 rm_level_10
#macro Level_11 rm_level_11
#macro Level_12 rm_level_12
#macro Level_13 rm_bonus_level_13
#macro Level_14 rm_bonus_level_19
#macro Level_15 rm_bonus_level_20

//LEVELS
//methodz
lvl_select = function(rm_id, img_id=0, title="ERROR!!", _locked=true) constructor{
	_room = rm_id;
	_pic = img_id;
	_name = string(title);
	_lock = _locked;
}

//create structs
var i = 0;
lvl_array[i] = new lvl_select(Level_1, 1, "Welcome to the Gauss Magnetics Corporation", false);
lvl_array[++i] = new lvl_select(Level_2, 2, "Now with buttons", true);
lvl_array[++i] = new lvl_select(Level_3, 3, "Buttons 2 Electric Boogaloo", true);
lvl_array[++i] = new lvl_select(Level_4, 4, "Retrace your steps", true);
lvl_array[++i] = new lvl_select(Level_5, 5, "The Floor is Falling", true);
lvl_array[++i] = new lvl_select(Level_6, 6, "The Mother F- wait we can't use that name?", true);
lvl_array[++i] = new lvl_select(Level_7, 7, "Buttons Cubed", true);
lvl_array[++i] = new lvl_select(Level_8, 8, "Remote Manipulation", true);
lvl_array[++i] = new lvl_select(Level_9, 9, "Phototricholysis", true);
lvl_array[++i] = new lvl_select(Level_10, 10, "Companion cube", true);
lvl_array[++i] = new lvl_select(Level_11, 11, "Pew Pew Pew", true);
lvl_array[++i] = new lvl_select(Level_12, 12, "Closing in", true);
lvl_array[++i] = new lvl_select(Level_13, 13, "A little Reflection", true);
lvl_array[++i] = new lvl_select(Level_14, 14, "Make Your Way", true);
lvl_array[++i] = new lvl_select(Level_15, 15, "Don't get Lasered", true);

global.lvl_list_array = lvl_array;


//Globals
global.GAME_IS_PAUSED = false;
global.GAMEPAD_ISCONNECTED = false;

global.bloom_surface = -1; //debug to prevent crash with scaffolds

global.control_scheme = 0;
global.Audio_master_volume = 1.0;
global.Audio_sfx_volume = 1.0;
global.Audio_marte_volume = 0.25;
global.Audio_music_volume = 1.0;
global.Bloom_Shader_enabled = true;
global.bloom_draw_surface = global.Bloom_Shader_enabled;
global.Bloom_intensity = 0.25;


function save_game(){
	if (file_exists("SAVE.phrs")) file_delete("SAVE.phrs");
	
	var save_strut = {
		Control_scheme : global.control_scheme,
		Audio_master : global.Audio_master_volume,
		Audio_sfx : global.Audio_sfx_volume,
		Audio_marte : global.Audio_marte_volume,
		Audio_mus : global.Audio_music_volume,
		Fullscreen : window_get_fullscreen(),
		Bloom_enabled : global.Bloom_Shader_enabled,
		Bloom_intensity : global.Bloom_intensity,
		
		Level_list : global.lvl_list_array
	}
	
	var json_string = base64_encode(json_stringify(save_strut));
	var buffer = buffer_create(string_length(json_string)+1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, json_string);
	buffer_save(buffer,"SAVE.phrs");
	buffer_delete(buffer);
	
	show_debug_message("==== GAME SAVED ====");
}

function load_game(){
	if !(file_exists("SAVE.phrs")) return(-1);
	
	var save_file = buffer_load("SAVE.phrs");
	var json_string = buffer_read(save_file,buffer_string);
	buffer_delete(save_file);
		
	json_string = base64_decode(json_string);
	var game_struct = json_parse(json_string);

	if variable_struct_exists(game_struct, "Control_scheme"){	global.control_scheme = game_struct.Control_scheme; };
	if variable_struct_exists(game_struct, "Audio_master"){		global.Audio_master_volume = game_struct.Audio_master; };
	if variable_struct_exists(game_struct, "Audio_sfx"){		global.Audio_sfx_volume = game_struct.Audio_sfx;  };
	if variable_struct_exists(game_struct, "Audio_marte"){		global.Audio_marte_volume = game_struct.Audio_marte;  };
	if variable_struct_exists(game_struct, "Audio_mus"){		global.Audio_music_volume = game_struct.Audio_mus; };
	if variable_struct_exists(game_struct, "Fullscreen"){		window_set_fullscreen(game_struct.Fullscreen); };
	if variable_struct_exists(game_struct, "Bloom_enabled"){	global.Bloom_Shader_enabled = game_struct.Bloom_enabled; };
	if variable_struct_exists(game_struct, "Bloom_intensity"){	global.Bloom_intensity = game_struct.Bloom_intensity; };

	if variable_struct_exists(game_struct, "Level_list"){
		
		var new_lvl_list_array = game_struct.Level_list;
	
		//updates level locks
		var _array_length = array_length(new_lvl_list_array);
		for (var i = 0; i < _array_length; ++i){
			global.lvl_list_array[i]._lock = new_lvl_list_array[i]._lock; 
		}	
	
	}
	
	with(obj_level_selector) event_user(0);
	
	
	show_debug_message("==== GAME LOADED ====");
}

//======================================================================= LOAD THE GAME =======================================================================
if (global.Load_save){
	load_game();
}

function do_event_message (str){
	
	if (!instance_exists(obj_event_messager)) {
		
		var evt_msgr = instance_create_depth(0,0, depth, obj_event_messager);
		evt_msgr.do_message(str);
		
	} else {
			obj_event_messager.do_message(str);
	}
}

//Useful functions for gameplay

function invaild_keys(){
	var input = false;
	input += keyboard_check_pressed(vk_enter);
	input += keyboard_check_pressed(vk_alt);
	input += keyboard_check_pressed(vk_f11);
	input += keyboard_check_pressed(vk_f12);
	input += keyboard_check_pressed(vk_f7);
	input += keyboard_check_pressed(vk_f8);
	
	return( (input > 0) ? true : false );
}

function init_level_create_bloom(){
	var layer_id = layer_get_id("Event_Layer"), bloom_layer_depth = layer_get_depth(layer_id);
	if !(instance_exists(obj_bloom_drawer)) instance_create_depth(0,0,bloom_layer_depth+100,obj_bloom_drawer);	
}

function ScreenShot(){
	static num = 0;
	
	var filename = (working_directory + "\\ScreenShots\\Screen_");
	
	//check to see if there is already a png
	var num = ("_"+string(current_time)+"_"+string(current_day)+string(current_month)+string(current_year) );
	var new_filename = (filename+string(num)+".png");
	
	//save the png
	screen_save(new_filename);
	//add to the number for a future png
	show_debug_message("Screen shot "+string(num)+" saved");
}

function fadetoroom(gotoroom, dur, _color){
	var inst = instance_create_depth(0,0,0,obj_gui_fadeout);
	with (inst){
		targetroom = gotoroom;
		duration = dur;
		color = _color;
	}
}