if (room == rm_mainmenu) || 
(room == rm_levelselect){
	exit;	
}

if !(global.level_intro_done) exit;

if (instance_exists(obj_ETW_Dialog_Typewriter)) exit;
if (instance_exists(obj_ctrl_create_typewriter)) exit;

var gamepad_disconnected = fhInputSystemActionsInputMissing();

if (!(global.GAMEPAD_ISCONNECTED) || (global.control_scheme != 1) || (global.control_scheme != 2)){
	var gamepad_disconnected = false;	
}

if !instance_exists(obj_ctrl_MainMenu){
	if (can_pause && ( (keyboard_check_released(vk_escape)) || (gamepad_disconnected) || (fhi_action_check_pressed(FHINPUTACTION_ActivateMenuAlt)) ) ){
		//reset pause flags
		alarm[0] = GAMESPEED;
		
		//Game needs paused
		if !(global.GAME_IS_PAUSED){

			instance_create_depth(x,y,-1000,obj_pause_drawer);
			
			global.GAME_IS_PAUSED = true;
			can_pause = false;
		}	
	}
}