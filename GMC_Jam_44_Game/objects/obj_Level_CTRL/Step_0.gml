//TEXT OUTROS


switch(room){
	default: case rm_levelselect: break;
	
	case rm_Level1:{
		if (global.level_end_reached) && (!room_end_did_once){
			if !instance_exists(obj_ctrl_create_typewriter){
				//global.text_wrap = 700;
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_end_did_once = true;
			do_fade = true;
		}
		
		if (do_fade) && ( (!instance_exists(obj_ctrl_create_typewriter)) && !(instance_exists(obj_ETW_Dialog_Typewriter)) ){
			fadetoroom(rm_levelselect,20,color_purple);
			do_fade = false;
		}
	}break;
	
}