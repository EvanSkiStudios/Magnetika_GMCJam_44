function create_menu_page(){
	//["name1", type1, entires1...]
	
	var arg, i = 0;
	repeat(argument_count){
		arg[i] = argument[i];
		++i;
	}
	
	var ds_grid_id = ds_grid_create(5, argument_count);
	i = 0; repeat(argument_count){
		var array = arg[i];
		var array_len = array_length(array);
		
		var xx = 0 repeat(array_len){
			ds_grid_id[# xx, i] = array[xx];
			++xx;
		}
		++i;
	}
	
	return ds_grid_id;

}

function change_fullscreen(){
	window_set_fullscreen( !(window_get_fullscreen()) );
}


function change_bloom(){
	global.Bloom_Shader_enabled = !global.Bloom_Shader_enabled;
}

function change_bloom_intense(){
	global.Bloom_intensity = argument0;
}

function controls_scheme(){
	switch(argument0){
		default:
		case 0:{
			//WASD
			fhInputActionMapSetDefault(0);
			global.control_scheme = 0;
		}break;
		
		case 1:{
			//Arrow keys
			fhInputActionMapSetDefault(3);
			global.control_scheme = 3;
		}break;
		
		case 2:{
			//Gamepad-joystick
			if (global.GAMEPAD_ISCONNECTED){
				fhInputActionMapSetDefault(1);
				global.control_scheme = 1;
			}else{
				fhInputActionMapSetDefault(0);
				global.control_scheme = 0;
				do_event_message("NO GAMEPAD CONNECTED!!");	
			}
		}break;
		
		case 3:{
			//Gamepad-dpad
			if (global.GAMEPAD_ISCONNECTED){
				fhInputActionMapSetDefault(2);
				global.control_scheme = 2;
			}else{
				fhInputActionMapSetDefault(0);
				global.control_scheme = 0;
				do_event_message("NO GAMEPAD CONNECTED!!");	
			}
		}break;
		
	}
}

function resume_game(){
	if (room == rm_mainmenu){
		if instance_exists(obj_Level_CTRL) instance_destroy(obj_Level_CTRL);
		fadetoroom(rm_levelselect,10,color_purple);
	}else{
		instance_destroy(id);	
	}
	
	
}

function exit_game(){
	if (room == rm_mainmenu){
		fadetoroom(QuitGame,20,color_purple);
	}else{
		fadetoroom(rm_levelselect,20,color_purple);	
	}
}

function restart_level(){
	fadetoroom(room,20,color_purple);
	global.Level_current -= 1;
	GAME_RESET();
}


function change_volume(){
	var type = menu_option[page];
	
	switch(type){
		case 0: audio_master_gain(argument0);							global.Audio_master_volume = argument0; break;
		case 1: audio_group_set_gain(AudioGroup_SFX, argument0, 0);		global.Audio_sfx_volume = argument0;	break;
		case 2: audio_group_set_gain(AudioGroup_Music, argument0, 0);	global.Audio_music_volume = argument0;	break;
	}
}