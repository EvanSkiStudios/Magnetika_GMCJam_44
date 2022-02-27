//TEXT INTROS
if ( (!room_start_did_once) && (!global.level_intro_done) ){
		
	switch(room){
		default: case rm_levelselect: break;
		
		case Level_1:{
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			goto_room = Level_2;
			room_start_did_once = true;
		}break;
		
		
		case Level_2:{
			goto_room = Level_3;
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_start_did_once = true;
		}break;
		
		case Level_3:{	
			goto_room = Level_4;
			room_start_did_once = true;
		}break;
		
		case Level_4:{
			goto_room = rm_levelselect;
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_start_did_once = true;
		}break;
	}
	
}

//TEXT OUTROS
if ( (room_start_did_once) && (!room_end_did_once) && (global.level_end_reached) ){
	switch(room){
		default: case rm_levelselect: break;

		case Level_1:{
			if !instance_exists(obj_ctrl_create_typewriter){
				//global.text_wrap = 700;
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_2:{
			if !instance_exists(obj_ctrl_create_typewriter){
				//global.text_wrap = 700;
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_3:{
				room_end_did_once = true;
				do_fade = true;
		}break;
		
		case Level_4:{
				room_end_did_once = true;
				do_fade = true;
		}break;
	
	}
}

//LEVEL END FADE
if (room != rm_levelselect){
	if (do_fade){ 
		if ( (!instance_exists(obj_ctrl_create_typewriter)) && !(instance_exists(obj_ETW_Dialog_Typewriter)) ){
			if (global.level_completed){
				fadetoroom(goto_room,20,color_purple);
				do_fade = false;
			}
		}
	}
}