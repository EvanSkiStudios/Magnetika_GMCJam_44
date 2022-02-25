//Init Values and settings for game that get set on startup

#region default things
//GAME RES SETTINGS
#macro WINDOW_WIDTH 1280
#macro WINDOW_HEIGHT 720

#macro GAME_RES_WIDTH 640
#macro GAME_RES_HEIGHT 360

//Direction macros
#macro DIR_RIGHT 0
#macro DIR_UP 90
#macro DIR_LEFT 180
#macro DIR_DOWN 270

#macro GAMESPEED game_get_speed(gamespeed_fps)

#endregion

#macro USER_NAME string(environment_get_variable("USERNAME"))

#macro color_purple $fddebf
#macro color_ltpurple $B55689

global.GAMEPAD_ISCONNECTED = false;

function do_event_message (str){
	
	if (!instance_exists(obj_event_messager)) {
		
		var evt_msgr = instance_create_depth(0,0, depth, obj_event_messager);
		evt_msgr.do_message(str);
		
	} else {
			obj_event_messager.do_message(str);
	}
}