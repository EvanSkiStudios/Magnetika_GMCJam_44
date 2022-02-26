function GAME_RESET(){
	global.level_completed = false;
	global.level_end_reached = false;
	global.level_intro_done = false;
	
	global.text_wrap = 1000;
	
	if instance_exists(obj_ctrl_MainMenu) instance_destroy(obj_ctrl_MainMenu);
	if instance_exists(obj_pause_drawer) instance_destroy(obj_pause_drawer);
	global.GAME_IS_PAUSED = false;
}