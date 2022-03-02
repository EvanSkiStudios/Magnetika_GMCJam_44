function girl_death_reset(){
	if !instance_exists(obj_gui_fadeout){
		fadetoroom(room,20,color_purple);
		global.Level_current -= 1;
		GAME_RESET();	
	}
}