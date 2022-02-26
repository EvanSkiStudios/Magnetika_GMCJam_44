if (room == rm_mainmenu) || 
(room == rm_levelselect){
	exit;	
}

if !(global.level_intro_done) exit;

if (instance_exists(obj_ETW_Dialog_Typewriter)) exit;
if (instance_exists(obj_ctrl_create_typewriter)) exit;

if !instance_exists(obj_ctrl_MainMenu){
	if (can_pause && keyboard_check_released(vk_escape)){
		//reset pause flags
		alarm[0] = GAMESPEED;
		
		//Game needs paused
		if !(global.GAME_IS_PAUSED){
			
			global.PLAYER_HAS_CTRL = false;
			instance_create_depth(x,y,-1000,obj_pause_drawer);
			
			global.GAME_IS_PAUSED = true;
			can_pause = false;
		}	
	}
}