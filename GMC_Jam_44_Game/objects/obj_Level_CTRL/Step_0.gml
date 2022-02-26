//TEXT INTROS
switch(room){
	default: case rm_levelselect: global.Level_current = -1; break;
	
	case Level_1:{
		 goto_room = Level_2;
		if (!did_once) && (global.level_intro_done){
			pop_lock();
			
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			did_once = true;
		}
	}break;
	
	case Level_2:{
		 	goto_room = rm_levelselect;
		if (!did_once) && (global.level_intro_done){
			pop_lock();
			
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			did_once = true;
		}
	}break;

}


//TEXT OUTROS
switch(room){
	default: case rm_levelselect: break;
	
	case Level_1:
	case Level_2:{
		if (!room_end_did_once) &&(global.level_end_reached){
			if !instance_exists(obj_ctrl_create_typewriter){
				//global.text_wrap = 700;
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_end_did_once = true;
			do_fade = true;
		}
		
		if (do_fade) && ( (!instance_exists(obj_ctrl_create_typewriter)) && !(instance_exists(obj_ETW_Dialog_Typewriter)) ){
			save_game();
			fadetoroom(goto_room,20,color_purple);
			do_fade = false;
		}
	}break;
}