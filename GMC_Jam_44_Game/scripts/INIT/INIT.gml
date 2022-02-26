//Init Values and settings for game that get set on startup

#macro DEBUG_MODE true

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

global.lvl_list_array = lvl_array;


//Globals
global.Level_current = -1; //controlls unlocking of levels

global.control_scheme = 0;

global.Audio_master_volume = 1;
global.Audio_sfx_volume = 1;
global.Audio_music_volume = 1;

global.Bloom_Shader_enabled = true;
global.bloom_draw_surface = global.Bloom_Shader_enabled;
global.Bloom_intensity = 0.25;

global.GAMEPAD_ISCONNECTED = false;


function save_game(){
	
	var save_strut = {
		Control_scheme : global.control_scheme,
		Audio_master : global.Audio_master_volume,
		Audio_sfx : global.Audio_sfx_volume,
		Audio_mus : global.Audio_music_volume,
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

	global.control_scheme = game_struct.Control_scheme;
	global.Audio_master_volume = game_struct.Audio_master;
	global.Audio_sfx_volume = game_struct.Audio_sfx;
	global.Audio_music_volume = game_struct.Audio_mus;
	global.Bloom_Shader_enabled = game_struct.Bloom_enabled;
	global.Bloom_intensity = game_struct.Bloom_intensity;

	global.lvl_list_array = game_struct.Level_list;
	
	with(obj_level_selector) event_user(0);
	
	
	show_debug_message("==== GAME LOADED ====");
}


//======================================================================= LOAD THE GAME =======================================================================
load_game();

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
	
	return( (input > 0) ? true : false );
}

function ScreenShot(){
	static num = 0;
	
	var filename = (working_directory + "\\ScreenShots\\Screen_");
	
	//check to see if there is already a png
	var num = ("__"+string(current_hour)+string(current_minute)+"_"+string(current_day)+string(current_month)+string(current_year) );
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