//TEXT INTROS
if ( (!room_start_did_once) && (!global.level_intro_done) ){
		
	switch(room){
		default: case rm_levelselect: break;
		
		case Level_1:{
			goto_room = Level_2;
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
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
			goto_room = Level_5;
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_start_did_once = true;
		}break;
		
		case Level_5:{
			goto_room = Level_6;
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_start_did_once = true;
		}break;
		
		case Level_6:{
			goto_room = Level_7;
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_start_did_once = true;
		}break;
		
		case Level_7:{	
			goto_room = Level_8;
			room_start_did_once = true;
		}break;
		
		case Level_8:{	
			goto_room = Level_9;
			room_start_did_once = true;
		}break;
		
		case Level_9:{
			goto_room = Level_10;
			if !instance_exists(obj_ctrl_create_typewriter){
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_start_did_once = true;
		}break;
		
		case Level_10:{	
			goto_room = Level_11;
			room_start_did_once = true;
		}break;
		
		case Level_11:{	
			goto_room = Level_12;
			room_start_did_once = true;
		}break;
		
		case Level_12:{	
			goto_room = rm_credits;
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
			if !instance_exists(obj_ctrl_create_typewriter){
				//global.text_wrap = 700;
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_5:{
			if !instance_exists(obj_ctrl_create_typewriter){
				//global.text_wrap = 700;
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_6:{
			if !instance_exists(obj_ctrl_create_typewriter){
				//global.text_wrap = 700;
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_7:{
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_8:{
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_9:{
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_10:{
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_11:{
			if !instance_exists(obj_ctrl_create_typewriter){
				//global.text_wrap = 700;
				instance_create_depth(32,288,0,obj_ctrl_create_typewriter);
			}
			room_end_did_once = true;
			do_fade = true;
		}break;
		
		case Level_12:{
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